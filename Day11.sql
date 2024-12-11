```
You are preparing holiday gifts for your family.
Which family members are celebrating their birthdays in December 2024? List their name and birthday.

Table name: family_members

| Member ID | Name    | Relationship | Birthday   |
|-----------|---------|--------------|------------|
| 1         | Dawn    | Sister       | 2024-12-24 |
| 2         | Bob     | Father       | 2024-05-20 |
| 3         | Charlie | Brother      | 2024-12-25 |
| 4         | Diana   | Mother       | 2024-03-15 |
```

SELECT 
    name, birthday
FROM 
    family_members
WHERE 
    birthday >= '2024-12-01' AND birthday <= '2024-12-31';
