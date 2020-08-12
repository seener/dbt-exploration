
  create view "dvd_rental"."dev"."customer_life_time_value__dbt_tmp" as (
    with customer_life_time_value as (
    SELECT
        customer_id,
        sum(amount) AS life_time_value
    FROM dvd_rental.public.payment
    GROUP BY customer_id
)

SELECT * FROM customer_life_time_value
  );
