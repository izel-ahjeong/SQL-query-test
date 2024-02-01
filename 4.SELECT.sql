-- https://school.programmers.co.kr/learn/courses/30/lessons/133025
-- 과일로 만든 아이스크림 고르기
-- 상반기 아이스크림 총주문량이 3,000보다 높으면서 
-- 아이스크림의 주 성분이 과일인 아이스크림의 맛을 총주문량이 큰 순서대로 조회하는 SQL 문을 작성해주세요.

SELECT H.FLAVOR
FROM FIRST_HALF AS H
INNER JOIN (
    SELECT FLAVOR, INGREDIENT_TYPE
    FROM ICECREAM_INFO 
    GROUP BY FLAVOR
) AS I
ON H.FLAVOR = I.FLAVOR
WHERE H.TOTAL_ORDER > 3000 
AND I.INGREDIENT_TYPE LIKE 'fruit%'
ORDER BY H.TOTAL_ORDER DESC;


--https://school.programmers.co.kr/learn/courses/30/lessons/59035
-- 역순 정렬하기
--동물 보호소에 들어온 모든 동물의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 ANIMAL_ID 역순으로 보여주세요. SQL을 실행하면 다음과 같이 출력되어야 합니다.

SELECT NAME, DATETIME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID DESC;

-- https://school.programmers.co.kr/learn/courses/30/lessons/59403
-- 동물의 아이디와 이름
-- 동물 보호소에 들어온 모든 동물의 아이디와 이름을 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요. 
-- SQL을 실행하면 다음과 같이 출력되어야 합니다.

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;