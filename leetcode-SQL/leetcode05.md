## 1683. Invalid Tweets

### Table: Tweets

```
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| tweet_id       | int     |
| content        | varchar |
+----------------+---------+
```
tweet_id is the primary key (column with unique values) for this table.
This table contains all the tweets in a social media app.
 

Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.

## SOLUTION

```
SELECT tweet_id 
FROM Tweets
WHERE length(content) > 15; 
```

content의 길이가 15자 이상의 경우 에러이기 때문에 오류인 트윗 아이디만 가져오는 sql
length 함수를 활용해 content 길이를 확인할 수 있다.