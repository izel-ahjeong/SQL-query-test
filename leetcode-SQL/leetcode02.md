## 584. Find Customer Referee

### Table: Customer
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
```
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.

Find the names of the customer that are not referred by the customer with id = 2.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customer table:
```
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
```
Output: 
```
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
```

### ERROR 

1. 

아래와 같이 != 로 2가 아닌 것을 잡으려고 하면
```
select name
from Customer
Where referee_id != '2';
```

결과물이 null을 제외하고 나와서 아래와 같은 결과물을 낼 수 있다.
```
| name |
| ---- |
| Zack |
```

--> SQL 에서는 NULL값은 어떤 값과도 같지 않고, 다르지도 않다고 간주되기 때문에 NULL인 행은 제외하고 나오기 때문.



## SOLUTION

```
select name
from Customer
Where referee_id != 2 or referee_id is null;
```

--> id 가 2가 아니거나 또는 null 인 것을 따로 잡아줘야 함
