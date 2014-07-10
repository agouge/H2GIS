CREATE TABLE CORMEN(
    THE_GEOM LINESTRING,
    ID INT AUTO_INCREMENT PRIMARY KEY,
    WEIGHT DOUBLE,
    EDGE_ORIENTATION INT);
INSERT INTO CORMEN VALUES 
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

CALL ST_Graph('CORMEN');

CREATE TABLE CORMEN_EDGES_ALL AS
    SELECT A.*, B.*
    FROM CORMEN A, CORMEN_EDGES B
    WHERE A.ID=B.EDGE_ID;

DROP TABLE IF EXISTS CORMEN_DISC;
CREATE TABLE CORMEN_DISC(THE_GEOM LINESTRING,
                         ID INT AUTO_INCREMENT PRIMARY KEY,
                         WEIGHT DOUBLE,
                         EDGE_ORIENTATION INT) AS
    SELECT * FROM CORMEN;
INSERT INTO CORMEN_DISC VALUES
    ('LINESTRING (3 1, 4 2)', DEFAULT, 1.0, 1),
    ('LINESTRING (4 2, 5 2)', DEFAULT, 2.0, 1);

CALL ST_Graph('CORMEN_DISC');

CREATE TABLE CORMEN_DISC_EDGES_ALL AS
    SELECT A.*, B.*
    FROM CORMEN_DISC A, CORMEN_DISC_EDGES B
    WHERE A.ID=B.EDGE_ID;

-- ________________________ ST_ShortestPath ________________________

SELECT * FROM
    ST_ShortestPath('CORMEN_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 5, 1);

-- In this example, the shortest path is just one edge:
-- THE_GEOM  	EDGE_ID  	PATH_ID  	PATH_EDGE_ID  	SOURCE  	DESTINATION  	WEIGHT  
-- LINESTRING (2 0, 0 1)	10	1	1	5	1	7.0

SELECT * FROM
    ST_ShortestPath('CORMEN_EDGES_ALL',
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
    ST_ShortestPath('CORMEN_EDGES_ALL', 
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

SELECT * FROM
    ST_ShortestPath('CORMEN_DISC_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 3, 6);
-- Vertex 6 is not reachable from vertex 3.
-- THE_GEOM  	EDGE_ID  	PATH_ID  	PATH_EDGE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- null	-1	-1	-1	3	6	Infinity

-- _____________________ ST_ShortestPathLength _____________________

SELECT * FROM
    ST_ShortestPathLength('CORMEN_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 1, 5);

-- ST_ShortestPathLength always returns a table
-- SOURCE  	DESTINATION  	DISTANCE  
-- 1	5	7.0

SELECT DISTANCE FROM
    ST_ShortestPathLength('CORMEN_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 1, 5);
-- We can obtain just the distance if we want:
-- DISTANCE  
-- 7.0

SELECT * FROM
    ST_ShortestPathLength('CORMEN_DISC_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 3, 6);
-- Vertex 6 is not reachable from vertex 3.
-- SOURCE  	DESTINATION  	DISTANCE
-- 3	6	Infinity

-- ______________________ ST_ShortestPathTree ______________________

SELECT * FROM
    ST_ShortestPathTree('CORMEN_EDGES_ALL',
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
    ST_ShortestPathTree('CORMEN_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT', 1, 6.1);

-- Limiting by a search radius of 6.1 reduces the SPT to a single edge.
--
-- THE_GEOM  	EDGE_ID  	TREE_ID  	SOURCE  	DESTINATION  	WEIGHT
-- LINESTRING (0 1, 1 0)	5	1	1	3	5.0

-- ________________________ ST_GraphAnalysis ________________________

CALL ST_GraphAnalysis('CORMEN_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT');

-- SELECT * FROM CORMEN_EDGES_ALL_NODE_CENT
--
-- NODE_ID  	BETWEENNESS  	CLOSENESS
-- 1	0.0	0.12121212121212122
-- 2	0.3333333333333333	0.14814814814814814
-- 3	0.8333333333333334	0.18181818181818182
-- 4	0.3333333333333333	0.21052631578947367
-- 5	1.0	0.13793103448275862
--
-- SELECT * FROM CORMEN_EDGES_ALL_EDGE_CENT
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

CALL ST_GraphAnalysis('CORMEN_DISC_EDGES_ALL',
        'directed - EDGE_ORIENTATION',
        'WEIGHT');

-- Notice that
-- * All closeness values are zero because the graph is not strongly connected
-- * Vertex 5 is the vertex on the most shortest paths
-- * Vertices 1, 6 and 8 have betweenness values of zero
--
-- SELECT * FROM CORMEN_DISC_EDGES_ALL_NODE_CENT ORDER BY BETWEENNESS DESC;
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
-- SELECT * FROM CORMEN_DISC_EDGES_ALL_EDGE_CENT ORDER BY BETWEENNESS DESC;
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
