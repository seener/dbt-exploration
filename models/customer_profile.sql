with customer as (
    SELECT * FROM {{ref('customer')}}
),
rental as (
    SELECT * FROM {{ref('customer_rental_summary')}}
),
ltv as (
    SELECT * FROM {{ref('customer_life_time_value')}}
),
lang as (
    SELECT * FROM {{ref('customer_language_preference')}}
),
behave as (
    SELECT *FROM {{ref('customer_behaviour')}}
),
customer_profile as (
    SELECT 
        customer.customer_id,
        customer.active,
        left(customer.last_name, 1) as last_initial,
        customer.city,
        customer.country,
        rental.first_rental,
        rental.last_rental,
        rental.period_days,
        ltv.life_time_value,
        rental.num_rental,
        behave.num_return,
        behave.num_late,
        behave.num_paid,
        lang.language
    FROM customer
    LEFT JOIN rental USING(customer_id)
    LEFT JOIN ltv USING(customer_id)
    LEFT JOIN lang USING(customer_id)
    LEFT JOIN behave USING(customer_id)
)

SELECT * FROM customer_profile