with customer_rental_summary as (
    SELECT 
        customer_id, 
        min(rental_date) as first_rental, 
        max(rental_date) as last_rental,
        count(*) as num_rental,
        date_part('day', max(rental_date) - min(rental_date)) as period_days,
        date_part('day', max(rental_date) - min(rental_date)) / 7 as period_weeks,
        date_part('day', max(rental_date) - min(rental_date)) / 30.4 as period_months,
        date_part('day', max(rental_date) - min(rental_date)) / 365 as period_years
    FROM dvd_rental.public.rental
    GROUP BY customer_id
)

SELECT * FROM customer_rental_summary