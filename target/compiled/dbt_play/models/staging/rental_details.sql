with rental_payment as (
    SELECT * FROM "dvd_rental"."dev"."rental_payment"
),
rental_details as(
    SELECT
        r.rental_id,
        r.customer_id,
        r.rental_date,
        CASE WHEN r.return_date is null THEN FALSE ELSE TRUE END as returned,
        CASE WHEN date_part('day', return_date - rental_date) > f.rental_duration THEN TRUE ELSE FALSE END as late,
        CASE WHEN rental_payment.amount is null THEN FALSE WHEN rental_payment.amount <= 0 THEN FALSE ELSE TRUE END as paid,
        f.title as film_title,
        f.rating as film_rating,
        l.name as film_language,
        c.name as film_category,
        CASE WHEN rental_payment.amount is null THEN 0 ELSE rental_payment.amount END as payment_amount
    FROM dvd_rental.public.rental r
    INNER JOIN dvd_rental.public.inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN dvd_rental.public.film f ON i.film_id = f.film_id
    INNER JOIN dvd_rental.public.language l ON f.language_id = l.language_id
    INNER JOIN dvd_rental.public.film_category fc ON f.film_id = fc.film_id
    INNER JOIN dvd_rental.public.category c ON fc.category_id = c.category_id
    LEFT JOIN rental_payment ON r.rental_id = rental_payment.rental_id
)

SELECT * FROM rental_details