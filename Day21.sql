```
Santa needs to optimize his sleigh for Christmas deliveries. 
Write a query to calculate the total weight of gifts for each recipient type (good or naughty) and determine what percentage of the total weight is allocated to each type. 
Include the recipient_type, total_weight, and weight_percentage in the result.

Table: `gifts`
| gift_id | gift_name       | recipient_type | weight_kg |
|---------|-----------------|----------------|-----------|
| 1       | Toy Train       | good           | 2.5       |
| 2       | Lumps of Coal   | naughty        | 1.5       |
| 3       | Teddy Bear      | good           | 1.2       |
| 4       | Chocolate Bar   | good           | 0.3       |
| 5       | Board Game      | naughty        | 1.8       |
```

-- method 1
WITH TotalWeights AS (
    SELECT 
        recipient_type, 
        SUM(weight_kg) AS total_weight
    FROM gifts
    GROUP BY recipient_type
),
GrandTotal AS (
    SELECT 
        SUM(total_weight) AS grand_total_weight
    FROM TotalWeights
)
SELECT 
    tw.recipient_type, 
    tw.total_weight, 
    ROUND((tw.total_weight / gt.grand_total_weight) * 100, 2) AS weight_percentage
FROM TotalWeights tw
CROSS JOIN GrandTotal gt;

-- method 2
SELECT 
    recipient_type,
    total_weight,
    ROUND((total_weight / grand_total_weight) * 100, 2) AS weight_percentage
FROM (
    SELECT 
        recipient_type,
        SUM(weight_kg) AS total_weight,
        (SELECT SUM(weight_kg) FROM gifts) AS grand_total_weight
    FROM gifts
    GROUP BY recipient_type
) subquery;
