/* ex13 */
SELECT timestampdiff(day, "1996-10-25", now());
SELECT timestampdiff(day, "1997-01-11", now());
SELECT date_add(now(), interval 1 month);
SELECT date_sub(now(), interval 1 month);