with rental_details as (
    SELECT * FROM "dvd_rental"."dev"."rental_details"
),
customer_category_preference as (
    SELECT 
        customer_id, 
        film_category, 
        count(*) as number, 
        sum(payment_amount) as dollars 
    FROM rental_details 
    GROUP BY customer_id, film_category
    ORDER BY customer_id ASC, count(*) DESC
)

SELECT * FROM customer_category_preference