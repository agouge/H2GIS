DROP TABLE IF EXISTS INPUT;
CREATE TABLE INPUT(THE_GEOM LINESTRING,
                   ID INT AUTO_INCREMENT PRIMARY KEY,
                   WEIGHT DOUBLE,
                   EDGE_ORIENTATION INT);
INSERT INTO INPUT VALUES
    ('LINESTRING (0 1, 1 2)', DEFAULT, 10.0, 1),
    ('LINESTRING (1 2, 2 2)', DEFAULT, 1.0, -1),
    ('LINESTRING (1 2, 0.75 1, 1 0)', DEFAULT, 2.0,  1),
    ('LINESTRING (1 0, 1.25 1, 1 2)', DEFAULT, 3.0,  1),
    ('LINESTRING (0 1, 1 0)', DEFAULT, 5.0,  1),
    ('LINESTRING (1 0, 2 2)', DEFAULT, 9.0,  1),
    ('LINESTRING (1 0, 2 0)', DEFAULT, 2.0,  1),
    ('LINESTRING (2 2, 1.75 1, 2 0)', DEFAULT, 4.0,  1),
    ('LINESTRING (2 0, 2.25 1, 2 2)', DEFAULT, 6.0,  1),
    ('LINESTRING (2 0, 0 1)', DEFAULT, 7.0,  0);

-- SELECT * FROM INPUT;
--
-- THE_GEOM  	ID  	WEIGHT  	EDGE_ORIENTATION
-- LINESTRING (0 1, 1 2)	1	10.0	1
-- LINESTRING (1 2, 2 2)	2	1.0	-1
-- LINESTRING (1 2, 0.75 1, 1 0)	3	2.0	1
-- LINESTRING (1 0, 1.25 1, 1 2)	4	3.0	1
-- LINESTRING (0 1, 1 0)	5	5.0	1
-- LINESTRING (1 0, 2 2)	6	9.0	1
-- LINESTRING (1 0, 2 0)	7	2.0	1
-- LINESTRING (2 2, 1.75 1, 2 0)	8	4.0	1
-- LINESTRING (2 0, 2.25 1, 2 2)	9	6.0	1
-- LINESTRING (2 0, 0 1)	10	7.0	0

DROP TABLE IF EXISTS INPUT_DISC;
CREATE TABLE INPUT_DISC(THE_GEOM LINESTRING,
                        ID INT AUTO_INCREMENT PRIMARY KEY,
                        WEIGHT DOUBLE,
                        EDGE_ORIENTATION INT) AS
    SELECT * FROM INPUT;
INSERT INTO INPUT_DISC VALUES
    ('LINESTRING (3 1, 4 2)', DEFAULT, 1.0, 1),
    ('LINESTRING (4 2, 5 2)', DEFAULT, 2.0, 1);

-- SELECT * FROM INPUT_DISC;
--
-- THE_GEOM  	ID  	WEIGHT  	EDGE_ORIENTATION
-- LINESTRING (0 1, 1 2)	1	10.0	1
-- LINESTRING (1 2, 2 2)	2	1.0	-1
-- LINESTRING (1 2, 0.75 1, 1 0)	3	2.0	1
-- LINESTRING (1 0, 1.25 1, 1 2)	4	3.0	1
-- LINESTRING (0 1, 1 0)	5	5.0	1
-- LINESTRING (1 0, 2 2)	6	9.0	1
-- LINESTRING (1 0, 2 0)	7	2.0	1
-- LINESTRING (2 2, 1.75 1, 2 0)	8	4.0	1
-- LINESTRING (2 0, 2.25 1, 2 2)	9	6.0	1
-- LINESTRING (2 0, 0 1)	10	7.0	0
-- LINESTRING (3 1, 4 2)	11	1.0	1
-- LINESTRING (4 2, 5 2)	12	2.0	1

DROP TABLE IF EXISTS INPUT_NODES;
DROP TABLE IF EXISTS INPUT_EDGES;
CALL ST_Graph('INPUT');

-- SELECT * FROM INPUT_NODES;
--
-- NODE_ID  	THE_GEOM
-- 1	POINT (0 1)
-- 2	POINT (1 2)
-- 3	POINT (1 0)
-- 4	POINT (2 2)
-- 5	POINT (2 0)
--
-- SELECT * FROM INPUT_EDGES;
--
-- EDGE_ID  	START_NODE  	END_NODE
-- 1	1	2
-- 2	2	4
-- 3	2	3
-- 4	3	2
-- 5	1	3
-- 6	3	4
-- 7	3	5
-- 8	4	5
-- 9	5	4
-- 10	5	1

DROP TABLE IF EXISTS INPUT_DISC_NODES;
DROP TABLE IF EXISTS INPUT_DISC_EDGES;
CALL ST_Graph('INPUT_DISC');

-- SELECT * FROM INPUT_DISC_NODES;
--
-- NODE_ID  	THE_GEOM
-- 1	POINT (0 1)
-- 2	POINT (1 2)
-- 3	POINT (1 0)
-- 4	POINT (2 2)
-- 5	POINT (2 0)
-- 6	POINT (3 1)
-- 7	POINT (4 2)
-- 8	POINT (5 2)
--
-- SELECT * FROM INPUT_DISC_EDGES;
--
-- EDGE_ID  	START_NODE  	END_NODE
-- 1	1	2
-- 2	2	4
-- 3	2	3
-- 4	3	2
-- 5	1	3
-- 6	3	4
-- 7	3	5
-- 8	4	5
-- 9	5	4
-- 10	5	1
-- 11	6	7
-- 12	7	8

-- ____________________ ST_ConnectedComponents  ____________________

-- ST_ConnectedComponents needs the edge orientation, which by default is not
-- copied over by ST_Graph.
DROP TABLE IF EXISTS INPUT_EDGES_EO;
CREATE TABLE INPUT_EDGES_EO AS
    SELECT B.*, A.EDGE_ORIENTATION
    FROM INPUT A, INPUT_EDGES B
    WHERE A.ID=B.EDGE_ID;

-- SELECT * FROM INPUT_EDGES_EO;
--
-- EDGE_ID  	START_NODE  	END_NODE  	EDGE_ORIENTATION
-- 1	1	2	1
-- 2	2	4	-1
-- 3	2	3	1
-- 4	3	2	1
-- 5	1	3	1
-- 6	3	4	1
-- 7	3	5	1
-- 8	4	5	1
-- 9	5	4	1
-- 10	5	1	0

-- Calculate the *strongly* connected components.
DROP TABLE IF EXISTS INPUT_EDGES_EO_NODE_CC;
DROP TABLE IF EXISTS INPUT_EDGES_EO_EDGE_CC;
CALL ST_ConnectedComponents('INPUT_EDGES_EO',
        'directed - EDGE_ORIENTATION');

-- On a strongly connected graph, we only have one strongly connected
-- component.
--
-- SELECT * FROM INPUT_EDGES_EO_NODE_CC;
--
-- NODE_ID  	CONNECTED_COMPONENT
-- 1	1
-- 2	1
-- 3	1
-- 4	1
-- 5	1
--
-- TODO: Where is edge -10?
--
-- SELECT * FROM INPUT_EDGES_EO_EDGE_CC;
--
-- EDGE_ID  	CONNECTED_COMPONENT
-- 1	1
-- 2	1
-- 3	1
-- 4	1
-- 5	1
-- 6	1
-- 7	1
-- 8	1
-- 9	1
-- 10	1

-- ST_ConnectedComponents needs the edge orientation, which by default is not
-- copied over by ST_Graph.
DROP TABLE IF EXISTS INPUT_DISC_EDGES_EO;
CREATE TABLE INPUT_DISC_EDGES_EO AS
    SELECT B.*, A.EDGE_ORIENTATION
    FROM INPUT_DISC A, INPUT_DISC_EDGES B
    WHERE A.ID=B.EDGE_ID;

-- SELECT * FROM INPUT_DISC_EDGES_EO;
--
-- EDGE_ID  	START_NODE  	END_NODE  	EDGE_ORIENTATION
-- 1	1	2	1
-- 2	2	4	-1
-- 3	2	3	1
-- 4	3	2	1
-- 5	1	3	1
-- 6	3	4	1
-- 7	3	5	1
-- 8	4	5	1
-- 9	5	4	1
-- 10	5	1	0
-- 11	6	7	1
-- 12	7	8	1

DROP TABLE IF EXISTS INPUT_EDGES_EO_NODE_CC;
DROP TABLE IF EXISTS INPUT_EDGES_EO_EDGE_CC;
CALL ST_ConnectedComponents('INPUT_DISC_EDGES_EO',
        'directed - EDGE_ORIENTATION');

-- SELECT * FROM INPUT_DISC_EDGES_EO_NODE_CC;
--
-- We have on large SCC (numbered 4) and three isolated vertices (which are in
-- their own SCC).
-- NODE_ID  	CONNECTED_COMPONENT
-- 1	4
-- 2	4
-- 3	4
-- 4	4
-- 5	4
-- 6	1
-- 7	2
-- 8	3
--
-- We have on large SCC (numbered 4) and two edges in no SCC.
-- TODO: Where is edge -10?
--
-- SELECT * FROM INPUT_DISC_EDGES_EO_EDGE_CC;
--
-- EDGE_ID  	CONNECTED_COMPONENT
-- 1	4
-- 2	4
-- 3	4
-- 4	4
-- 5	4
-- 6	4
-- 7	4
-- 8	4
-- 9	4
-- 10	4
-- 11	-1
-- 12	-1

-- ________________________ ST_ShortestPath ________________________

CREATE TABLE INPUT_EDGES_ALL(
    THE_GEOM LINESTRING,
    ID INT AUTO_INCREMENT PRIMARY KEY,
    WEIGHT DOUBLE,
    EDGE_ORIENTATION INT) AS
    SELECT A.*, B.*
    FROM INPUT A, INPUT_EDGES B
    WHERE A.ID=B.EDGE_ID;

SELECT * FROM
    ST_ShortestPath('INPUT_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 5, 1);

-- In this example, the shortest path is just one edge:
-- THE_GEOM  	EDGE_ID  	PATH_ID  	PATH_EDGE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- LINESTRING (2 0, 0 1)	10	1	1	5	1	7.0

SELECT * FROM
    ST_ShortestPath('INPUT_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 1, 5);

-- In this example, there are actually two shortest paths
-- (and two possible path numberings):
-- FIRST NUMBERING:
-- THE_GEOM  	EDGE_ID  	PATH_ID  	PATH_EDGE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- LINESTRING (1 0, 2 0)	7	1	1	3	5	2.0
-- LINESTRING (0 1, 1 0)	5	1	2	1	3	5.0
-- LINESTRING (2 0, 0 1)	-10	2	1	1	5	7.0
-- SECOND NUMBERING:
-- THE_GEOM  	EDGE_ID  	PATH_ID  	PATH_EDGE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- LINESTRING (2 0, 0 1)	-10	1	1	1	5	7.0
-- LINESTRING (1 0, 2 0)	7	2	1	3	5	2.0
-- LINESTRING (0 1, 1 0)	5	2	2	1	3	5.0

SELECT * FROM
    ST_ShortestPath('INPUT_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 1, 4);

-- Here is a more complicated example for path numbering.
-- Paths:
--   5    7    9
-- 1 -> 3 -> 5 -> 4
--   \       ^
--    \-----/
--      -10
--
-- NUMBERING 1:
--  1.3  1.2  1.1
-- 1 -> 3 -> 5 -> 4
--   \       ^
--    \-----/
--      2.1
--
-- THE_GEOM  	EDGE_ID  	PATH_ID  	PATH_EDGE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- LINESTRING (2 0, 2.25 1, 2 2)	9	1	1	5	4	6.0
-- LINESTRING (1 0, 2 0)	7	1	2	3	5	2.0
-- LINESTRING (0 1, 1 0)	5	1	3	1	3	5.0
-- LINESTRING (2 0, 0 1)	-10	2	2	1	5	7.0
--
-- Numbering 2:
--  2.3  2.2  1.1
-- 1 -> 3 -> 5 -> 4
--   \       ^
--    \-----/
--      1.2
--
-- THE_GEOM  	EDGE_ID  	PATH_ID  	PATH_EDGE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- LINESTRING (2 0, 2.25 1, 2 2)	9	1	1	5	4	6.0
-- LINESTRING (2 0, 0 1)	-10	1	2	1	5	7.0
-- LINESTRING (1 0, 2 0)	7	2	2	3	5	2.0
-- LINESTRING (0 1, 1 0)	5	2	3	1	3	5.0

CREATE TABLE INPUT_DISC_EDGES_ALL AS
    SELECT A.*, B.*
    FROM INPUT_DISC A, INPUT_DISC_EDGES B
    WHERE A.ID=B.EDGE_ID;

SELECT * FROM
    ST_ShortestPath('INPUT_DISC_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 3, 6);
-- Vertex 6 is not reachable from vertex 3.
-- THE_GEOM  	EDGE_ID  	PATH_ID  	PATH_EDGE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- null	-1	-1	-1	3	6	Infinity

-- _____________________ ST_ShortestPathLength _____________________

SELECT * FROM
    ST_ShortestPathLength('INPUT_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 1, 5);

-- ST_ShortestPathLength always returns a table
-- SOURCE  	DESTINATION  	DISTANCE
-- 1	5	7.0

SELECT DISTANCE FROM
    ST_ShortestPathLength('INPUT_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 1, 5);
-- We can obtain just the distance if we want:
-- DISTANCE
-- 7.0

SELECT * FROM
    ST_ShortestPathLength('INPUT_DISC_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 3, 6);
-- Vertex 6 is not reachable from vertex 3.
-- SOURCE  	DESTINATION  	DISTANCE
-- 3	6	Infinity

-- ______________________ ST_ShortestPathTree ______________________

SELECT * FROM
    ST_ShortestPathTree('INPUT_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 1);

-- Notice this is not really a "tree" in the mathematical sense since there are
-- two shortest paths from vertex 1 to vertex 5.
--
-- THE_GEOM  	EDGE_ID  	TREE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- LINESTRING (1 0, 1.25 1, 1 2)	4	1	3	2	3.0
-- LINESTRING (2 0, 2.25 1, 2 2)	9	2	5	4	6.0
-- LINESTRING (0 1, 1 0)	5	3	1	3	5.0
-- LINESTRING (1 0, 2 0)	7	4	3	5	2.0
-- LINESTRING (2 0, 0 1)	-10	5	1	5	7.0

SELECT * FROM
    ST_ShortestPathTree('INPUT_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 1, 6.1);

-- Limiting by a search radius of 6.1 reduces the SPT to a single edge.
--
-- THE_GEOM  	EDGE_ID  	TREE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- LINESTRING (0 1, 1 0)	5	1	1	3	5.0

-- In the next two examples, which SPT we obtain can be totally different
-- depending on our starting vertex.

SELECT * FROM
    ST_ShortestPathTree('INPUT_DISC_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 1);

-- We never make it to the other connected component.
--
-- THE_GEOM  	EDGE_ID  	TREE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- LINESTRING (1 0, 1.25 1, 1 2)	4	1	3	2	3.0
-- LINESTRING (2 0, 2.25 1, 2 2)	9	2	5	4	6.0
-- LINESTRING (0 1, 1 0)	5	3	1	3	5.0
-- LINESTRING (2 0, 0 1)	-10	4	1	5	7.0
-- LINESTRING (1 0, 2 0)	7	5	3	5	2.0

SELECT * FROM
    ST_ShortestPathTree('INPUT_DISC_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 6);

-- We never make it to the other connected component.
--
-- THE_GEOM  	EDGE_ID  	TREE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- LINESTRING (3 1, 4 2)	11	1	6	7	1.0
-- LINESTRING (4 2, 5 2)	12	2	7	8	2.0

-- ________________________ ST_GraphAnalysis ________________________

CALL ST_GraphAnalysis('INPUT_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT');

-- SELECT * FROM INPUT_EDGES_ALL_NODE_CENT
--
-- NODE_ID  	BETWEENNESS  	CLOSENESS
-- 1	0.0	0.12121212121212122
-- 2	0.3333333333333333	0.14814814814814814
-- 3	0.8333333333333334	0.18181818181818182
-- 4	0.3333333333333333	0.21052631578947367
-- 5	1.0	0.13793103448275862
--
-- SELECT * FROM INPUT_EDGES_ALL_EDGE_CENT
--
-- EDGE_ID  	BETWEENNESS
-- -10	0.14285714285714285
-- 1	0.0
-- 2	0.5714285714285714
-- 3	0.8571428571428571
-- 4	0.2857142857142857
-- 5	0.42857142857142855
-- 6	0.0
-- 7	1.0
-- 8	0.2857142857142857
-- 9	0.8571428571428571
-- 10	0.5714285714285714

CALL ST_GraphAnalysis('INPUT_DISC_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT');

-- Notice that
-- * All closeness values are zero because the graph is not strongly connected
-- * Vertex 5 is the vertex on the most shortest paths
-- * Vertices 1, 6 and 8 have betweenness values of zero
--
-- SELECT * FROM INPUT_DISC_EDGES_ALL_NODE_CENT ORDER BY BETWEENNESS DESC;
--
-- NODE_ID  	BETWEENNESS  	CLOSENESS
-- 5	1.0	0.0
-- 3	0.8333333333333334	0.0
-- 2	0.3333333333333333	0.0
-- 4	0.3333333333333333	0.0
-- 7	0.16666666666666666	0.0
-- 8	0.0	0.0
-- 1	0.0	0.0
-- 6	0.0	0.0
--
-- Notice that
-- * Edge 7 is the edge on the most shortest paths
-- * Edge 10 is on more shortest paths than edge -10
-- * Edges 1 and 6 are on no shortest paths
--
-- SELECT * FROM INPUT_DISC_EDGES_ALL_EDGE_CENT ORDER BY BETWEENNESS DESC;
--
-- EDGE_ID  	BETWEENNESS
-- 7	1.0
-- 9	0.8571428571428571
-- 3	0.8571428571428571
-- 10	0.5714285714285714
-- 2	0.5714285714285714
-- 5	0.42857142857142855
-- 4	0.2857142857142857
-- 8	0.2857142857142857
-- 11	0.2857142857142857
-- 12	0.2857142857142857
-- -10	0.14285714285714285
-- 6	0.0
-- 1	0.0
