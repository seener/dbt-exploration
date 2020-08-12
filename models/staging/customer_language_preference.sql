with rental_details as (
    SELECT * FROM {{ref('rental_details')}}
),
customer_language_preference as (
    SELECT DISTINCT ON (customer_id)
        customer_id,
        film_language as language
    FROM rental_details
    GROUP BY customer_id, film_language
    ORDER BY customer_id ASC, COUNT(*) DESC
)

SELECT * FROM customer_language_preference
