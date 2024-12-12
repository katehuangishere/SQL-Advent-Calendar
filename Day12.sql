```
A collector wants to identify the top 3 snow globes with the highest number of figurines.
Write a query to rank them and include their globe_name, number of figurines, and material.

Table: `snow_globes`

| globe_id | globe_name         | volume_cm3 | material |
|----------|--------------------|------------|----------|
| 1        | Winter Wonderland | 500        | Glass    |
| 2        | Santas Workshop   | 300        | Plastic  |
| 3        | Frozen Forest     | 400        | Glass    |
| 4        | Holiday Village   | 600        | Glass    |

Table: `figurines`

| figurine_id | globe_id | figurine_type |
|-------------|----------|---------------|
| 1           | 1        | Snowman       |
| 2           | 1        | Tree          |
| 3           | 2        | Santa Claus   |
| 4           | 2        | Elf           |
| 5           | 2        | Gift Box      |
| 6           | 3        | Reindeer      |
| 7           | 3        | Tree          |
| 8           | 4        | Snowman       |
| 9           | 4        | Santa Claus   |
| 10          | 4        | Tree          |
| 11          | 4        | Elf           |
| 12          | 4        | Gift Box      |
```

SELECT 
    s.globe_name, COUNT(f.figurine_type) AS num_figurines, s.material
FROM 
    snow_globes s
LEFT JOIN 
    figurines f
ON 
    s.globe_id = f.globe_id
GROUP BY 
    s.globe_name, s.material
ORDER BY 
    num_figurines DESC
LIMIT 3;
