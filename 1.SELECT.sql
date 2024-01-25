-- https://school.programmers.co.kr/learn/courses/30/lessons/151136

SELECT ROUND(AVG(DAILY_FEE), 0) AS 'AVERAGE_FEE'
FROM CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = 'SUV'

-- https://school.programmers.co.kr/learn/courses/30/lessons/131536
-- 재구매가 일어난 상품과 회원리스트 구하기

SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY 1,2
HAVING COUNT(PRODUCT_ID) > 1
ORDER BY USER_ID ASC, PRODUCT_ID DESC;

-- https://school.programmers.co.kr/learn/courses/30/lessons/131537
-- 오프라인/온라인 판매 데이터 통합하기
-- 문제 :ONLINE_SALE 테이블과 OFFLINE_SALE 테이블에서 2022년 3월의 오프라인/온라인 상품 
--      판매 데이터의 판매 날짜, 상품ID, 유저ID, 판매량을 출력하는 SQL문을 작성해주세요. 
--      OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL 로 표시해주세요. 
--      결과는 판매일을 기준으로 오름차순 정렬해주시고 판매일이 같다면 상품 ID를 기준으로 오름차순, 
--      상품ID까지 같다면 유저 ID를 기준으로 오름차순 정렬해주세요.

SELECT DATE_FORMAT(SALES_DATE,"%Y-%m-%d") SALES_DATE, -- 데이터를 날짜형식으로 받을 수 있도록 변환
    PRODUCT_ID,
    USER_ID,
    SALES_AMOUNT
FROM ONLINE_SALE
WHERE SALES_DATE >= '2022-03-01' and SALES_DATE < '2022-04-01'

UNION ALL  -- 공유하는 컬럼이 없으므로 JOIN을 사용하지 못 하고 UNION으로 테이블 통합

SELECT DATE_FORMAT(SALES_DATE,"%Y-%m-%d") SALES_DATE,
    PRODUCT_ID,
    NULL AS USER_ID, -- 해당 테이블에 없는 자료는 NULL 값을 넣어 처리
    SALES_AMOUNT
FROM OFFLINE_SALE 
WHERE SALES_DATE >= '2022-03-01' and SALES_DATE < '2022-04-01'
    
ORDER BY SALES_DATE , PRODUCT_ID , USER_ID -- 오름차순은 따로 명시하지 않아도 괜찮음