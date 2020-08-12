with rental_details as (
    SELECT * FROM {{ref('rental_details')}}
),
customer_rating_preference as (
    SELECT 
        customer_id, 
        film_rating, 
        count(*) as number, 
        sum(payment_amount) as dollars 
    FROM rental_details 
    GROUP BY customer_id, film_rating
    ORDER BY customer_id ASC, count(*) DESC
)

SELECT * FROM customer_rating_preference