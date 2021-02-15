/* ex12 */
SELECT date_format(now(), "%y년 %m월 %d일");
SELECT date_format(now(), "%h시 %m분 %s초");
# %Y는 대문자여야함
SELECT str_to_date("1996년 10월 25일 내생일", "%Y년 %m월 %d일");