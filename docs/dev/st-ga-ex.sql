-- Calculate the shortest paths.
CREATE TABLE SP_4_1 AS
    SELECT * FROM
    ST_ShortestPath('INPUT_EDGES', 'undirected', 4, 1);

-- Number of shortest paths from 4 to 1
SELECT MAX(PATH_ID) FROM SP_4_1;
-- Number of shortest paths from 4 to 1 containing a specific vertex.
SELECT COUNT(DISTINCT PATH_ID) FROM SP_4_1
    WHERE SOURCE=2 OR DESTINATION=2;
SELECT COUNT(DISTINCT PATH_ID) FROM SP_4_1
    WHERE SOURCE=3 OR DESTINATION=3;
SELECT COUNT(DISTINCT PATH_ID) FROM SP_4_1
    WHERE SOURCE=5 OR DESTINATION=5;

1 2
1 3
1 4
1 5
1 6
1 7
1 8
2 1
2 3
2 4
2 5
2 6
2 7
2 8
3 1
3 2
3 4
3 5
3 6
3 7
3 8
4 1
4 2
4 3
4 5
4 6
4 7
4 8
5 1
5 2
5 3
5 4
5 6
5 7
5 8
6 1
6 2
6 3
6 4
6 5
6 7
6 8
7 1
7 2
7 3
7 4
7 5
7 6
7 8
8 1
8 2
8 3
8 4
8 5
8 6
8 7
