-- https://school.programmers.co.kr/learn/courses/30/lessons/144853
-- 문제 : BOOK 테이블에서 2021년에 출판된 '인문' 카테고리에 속하는 도서 리스트를 찾아서 도서 ID(BOOK_ID), 
-- 출판일 (PUBLISHED_DATE)을 출력하는 SQL문을 작성해주세요.
-- 결과는 출판일을 기준으로 오름차순 정렬해주세요.

SELECT BOOK_ID, 
       DATE_FORMAT(PUBLISHED_DATE, "%Y-%m-%d") AS PUBLISHED_DATE
FROM BOOK    -- date 정보의 일부를 슬라이스 하여 비교
WHERE substr(PUBLISHED_DATE, 1, 4) = '2021' AND CATEGORY = '인문'
ORDER BY PUBLISHED_DATE;


-- https://school.programmers.co.kr/learn/courses/30/lessons/132201
-- 문제 : PATIENT 테이블에서 12세 이하인 여자환자의 환자이름, 환자번호, 성별코드, 나이, 전화번호를 조회하는 
-- SQL문을 작성해주세요. 이때 전화번호가 없는 경우, 'NONE'으로 출력시켜 주시고 결과는 나이를 기준으로 내림차순 정렬하고, 
-- 나이 같다면 환자이름을 기준으로 오름차순 정렬해주세요.

SELECT PT_NAME,
       PT_NO,
       GEND_CD,
       AGE,
       IFNULL(TLNO, 'NONE') AS TLNO -- NULL 값을 'NONE' 값으로 출력
FROM PATIENT
WHERE AGE <= 12
AND GEND_CD = 'W'
ORDER BY AGE DESC, PT_NAME ASC;


-- https://school.programmers.co.kr/learn/courses/30/lessons/131535
-- 문제 : USER_INFO 테이블에서 2021년에 가입한 회원 중 나이가 20세 이상 29세 이하인
--  회원이 몇 명인지 출력하는 SQL문을 작성해주세요.


SELECT COUNT(USER_ID) AS USERS
FROM USER_INFO
WHERE AGE >= 20 AND AGE<=29
AND substr(JOINED, 1, 4) = '2021';

-- https://school.programmers.co.kr/learn/courses/30/lessons/59405
-- 문제 : 동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.

SELECT NAME
FROM ANIMAL_INS
WHERE DATETIME = (SELECT MIN(DATETIME) FROM ANIMAL_INS);
                -- 가장 작은 날짜를 선택하기 위해 where 절 안에서 다시 선택

-- https://school.programmers.co.kr/learn/courses/30/lessons/59404
-- 문제 : 동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로 조회하는 SQL문을 작성해주세요. 
-- 단, 이름이 같은 동물 중에서는 보호를 나중에 시작한 동물을 먼저 보여줘야 합니다.

SELECT ANIMAL_ID,
       NAME,
       DATETIME
FROM ANIMAL_INS
ORDER BY NAME, DATETIME DESC;