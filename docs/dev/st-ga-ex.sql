-- Calculate the shortest paths.
DROP TABLE IF EXISTS SP1_2;
CREATE TABLE SP1_2 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 1, 2);
DROP TABLE IF EXISTS SP1_3;
CREATE TABLE SP1_3 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 1, 3);
DROP TABLE IF EXISTS SP1_4;
CREATE TABLE SP1_4 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 1, 4);
DROP TABLE IF EXISTS SP1_5;
CREATE TABLE SP1_5 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 1, 5);
DROP TABLE IF EXISTS SP1_6;
CREATE TABLE SP1_6 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 1, 6);
DROP TABLE IF EXISTS SP1_7;
CREATE TABLE SP1_7 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 1, 7);
DROP TABLE IF EXISTS SP1_8;
CREATE TABLE SP1_8 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 1, 8);
DROP TABLE IF EXISTS SP2_1;
CREATE TABLE SP2_1 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 2, 1);
DROP TABLE IF EXISTS SP2_3;
CREATE TABLE SP2_3 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 2, 3);
DROP TABLE IF EXISTS SP2_4;
CREATE TABLE SP2_4 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 2, 4);
DROP TABLE IF EXISTS SP2_5;
CREATE TABLE SP2_5 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 2, 5);
DROP TABLE IF EXISTS SP2_6;
CREATE TABLE SP2_6 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 2, 6);
DROP TABLE IF EXISTS SP2_7;
CREATE TABLE SP2_7 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 2, 7);
DROP TABLE IF EXISTS SP2_8;
CREATE TABLE SP2_8 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 2, 8);
DROP TABLE IF EXISTS SP3_1;
CREATE TABLE SP3_1 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 3, 1);
DROP TABLE IF EXISTS SP3_2;
CREATE TABLE SP3_2 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 3, 2);
DROP TABLE IF EXISTS SP3_4;
CREATE TABLE SP3_4 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 3, 4);
DROP TABLE IF EXISTS SP3_5;
CREATE TABLE SP3_5 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 3, 5);
DROP TABLE IF EXISTS SP3_6;
CREATE TABLE SP3_6 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 3, 6);
DROP TABLE IF EXISTS SP3_7;
CREATE TABLE SP3_7 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 3, 7);
DROP TABLE IF EXISTS SP3_8;
CREATE TABLE SP3_8 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 3, 8);
DROP TABLE IF EXISTS SP4_1;
CREATE TABLE SP4_1 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 4, 1);
DROP TABLE IF EXISTS SP4_2;
CREATE TABLE SP4_2 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 4, 2);
DROP TABLE IF EXISTS SP4_3;
CREATE TABLE SP4_3 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 4, 3);
DROP TABLE IF EXISTS SP4_5;
CREATE TABLE SP4_5 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 4, 5);
DROP TABLE IF EXISTS SP4_6;
CREATE TABLE SP4_6 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 4, 6);
DROP TABLE IF EXISTS SP4_7;
CREATE TABLE SP4_7 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 4, 7);
DROP TABLE IF EXISTS SP4_8;
CREATE TABLE SP4_8 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 4, 8);
DROP TABLE IF EXISTS SP5_1;
CREATE TABLE SP5_1 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 5, 1);
DROP TABLE IF EXISTS SP5_2;
CREATE TABLE SP5_2 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 5, 2);
DROP TABLE IF EXISTS SP5_3;
CREATE TABLE SP5_3 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 5, 3);
DROP TABLE IF EXISTS SP5_4;
CREATE TABLE SP5_4 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 5, 4);
DROP TABLE IF EXISTS SP5_6;
CREATE TABLE SP5_6 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 5, 6);
DROP TABLE IF EXISTS SP5_7;
CREATE TABLE SP5_7 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 5, 7);
DROP TABLE IF EXISTS SP5_8;
CREATE TABLE SP5_8 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 5, 8);
DROP TABLE IF EXISTS SP6_1;
CREATE TABLE SP6_1 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 6, 1);
DROP TABLE IF EXISTS SP6_2;
CREATE TABLE SP6_2 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 6, 2);
DROP TABLE IF EXISTS SP6_3;
CREATE TABLE SP6_3 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 6, 3);
DROP TABLE IF EXISTS SP6_4;
CREATE TABLE SP6_4 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 6, 4);
DROP TABLE IF EXISTS SP6_5;
CREATE TABLE SP6_5 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 6, 5);
DROP TABLE IF EXISTS SP6_7;
CREATE TABLE SP6_7 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 6, 7);
DROP TABLE IF EXISTS SP6_8;
CREATE TABLE SP6_8 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 6, 8);
DROP TABLE IF EXISTS SP7_1;
CREATE TABLE SP7_1 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 7, 1);
DROP TABLE IF EXISTS SP7_2;
CREATE TABLE SP7_2 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 7, 2);
DROP TABLE IF EXISTS SP7_3;
CREATE TABLE SP7_3 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 7, 3);
DROP TABLE IF EXISTS SP7_4;
CREATE TABLE SP7_4 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 7, 4);
DROP TABLE IF EXISTS SP7_5;
CREATE TABLE SP7_5 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 7, 5);
DROP TABLE IF EXISTS SP7_6;
CREATE TABLE SP7_6 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 7, 6);
DROP TABLE IF EXISTS SP7_8;
CREATE TABLE SP7_8 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 7, 8);
DROP TABLE IF EXISTS SP8_1;
CREATE TABLE SP8_1 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 8, 1);
DROP TABLE IF EXISTS SP8_2;
CREATE TABLE SP8_2 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 8, 2);
DROP TABLE IF EXISTS SP8_3;
CREATE TABLE SP8_3 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 8, 3);
DROP TABLE IF EXISTS SP8_4;
CREATE TABLE SP8_4 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 8, 4);
DROP TABLE IF EXISTS SP8_5;
CREATE TABLE SP8_5 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 8, 5);
DROP TABLE IF EXISTS SP8_6;
CREATE TABLE SP8_6 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 8, 6);
DROP TABLE IF EXISTS SP8_7;
CREATE TABLE SP8_7 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 8, 7);

-- Number of shortest paths from 4 to 1
SELECT MAX(PATH_ID) FROM SP4_1;

-- Construct the number of shortest paths matrix.
DROP TABLE IF EXISTS N_SP;
CREATE TABLE N_SP(SOURCE INT, DESTINATION INT, N_SPS INT);
@loop 8 INSERT INTO N_SP VALUES (?+1, ?+1, 1);
INSERT INTO N_SP VALUES (1, 2, SELECT MAX(PATH_ID) FROM SP1_2);
INSERT INTO N_SP VALUES (1, 3, SELECT MAX(PATH_ID) FROM SP1_3);
INSERT INTO N_SP VALUES (1, 4, SELECT MAX(PATH_ID) FROM SP1_4);
INSERT INTO N_SP VALUES (1, 5, SELECT MAX(PATH_ID) FROM SP1_5);
INSERT INTO N_SP VALUES (1, 6, SELECT MAX(PATH_ID) FROM SP1_6);
INSERT INTO N_SP VALUES (1, 7, SELECT MAX(PATH_ID) FROM SP1_7);
INSERT INTO N_SP VALUES (1, 8, SELECT MAX(PATH_ID) FROM SP1_8);
INSERT INTO N_SP VALUES (2, 1, SELECT MAX(PATH_ID) FROM SP2_1);
INSERT INTO N_SP VALUES (2, 3, SELECT MAX(PATH_ID) FROM SP2_3);
INSERT INTO N_SP VALUES (2, 4, SELECT MAX(PATH_ID) FROM SP2_4);
INSERT INTO N_SP VALUES (2, 5, SELECT MAX(PATH_ID) FROM SP2_5);
INSERT INTO N_SP VALUES (2, 6, SELECT MAX(PATH_ID) FROM SP2_6);
INSERT INTO N_SP VALUES (2, 7, SELECT MAX(PATH_ID) FROM SP2_7);
INSERT INTO N_SP VALUES (2, 8, SELECT MAX(PATH_ID) FROM SP2_8);
INSERT INTO N_SP VALUES (3, 1, SELECT MAX(PATH_ID) FROM SP3_1);
INSERT INTO N_SP VALUES (3, 2, SELECT MAX(PATH_ID) FROM SP3_2);
INSERT INTO N_SP VALUES (3, 4, SELECT MAX(PATH_ID) FROM SP3_4);
INSERT INTO N_SP VALUES (3, 5, SELECT MAX(PATH_ID) FROM SP3_5);
INSERT INTO N_SP VALUES (3, 6, SELECT MAX(PATH_ID) FROM SP3_6);
INSERT INTO N_SP VALUES (3, 7, SELECT MAX(PATH_ID) FROM SP3_7);
INSERT INTO N_SP VALUES (3, 8, SELECT MAX(PATH_ID) FROM SP3_8);
INSERT INTO N_SP VALUES (4, 1, SELECT MAX(PATH_ID) FROM SP4_1);
INSERT INTO N_SP VALUES (4, 2, SELECT MAX(PATH_ID) FROM SP4_2);
INSERT INTO N_SP VALUES (4, 3, SELECT MAX(PATH_ID) FROM SP4_3);
INSERT INTO N_SP VALUES (4, 5, SELECT MAX(PATH_ID) FROM SP4_5);
INSERT INTO N_SP VALUES (4, 6, SELECT MAX(PATH_ID) FROM SP4_6);
INSERT INTO N_SP VALUES (4, 7, SELECT MAX(PATH_ID) FROM SP4_7);
INSERT INTO N_SP VALUES (4, 8, SELECT MAX(PATH_ID) FROM SP4_8);
INSERT INTO N_SP VALUES (5, 1, SELECT MAX(PATH_ID) FROM SP5_1);
INSERT INTO N_SP VALUES (5, 2, SELECT MAX(PATH_ID) FROM SP5_2);
INSERT INTO N_SP VALUES (5, 3, SELECT MAX(PATH_ID) FROM SP5_3);
INSERT INTO N_SP VALUES (5, 4, SELECT MAX(PATH_ID) FROM SP5_4);
INSERT INTO N_SP VALUES (5, 6, SELECT MAX(PATH_ID) FROM SP5_6);
INSERT INTO N_SP VALUES (5, 7, SELECT MAX(PATH_ID) FROM SP5_7);
INSERT INTO N_SP VALUES (5, 8, SELECT MAX(PATH_ID) FROM SP5_8);
INSERT INTO N_SP VALUES (6, 1, SELECT MAX(PATH_ID) FROM SP6_1);
INSERT INTO N_SP VALUES (6, 2, SELECT MAX(PATH_ID) FROM SP6_2);
INSERT INTO N_SP VALUES (6, 3, SELECT MAX(PATH_ID) FROM SP6_3);
INSERT INTO N_SP VALUES (6, 4, SELECT MAX(PATH_ID) FROM SP6_4);
INSERT INTO N_SP VALUES (6, 5, SELECT MAX(PATH_ID) FROM SP6_5);
INSERT INTO N_SP VALUES (6, 7, SELECT MAX(PATH_ID) FROM SP6_7);
INSERT INTO N_SP VALUES (6, 8, SELECT MAX(PATH_ID) FROM SP6_8);
INSERT INTO N_SP VALUES (7, 1, SELECT MAX(PATH_ID) FROM SP7_1);
INSERT INTO N_SP VALUES (7, 2, SELECT MAX(PATH_ID) FROM SP7_2);
INSERT INTO N_SP VALUES (7, 3, SELECT MAX(PATH_ID) FROM SP7_3);
INSERT INTO N_SP VALUES (7, 4, SELECT MAX(PATH_ID) FROM SP7_4);
INSERT INTO N_SP VALUES (7, 5, SELECT MAX(PATH_ID) FROM SP7_5);
INSERT INTO N_SP VALUES (7, 6, SELECT MAX(PATH_ID) FROM SP7_6);
INSERT INTO N_SP VALUES (7, 8, SELECT MAX(PATH_ID) FROM SP7_8);
INSERT INTO N_SP VALUES (8, 1, SELECT MAX(PATH_ID) FROM SP8_1);
INSERT INTO N_SP VALUES (8, 2, SELECT MAX(PATH_ID) FROM SP8_2);
INSERT INTO N_SP VALUES (8, 3, SELECT MAX(PATH_ID) FROM SP8_3);
INSERT INTO N_SP VALUES (8, 4, SELECT MAX(PATH_ID) FROM SP8_4);
INSERT INTO N_SP VALUES (8, 5, SELECT MAX(PATH_ID) FROM SP8_5);
INSERT INTO N_SP VALUES (8, 6, SELECT MAX(PATH_ID) FROM SP8_6);
INSERT INTO N_SP VALUES (8, 7, SELECT MAX(PATH_ID) FROM SP8_7);
UPDATE N_SP SET N_SPS=0 WHERE N_SPS=-1;
SELECT * FROM N_SP ORDER BY SOURCE, DESTINATION;

-- Number of shortest paths from 4 to 1 containing a specific vertex.
SELECT COUNT(DISTINCT PATH_ID) FROM SP4_1
    WHERE SOURCE=2 OR DESTINATION=2;
SELECT COUNT(DISTINCT PATH_ID) FROM SP4_1
    WHERE SOURCE=3 OR DESTINATION=3;
SELECT COUNT(DISTINCT PATH_ID) FROM SP4_1
    WHERE SOURCE=5 OR DESTINATION=5;
SELECT COUNT(DISTINCT PATH_ID) FROM SP4_1
    WHERE SOURCE=6 OR DESTINATION=6;
SELECT COUNT(DISTINCT PATH_ID) FROM SP4_1
    WHERE SOURCE=7 OR DESTINATION=7;
SELECT COUNT(DISTINCT PATH_ID) FROM SP4_1
    WHERE SOURCE=8 OR DESTINATION=8;

DROP TABLE IF EXISTS TMP;
CREATE TABLE TMP(SOURCE INT, DESTINATION INT, V_CONTAINED INT, N_SP INT);
@loop 8 INSERT INTO TMP
        VALUES (4, 1, ?+1, (SELECT COUNT(DISTINCT PATH_ID) FROM SP4_1
                            WHERE (SOURCE=?+1 OR DESTINATION=?+1)
                              AND (SOURCE!=?+1 OR DESTINATION!=?+1)));

SELECT * FROM TMP WHERE V_CONTAINED!=SOURCE AND V_CONTAINED!=DESTINATION;
