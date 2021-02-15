/* ex06 */

SELECT * FROM test_table;

UPDATE test_table SET age = 15 WHERE ID = 2 or ID = 4;
SELECT * FROM test_table;

DELETE FROM test_table WHERE ID = 1;
SELECT * FROM test_table;

INSERT INTO test_table VALUES (50, '촉촉', 100);
SELECT * FROM test_table;