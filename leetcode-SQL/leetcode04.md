## 1148. Article Views I

### Table: Views
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
```
There is no primary key (column with unique values) for this table, the table may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
Note that equal author_id and viewer_id indicate the same person.
 

Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

The result format is in the following example.


## SOLUTION

``` 
SELECT distinct(author_id) as id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id ASC;
```

적어도 한 번 자신의 기사를 읽은 작가를 구하기 위해 WHERE author_id = viewer_id
이 경우, author_id 4번은 자신의 기사를 여러차례 읽었기 때문에 
유일한 값을 산출하기 위해 DISTINCT 사용