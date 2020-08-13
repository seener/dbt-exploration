with customer_by_category as (
    SELECT 
        customer_id,
        {{dbt_utils.pivot(
            column='film_category',
            values=dbt_utils.get_column_values(
                table=ref('rental_details'), 
                column='film_category'),
            prefix='dol_',
            then_value='payment_amount',
            else_value=0
        )}}
    FROM {{ref('rental_details')}}
    GROUP BY customer_id
)

SELECT * FROM customer_by_category_dollars