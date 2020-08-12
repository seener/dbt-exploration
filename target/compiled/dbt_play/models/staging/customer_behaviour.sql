with rental_details as (
    SELECT 
        customer_id,
        returned,
        late, 
        paid
    FROM "dvd_rental"."dev"."rental_details"
),
customer_behaviour as(
    SELECT 
        customer_id, 
        sum(cast(returned as int)) as num_return, 
        sum(cast(late as int)) as num_late, 
        sum(cast(paid as int)) as num_paid 
    FROM rental_details 
    GROUP BY customer_id
)

SELECT * FROM customer_behaviour