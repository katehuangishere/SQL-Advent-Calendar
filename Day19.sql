```
Scientists are studying the diets of polar bears. 
Write a query to find the maximum amount of food (in kilograms) consumed by each polar bear in a single meal December 2024. 
Include the bear_name and biggest_meal_kg, and sort the results in descending order of largest meal consumed.

Table: polar_bears
| bear_id | bear_name | age |
|---------|-----------|-----|
| 1       | Snowball  | 10  |
| 2       | Frosty    | 7   |
| 3       | Iceberg   | 15  |

Table: meal_log
| log_id | bear_id | food_type | food_weight_kg | date       |
|--------|---------|-----------|----------------|------------|
| 1      | 1       | Seal      | 30             | 2024-12-01 |
| 2      | 2       | Fish      | 15             | 2024-12-02 |
| 3      | 1       | Fish      | 10             | 2024-12-03 |
| 4      | 3       | Seal      | 25             | 2024-12-04 |
| 5      | 2       | Seal      | 20             | 2024-12-05 |
| 6      | 3       | Fish      | 18             | 2024-12-06 |
```

SELECT 
    p.bear_name, MAX(food_weight_kg) AS biggest_meal_kg
FROM 
    polar_bears p 
LEFT JOIN 
    meal_log m 
ON 
    p.bear_id = m.bear_id
WHERE
    m.date BETWEEN '2024-12-01' AND '2024-12-31'
GROUP BY
    p.bear_name
ORDER BY
    biggest_meal_kg DESC;
