



select count(*) as validation_errors
from (

    select
        customer_id

    from "dvd_rental"."dev"."customer_profile"
    where customer_id is not null
    group by customer_id
    having count(*) > 1

) validation_errors

