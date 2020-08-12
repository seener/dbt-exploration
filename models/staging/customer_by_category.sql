with customer_by_category as (
    SELECT 
        customer_id,
        {{dbt_utils.pivot(
            'film_category',
            dbt_utils.get_column_values(
                ref('rental_details'), 
                'film_category'
            )
        )}}
    FROM {{ref('rental_details')}}
    GROUP BY customer_id
)

SELECT * FROM customer_by_category