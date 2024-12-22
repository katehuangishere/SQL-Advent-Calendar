```
We are looking for cheap gifts at the market. 
Which vendors are selling items priced below $10? List the unique (i.e. remove duplicates) vendor names.

Table: vendors
| vendor_id | vendor_name    | market_location    |
|-----------|----------------|--------------------|
| 1         | Cozy Crafts    | Downtown Square    |
| 2         | Sweet Treats   | Central Park       |
| 3         | Winter Warmers | Downtown Square    |

Table: item_prices
| item_id | vendor_id | item_name           | price_usd |
|---------|-----------|---------------------|-----------|
| 1       | 1         | Knitted Scarf       | 25        |
| 2       | 2         | Hot Chocolate       | 5         |
| 3       | 2         | Gingerbread Cookie  | 3.5       |
| 4       | 3         | Wool Hat            | 18        |
| 5       | 3         | Santa Pin           | 2         |
```

SELECT 
    DISTINCT v.vendor_name
FROM 
    vendors v 
INNER JOIN 
    item_prices i 
ON 
    v.vendor_id = i.vendor_id
WHERE 
    i.price_usd < 10;
