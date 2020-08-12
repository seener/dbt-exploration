with rental_payment as(
    SELECT 
        rental_id, 
        sum(amount) as amount 
    FROM dvd_rental.public.payment 
    GROUP BY rental_id
)

SELECT * FROM rental_payment