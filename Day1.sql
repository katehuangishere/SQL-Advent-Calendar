```
Today's Question:

A ski resort company want to know which customers rented ski equipment for more than one type of activity (e.g., skiing and snowboarding). 
  List the customer names and the number of distinct activities they rented equipment for.

Table name: rentals

rental_id	customer_name	 activity	      rental_date
1	        Emily	         Skiing	        2024-01-01
2	        Michael	       Snowboarding	  2024-01-02
3	        Emily	         Snowboarding	  2024-01-03
4	        Sarah	         Skiing	        2024-01-01
5	        Michael	       Skiing	        2024-01-02
6	        Michael	       Snowtubing	    2024-01-02
```

SELECT 
    customer_name, COUNT(DISTINCT activity) AS times
FROM
    rentals
GROUP BY
    customer_name
HAVING
    COUNT(DISTINCT activity) >= 2; -- HAVING 子句是用來取代 WHERE 搭配聚合函數 (aggregate function) 進行條件查詢，因為 WHERE 不能與聚合函數一起使用。
