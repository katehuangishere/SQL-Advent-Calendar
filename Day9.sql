```
A community is hosting a series of festive feasts, and they want to ensure a balanced menu. 
Write a query to identify the top 3 most calorie-dense dishes (calories per gram) served for each event. 
Include the dish_name, event_name, and the calculated calorie density in your results.

Table name: events

| event_id | event_name             |
|----------|------------------------|
| 1        | Christmas Eve Dinner   |
| 2        | New Years Feast        |
| 3        | Winter Solstice Potluck|

Table name: menu

| dish_id | dish_name           | event_id | calories | weight_g |
|---------|---------------------|----------|----------|----------|
| 1       | Roast Turkey        | 1        | 3500     | 5000     |
| 2       | Chocolate Yule Log  | 1        | 2200     | 1000     |
| 3       | Cheese Fondue       | 2        | 1500     | 800      |
| 4       | Holiday Fruitcake   | 3        | 4000     | 1200     |
| 5       | Honey Glazed Ham    | 2        | 2800     | 3500     |
```

WITH RankedDishes AS (
    SELECT
        m.dish_name,
        e.event_name,
        ROUND(m.calories / m.weight_g, 2) AS calorie_density,
        ROW_NUMBER() OVER (PARTITION BY e.event_id ORDER BY (m.calories / m.weight_g) DESC) AS rn
    FROM
        menu m
    INNER JOIN
        events e ON m.event_id = e.event_id
)
SELECT
    dish_name,
    event_name,
    calorie_density
FROM
    RankedDishes
WHERE
    rn <= 3
ORDER BY
    event_name,
    calorie_density DESC;
