-- https://school.programmers.co.kr/learn/courses/30/lessons/131112
-- 강원도에 위치한 생산공장 목록 출력하기
-- FOOD_FACTORY 테이블에서 강원도에 위치한 식품공장의 공장 ID, 공장 이름, 주소를 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 공장 ID를 기준으로 오름차순 정렬해주세요.

SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE ADDRESS LIKE '강원도%'
ORDER BY FACTORY_ID;

-- https://school.programmers.co.kr/learn/courses/30/lessons/59037#fn1
-- 어린 동물 찾기
-- 동물 보호소에 들어온 동물 중 젊은 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 
-- 이때 결과는 아이디 순으로 조회해주세요.

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION != 'Aged' -- '어린'동물의 기준 
ORDER BY ANIMAL_ID;

-- https://school.programmers.co.kr/learn/courses/30/lessons/59036#fn1
-- 아픈 동물 찾기
-- 동물 보호소에 들어온 동물 중 아픈 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 
-- 이때 결과는 아이디 순으로 조회해주세요.

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION = 'Sick'
ORDER BY ANIMAL_ID;