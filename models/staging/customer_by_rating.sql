with customer_by_rating as (
    SELECT 
        customer_id,
        {{dbt_utils.pivot(
            column='film_rating',
            values=dbt_utils.get_column_values(
                table=ref('rental_details'), 
                column='film_rating'
            )
        )}}
    FROM {{ref('rental_details')}}
    GROUP BY customer_id
)

SELECT * FROM customer_by_rating