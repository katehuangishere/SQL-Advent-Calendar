```
You’re planning your next ski vacation and want to find the best regions with heavy snowfall. 
Given the tables resorts and snowfall, find the average snowfall for each region and sort the regions in descending order of average snowfall. 
Return the columns region and average_snowfall.

Table name: ski_resorts

resort_id	resort_name	region
1	Snowy Peaks	Rocky Mountains
2	Winter Wonderland	Wasatch Range
3	Frozen Slopes	Alaska Range
4	Powder Paradise	Rocky Mountains

  
Table name: snowfall

resort_id	snowfall_inches
1	60
2	45
3	75
4	55
```

SELECT 
    sk.region, AVG(sn.snowfall_inches) AS average_snowfall
FROM 
    ski_resorts sk
LEFT JOIN
    snowfall sn
ON 
    sk.resort_id = sn.resort_id
GROUP BY 
    sk.region
ORDER BY 
    average_snowfall DESC;
