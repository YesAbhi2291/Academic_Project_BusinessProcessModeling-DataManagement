---Query 1
---level of hierarchy in staff
SELECT
    first_name,
    staff_id,
    manager_id,
    level
FROM
    staff
START WITH
    staff_id = 300
CONNECT BY
    PRIOR staff_id = manager_id
ORDER SIBLINGS BY
    last_name ASC;


---Query 2
---how many customers did each broker bring

SELECT
    b.broker_id,
    b.first_name,
    COUNT(*)
FROM
    customers   a,
    brokers     b
WHERE
    a.broker_id = b.broker_id
GROUP BY
    b.first_name,
    b.broker_id
ORDER BY
    3 DESC;

---Query 3
---description of complaints for a particular building

SELECT
    c.first_name,
    co.description
FROM
    customers    c
    JOIN complaints   co ON ( c.customer_id = co.customer_id )
    JOIN buildings    b ON ( co.building_id = b.building_id )
WHERE
    lower(b.building_name) = lower('&BuildingName');

---Query 4
---Total amount paid by a particular customer

SELECT
    c.first_name,c.last_name,
    SUM(t.amount) AS "Total_Paid"
FROM
    customers      c
    JOIN transactions   t ON ( c.customer_id = t.customer_id )
WHERE
    c.customer_id = &customerid
GROUP BY
    c.first_name,c.last_name;
    
    
    
---QUERY5

--find out customer wise payment sorted by descending order of DOT
select customer_id,DOT,rank() over(partition by customer_id order by DOT desc ) from transactions;









