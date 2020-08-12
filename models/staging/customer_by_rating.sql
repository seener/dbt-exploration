with customer_by_rating as (
    SELECT 
        customer_id,
        {{dbt_utils.pivot(
            'film_rating',
            dbt_utils.get_column_values(
                ref('rental_details'), 
                'film_rating'
            )
        )}}
    FROM {{ref('rental_details')}}
    GROUP BY customer_id
)

SELECT * FROM customer_by_rating