```
You are managing inventory in Santa's workshop. Which gifts are meant for "good" recipients? List the gift name and its weight.

Table name: gifts
| Gift Name       | Weight (kg) |
|------------------|-------------|
| Toy Train        | 2.5         |
| Teddy Bear       | 1.2         |
| Chocolate Bar    | 0.3         |
```

SELECT 
    gift_name, weight_kg
FROM 
    gifts
WHERE 
    recipient_type = 'good';
