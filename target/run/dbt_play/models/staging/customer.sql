
  create view "dvd_rental"."dev"."customer__dbt_tmp" as (
    with customer as (
    SELECT
        a.customer_id,
        a.active,
        a.last_name,
        c.city,
        d.country
    FROM dvd_rental.public.customer a
    INNER JOIN dvd_rental.public.address b ON a.address_id = b.address_id
    INNER JOIN dvd_rental.public.city c ON b.city_id = c.city_id
    INNER JOIN dvd_rental.public.country d ON c.country_id = d.country_id
)

SELECT * FROM customer
  );
