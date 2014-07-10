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
