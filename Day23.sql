```
The Grinch tracked his weight every day in December to analyze how it changed daily. 
Write a query to return the weight change (in pounds) for each day, calculated as the difference from the previous day's weight.

Table name: grinch_weight_log
| log_id | day_of_month | weight |
|--------|--------------|--------|
| 1      | 1            | 250    |
| 2      | 2            | 248    |
| 3      | 3            | 249    |
| 4      | 4            | 247    |
| 5      | 5            | 246    |
| 6      | 6            | 248    |
```

SELECT 
    g1.day_of_month,
    g1.weight - g2.weight AS weight_change
FROM 
    grinch_weight_log g1
LEFT JOIN 
    grinch_weight_log g2 
ON
    g1.day_of_month = g2.day_of_month + 1
ORDER BY 
    g1.day_of_month;
