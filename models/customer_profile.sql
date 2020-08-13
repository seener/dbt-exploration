with customer_profile as (
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
        lang.language,
        {{dbt_utils.star(from=ref('customer_by_category'), except=['customer_id'])}},
        {{dbt_utils.star(from=ref('customer_by_category_dollars'), except=['customer_id'])}},
        {{dbt_utils.star(from=ref('customer_by_rating'), except=['customer_id'])}},
        {{dbt_utils.star(from=ref('customer_by_rating_dollars'), except=['customer_id'])}}
    FROM {{ref('customer')}} as customer
    LEFT JOIN {{ref('customer_rental_summary')}} as rental USING(customer_id)
    LEFT JOIN {{ref('customer_life_time_value')}} as ltv USING(customer_id)
    LEFT JOIN {{ref('customer_language_preference')}} as lang USING(customer_id)
    LEFT JOIN {{ref('customer_behaviour')}} as behave USING(customer_id)
    LEFT JOIN {{ref('customer_by_category')}} USING (customer_id)
    LEFT JOIN {{ref('customer_by_category_dollars')}} USING (customer_id)
    LEFT JOIN {{ref('customer_by_rating')}} USING (customer_id)
    LEFT JOIN {{ref('customer_by_rating_dollars')}} USING (customer_id)
)

SELECT * FROM customer_profile