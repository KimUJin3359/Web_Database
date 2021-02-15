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
  
### DML 연습하기
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
