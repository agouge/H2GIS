DROP TABLE IF EXISTS TREES;
CREATE TABLE TREES(TREE_ID INT,
                   EDGE_ID INT,
                   SOURCE INT,
                   DESTINATION INT,
                   WEIGHT DOUBLE);
INSERT INTO TREES
    SELECT 1, * FROM
        ST_ShortestPathTree('EDGES_EO_W',
                            'directed - EDGE_ORIENTATION',
                            'WEIGHT', 1);
INSERT INTO TREES
    SELECT 2, * FROM
        ST_ShortestPathTree('EDGES_EO_W',
                            'directed - EDGE_ORIENTATION',
                            'WEIGHT', 2);
INSERT INTO TREES
    SELECT 3, * FROM
        ST_ShortestPathTree('EDGES_EO_W',
                            'directed - EDGE_ORIENTATION',
                            'WEIGHT', 3);
INSERT INTO TREES
    SELECT 4, * FROM
        ST_ShortestPathTree('EDGES_EO_W',
                            'directed - EDGE_ORIENTATION',
                            'WEIGHT', 4);
INSERT INTO TREES
    SELECT 5, * FROM
        ST_ShortestPathTree('EDGES_EO_W',
                            'directed - EDGE_ORIENTATION',
                            'WEIGHT', 5);
