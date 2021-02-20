# Web_Database

### DB(Database)
- 데이터들의 묶음
- 데이터의 집합을 뜻하는 개념적 단어

### DBMS
- Database를 관리하는 도구들을 모아 둔 시스템
- MySQL, Oracle, Mongo DB, ProtgreSQL 등이 존재
- 필요성
  - 데이터들을 안전하게 다루도록 해줌
  - 고속으로 데이터를 읽고, 쓸 수 있음
  - 데이터들을 편리하고, 빠르고, 안전하게 사용 가능
- 장점
  - 데이터 검색 알고리즘, 암호화 등을 직접 구현하지 않음
- 구조
  - 관계형 DBMS
    - 구조 및 제약조건(스키마)를 만들고 값을 채워야 함
    - MySQL, Oracle
  - 비관계형 DBMS
    - RDBMS(관계형 DBMS) 구조로 저장하지 않는 DBMS
    - 구조가 다양
    - Mongo DB, Redis
    
### MySQL
- Open Source
- 도구
  - MySQL Server, MySQL Workbench 등을 포함
- 설치 방법
  1) [mysql.com](https://www.mysql.com/) 접속하여 DOWNLOADS 클릭 후 해당 OS에 맞는 version 다운로드
  2) Default 혹은 자신이 원하는 설정을 찾아 설치
- 구조
  - DB는 3계층 구조로 이루어짐
    - 인스턴스(DB서버)
    - 스키마(Database)
    - 테이블
- Server Instance
  - 하나의 DB server를 나타냄
  - DBMS를 설치하면 인스턴스가 자동 생성
  - 하나의 DB를 운영하기 위해 내부 Buffer, 저장공간, 관리 도구들이 동작 되어야 함
  - 운영이 필요한 모든 도구들을 서버 인스턴스라고 부름
- Schema  
  - Database
  - 생성방법
  ```
    #CREATE DATABASE ${name};
    #CREATE SCHEMA ${name};
  ```    

### DBMS 계정 생성 및 접속
- root 아이디 사용 지양
  - 피해를 최소하 하기 위함
    - 사용자 계정을 해킹당하는 경우, 권한 허용한도 내 해킹 피해를 입음
    - root 계정을 해킹당하는 경우, 모든 데이터 손실 가능
  - 사용자 계정 권한이 없는 일을 할 때만 접속하여 사용
  - 사용자 계정 추가, 스키마 생성 등
- 사용자 계정
  - 허용된 스키마에 Table 추가
  - SQL 명령어 사용
  - **스키마 편집, 제거 불가**
  - 생성방법
  ```
  #CREATE USER ${ID};
  #localhost
  #CREATE USER ${ID}@localhost IDENTIFIED BY ${PASSWORD};
  #외부 접근
  #CREATE USER '${ID}'@'%' IDENTIFIED BY '${PASSWORD}';
  ```
- 스키마 권한 지정
  - 지정방법
  ```
  #GRANT (ALL, SELECT, UPDATE ...) PRIVILEGES ON ${SCHEMA name}.* to '${ID}'@'%';
  ```
  - 해제방법
  ```
  #REVOKE (ALL, SELECT, UPDATE ...) ON ${SCHEMA name}.* FROM '${ID}'@'ID';
  ```
- 테이블 생성하기
  - 생성방법
  ```
  /*
  CREATE TABLE ${Table name}(
    ${Field name} ${Type} (NOT NULL, UNIQUE, PRIMARY KEY, ...),
    ${Field name} ${Type},
    ...
    PRIMARY KEY(${Field name})
  );
  */
  ```
  - NOT NULL : 해당 필드는 NULL 값을 가질 수 없음
  - UNIQUE : 해당 필드는 서로 다른 값을 가짐
  - PRIMARY KEY : 기본키 설정
  - FOREIGN KEY : 외래키 설정
  - DEFAULT : 기본값 설정
  - AUTO_INCREMENT : 필드 값을 1부터 시작하여 레코드가 추가될 때마다 1씩 증가값 저장
- 데이터 입력
  ```
  #INSERT INTO ${Table name}(${Field name}, ...) VALUES (${DATA value}, ...);
  #INSERT INTO ${Table name} VALUES (${DATA value}, ...);
  ```
  
### SELECT 연습
- 용어
  - Fields : Column
  - Record : Row
- SELECT
  ```
  #SELECT ${Field name} FROM ${Schema name} WHERE (조건 and/or 조건, ...);
  ```
  - alias 지정
    ```
    #SELECT ${Field name} AS ${alias name} ...
    ```
  - 정렬 하기
    ```
    #SELECT * FROM ${Schema name} ORDER BY ${Field name} ASC/DESC;
    ```
    - ASC : 오름차순
    - DESC : 내림차순
  - [ex01](https://github.com/KimUJin3359/Web_Database/blob/master/ex01.sql)    
  - [ex02](https://github.com/KimUJin3359/Web_Database/blob/master/ex02.sql)
  - BETWEEN : 구간사이 데이터 추출
    - WHERE 절 다음에 입력
    - [ex07](https://github.com/KimUJin3359/Web_Database/blob/master/ex07.between.sql)
  - IN : 후보들 중 나오는 값을 의미
    - WHERE 절 다음에 입력
    - IN (value1, value2, value3, ...)
    - [ex08](https://github.com/KimUJin3359/Web_Database/blob/master/ex08.in.sql)
  - LIKE : 문자열 검색
    - WHERE 절 다음에 입력
    - % : 다중 문자를 의미(wild card)
    - _ : 한글자를 의미
    - [ex09](https://github.com/KimUJin3359/Web_Database/blob/master/ex09.like.sql)
  - GROUP BY
    - 그룹을 지어 데이터를 묶음
    - SUM() : 합
    - AVG() : 평균
    - MIN() : 최소값
    - MAX() : 최대값
    - COUNT() : 개수
  - HAVING
    - GROUP BY를 썼을 떄 쓸 수 있는 조건 절
    ```
    SELECT animal, count(*) as '개체 수' 
    FROM zoo
    GROUP BY animal
    HAVING count(*) >= 2;
    ```
  - LIMIT
    - 특정 개수만 보여줌
    - 빠른 Query 성능을 위해 사용함
    
### Database Backup 하기
![저장](https://user-images.githubusercontent.com/50474972/107941823-ab6da300-6fcd-11eb-88fd-9b529c7e9112.JPG)
- Data Export
  - MySQL Workbench에서 Administration -> Data Export 클릭
  - Export할 위치 선택
- Data Import
  - Import할 파일(Export된 파일)이 있는 위치 선택
  - Target Schema 선택
  
### CRUD와 Console
- CRUD : Create + Read + Update + Delete
- 데이터를 다루는 Software의 기본적인 인터페이스를 뜻함
- C : insert into ~ values
  ```
  #INSERT INTO ${Table name} VALUES (value1, value2, ...)
  ```
  - [ex03](https://github.com/KimUJin3359/Web_Database/blob/master/ex03.insert.sql)
- R : select
- U : update ~ set where
  ```
  #UPDATE ${Table name} SET ${Field name} = (값) WHERE (조건)
  ```
  - [ex04](https://github.com/KimUJin3359/Web_Database/blob/master/ex04.update.sql)
- D : delete from ~ where
  - [ex05](https://github.com/KimUJin3359/Web_Database/blob/master/ex05.delete.sql)
- UPDATE Error 발생
  - Safe update mode(MySQL Workbench)
    - 다수의 레코드들이 한꺼번에 UPDATE 되는사고를 막기 위함
    - 에러 발생 경우
      - 조건문을 붙이지 않는 경우
      - where문에서 key column 조건이 없는 경우
- [ex06](https://github.com/KimUJin3359/Web_Database/blob/master/ex06.exercise.sql)      
- DB server 관리 도구
  - MySQL Workbench(GUI)
    - 대량의 데이터에도 구조를 쉽게 파악 가능
    - 사용하기 편함
  - MySQL Console(CLI)
- Console 명령어
  - 로그인
  ```
  mysql -u ${ID} -p ${password}
  ```
  - 사용가능한 DB 확인하기
  ```
  show databases;
  use ${DB name};
  ```
    - 현 계정이 접근할 수 있는 DB 목록을 확인
    - use ${DB name} : 사용할 DB 선택 명령어 
  - 테이블 정보 확인
  ```
  show tables;
  desc ${Table name};
  ```
    - 테이블 목록 확인
    - 테이블 구조 확인
  - 콘솔에는 SAFE Moder가 없음

### 데이터 타입
- 대표적인 데이터 타입
  - 숫자형 : int, float
  - 문자형 : char, varchar, text
  - 날짜형 : date, datetime
- enum Type
  - 내부적으로 char Type
  - 해당 목록에 있는 문자열이 아니면 ''으로 처리
- char과 varchar의 차이
  - char
    - **길이가 일정한 문자, 빠른 성능이 필요한 문자, 자주 읽는 필드**
    - 고정길이 데이터 타입
    - 빈 공간은 띄어쓰기로 채움
  - varchar
    - **길이 변화가 큰 문자**
    - 가변길이 데이터 타입
    - 빈 공간을 채우지 않음
    - varchar(20)이지만, 'abc'를 넣는다면 3Byte만 사용
    - 공간을 아낄 수 있지만, 데이터 파편화로 성능 저하    
  - text
    - 64KB 미만의 긴 문자열
- 날짜형 데이터 타입
  - 날짜 및 시간은 필수로 들어가는 데이터
  - log, 데이터가 언제 기록이 되었는지 필요
  - DATE
    - 날짜 타입(year, moth, day)
    - 기본 Format은 YYYY-MM-DD
  - DATETIME
    - 날짜 + 시간을 나타냄
    - YYYY-MM-DD HH:MM:SS
  - [ex10](https://github.com/KimUJin3359/Web_Database/blob/master/ex10.date.sql)
  - [ex11](https://github.com/KimUJin3359/Web_Database/blob/master/ex11.exercise.sql)
- 데이터 타입 변경하기
  - DATE -> STRING
    - date_format 함수 사용
  - STRING -> DATE
    - str_to_date 함수 사용
  - [ex12](https://github.com/KimUJin3359/Web_Database/blob/master/ex12.dateformat.sql) 
- 날짜 계산하기
  - 날짜 간격 구하기
    - timestampdiff((second, ...), (from_date), (to_date))
    - second, minute, hour, day, week, month, year을 기준으로 구할 수 있음
  - 날짜 더하기
    - date_add((time), interval (number) (hour, ...));
  - 날짜 뺴기
    - date_sub((time), interval (number) (hour, ...));
  - [ex13](https://github.com/KimUJin3359/Web_Database/blob/master/ex13.datefunction.sql)    
  
### NULL 값과 문자열 함수
- IS NULL
  - 값이 NULL이면 true
- IS NOT NULL
  - 값이 NULL이 아니면 true
- ifnull(${Field name}, (value))
  - 만약 필드의 값이 NULL이라면, 대체값으로 출력
  - [ex16](https://github.com/KimUJin3359/Web_Database/blob/master/ex16.null.sql)
- concat((value1), (value2), ...)
  - 값을 합치는 함수
  - [ex15](https://github.com/KimUJin3359/Web_Database/blob/master/ex15.concat.sql)
- convert(${Field name}, (char, ...))
  - char, int, datetime 등
- 문자열 함수
  - length() : 문자열 길이
  - left(${Field name}, (length)) : 왼쪽의 글자수만 추출
  - right(${Field name}, (length)) : 오른쪽의 글자수만 추출
  - mid(${Field name}, (from), (length)) : fromt부터 length개 문자열 추출
  - trim() : 공백제거
  - lower() : 소문자
  - upper() : 대문자
  - instr(${Field name}, (String)) : 문자열 찾아 위치 리턴
  - substr, insert, replace
  
### MySQL 집합
- **union(합집합)**
  - union은 자동으로 중복을 제거
  - union all을 사용하면 중복이 제거되지 않고 전부 출력
  - 각 SELECT의 열 수, 표현식이 같아야 함
  ```
  /*
  SELECT ${Column name} FROM ${Table name}
  UNION
  SELECT ${Column name} FROM ${Table name};
  */
  ```
  - [ex17](https://github.com/KimUJin3359/Web_Database/blob/master/ex17.union.sql)
- **join(교집합)**
  - INNER join
    - 일반적인 경우(교집합)
    ```
    SELECT ${Column name}, ...
    FROM ${Table name} JOIN ${Table name}
    ON(or WHERE) (조건);
    ```
  - OUTER join
    - 교집합에 포함되지 않는 다른 구성원도 보고싶을 경우
    ```
    SELECT ${Column name}, ...
    FROM ${Table name} LEFT(or RIGHT) OUTER JOIN ${Table name}
    ON(or WHERE) (조건);
    ```
    - A LEFT JOIN B
      - A의 모든 구성원
    - A RIGHT JOIN B
      - B의 모든 구성원
  - NATURAL join
    - on 절이 없는 내부조인
    - 같은 열이름을 가진 두 테이블을 조인할 때만 사용
  - [ex18](https://github.com/KimUJin3359/Web_Database/blob/master/ex18.join.sql)    
- **subquery(차집합)**
  ```
  SELECT ${Column name}, ...
  FROM ${Table name}
  WHERE ${Column name} NOT IN (SELECT ${Column name} FROM ${Table name});
  ```
  
   
