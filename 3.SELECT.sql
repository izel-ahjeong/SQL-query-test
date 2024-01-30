-- https://school.programmers.co.kr/learn/courses/30/lessons/131120
-- 3월에 태어난 여성 회원 목록 출력하기
-- 문제 : MEMBER_PROFILE 테이블에서 생일이 3월인 여성 회원의 ID, 이름, 성별, 생년월일을 조회하는 SQL문을 작성해주세요. 
-- 이때 전화번호가 NULL인 경우는 출력대상에서 제외시켜 주시고, 결과는 회원ID를 기준으로 오름차순 정렬해주세요.

SELECT MEMBER_ID,
       MEMBER_NAME,
       GENDER,
       DATE_FORMAT(DATE_OF_BIRTH, "%Y-%m-%d") AS DATE_OF_BIRTH -- 데이터형식으로 바꾸면 MONTH,DATE등으로 출력 가능
FROM MEMBER_PROFILE
WHERE TLNO IS NOT NULL 
AND MONTH(DATE_OF_BIRTH) = 3 -- date 형식으로 바꿔놨기 때문에 MONTH 로 달 출력가능
AND GENDER ='w'
ORDER BY MEMBER_ID;

-- https://school.programmers.co.kr/learn/courses/30/lessons/133024
-- 인기있는 아이스크림
-- 상반기에 판매된 아이스크림의 맛을 총주문량을 기준으로 내림차순 정렬하고 
-- 총주문량이 같다면 출하 번호를 기준으로 오름차순 정렬하여 조회하는 SQL 문을 작성해주세요.

SELECT FLAVOR
FROM FIRST_HALF
ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID;


-- https://school.programmers.co.kr/learn/courses/30/lessons/164673
-- 조건에 부합하는 중고거래 댓글 조회하기
-- USED_GOODS_BOARD와 USED_GOODS_REPLY 테이블에서 2022년 10월에 작성된 게시글 제목, 게시글 ID, 댓글 ID, 댓글 작성자 ID, 댓글 내용, 
-- 댓글 작성일을 조회하는 SQL문을 작성해주세요. 
-- 결과는 댓글 작성일을 기준으로 오름차순 정렬해주시고, 댓글 작성일이 같다면 게시글 제목을 기준으로 오름차순 정렬해주세요.

SELECT USED_GOODS_BOARD.TITLE AS TITLE,
       USED_GOODS_BOARD.BOARD_ID AS BOARD_ID,
       USED_GOODS_REPLY.REPLY_ID AS REPLY_ID,
       USED_GOODS_REPLY.WRITER_ID AS WRITER_ID,
       USED_GOODS_REPLY.CONTENTS AS CONTENTS,
       DATE_FORMAT(USED_GOODS_REPLY.CREATED_DATE, "%Y-%m-%d") AS CREATED_DATE
FROM USED_GOODS_BOARD
JOIN USED_GOODS_REPLY 
ON USED_GOODS_BOARD.BOARD_ID = USED_GOODS_REPLY.BOARD_ID
WHERE YEAR(USED_GOODS_BOARD.CREATED_DATE) = 2022 -- 2022년 10월에 작성된 '게시글' 이기 때문에 게시글 테이블에서 조회
AND MONTH(USED_GOODS_BOARD.CREATED_DATE) = 10
ORDER BY USED_GOODS_REPLY.CREATED_DATE, USED_GOODS_BOARD.TITLE;


-- https://school.programmers.co.kr/learn/courses/30/lessons/132203
-- 흉부외과 또는 일반외과 의사 목록 출력하기
-- DOCTOR 테이블에서 진료과가 흉부외과(CS)이거나 일반외과(GS)인 의사의 이름, 의사ID, 진료과, 고용일자를 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 고용일자를 기준으로 내림차순 정렬하고, 고용일자가 같다면 이름을 기준으로 오름차순 정렬해주세요.

SELECT DR_NAME,
       DR_ID,
       MCDP_CD,
       DATE_FORMAT(HIRE_YMD, "%Y-%m-%d") AS HIRE_YMD
FROM DOCTOR
WHERE MCDP_CD = 'CS' OR MCDP_CD = 'GS'
ORDER BY HIRE_YMD DESC, DR_NAME ASC;


--https://school.programmers.co.kr/learn/courses/30/lessons/131118
-- 서울에 위치한 식당 목록 출력하기
-- REST_INFO와 REST_REVIEW 테이블에서 서울에 위치한 식당들의 식당 ID, 식당 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수를 조회하는 SQL문을 작성해주세요. 
-- 이때 리뷰 평균점수는 소수점 세 번째 자리에서 반올림 해주시고 
-- 결과는 평균점수를 기준으로 내림차순 정렬해주시고, 평균점수가 같다면 즐겨찾기수를 기준으로 내림차순 정렬해주세요.

SELECT
    ri.REST_ID,
    ri.REST_NAME,
    ri.FOOD_TYPE,
    ri.FAVORITES,
    ri.ADDRESS,
    rr.SCORE
FROM REST_INFO AS ri 
INNER JOIN (
    SELECT 
        REST_ID, -- 조인 조건 : 실제 출력되지 않아도 해당 절이 빠지면 ON 의 rr.REST_ID에서 찾아오지 못함
        ROUND(AVG(REVIEW_SCORE),2) AS SCORE -- 반올림하여 리뷰 평균점수 조회
    FROM REST_REVIEW
    GROUP BY REST_ID -- 레스토랑 별로 점수를 평균 내야 하기 때문에 GROUP BY 로 묶어준다.
) AS rr
ON ri.REST_ID = rr.REST_ID
WHERE ri.ADDRESS LIKE '서울%'
ORDER BY rr.SCORE DESC, ri.FAVORITES DESC