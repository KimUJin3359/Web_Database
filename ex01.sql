/* ex01 */
SELECT * FROM test_schema.test_table WHERE ID = 3 or ID = 5;
SELECT name, age FROM test_schema.test_table WHERE 2 <= ID and ID <= 5;
SELECT * FROM test_schema.test_table WHERE 20 <= age and age < 30;
SELECT name FROM test_schema.test_table WHERE ID % 2 = 0 and age % 2 = 1;