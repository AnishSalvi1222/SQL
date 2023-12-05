## Subqueries

# Write a query to find the top 5 customers with the highest total

SELECT customer_id, total_spent
FROM (
    SELECT customer_id, SUM(order_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
    ORDER BY total_spent DESC
    LIMIT 5
) AS top_customers;

