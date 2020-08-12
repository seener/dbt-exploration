



select count(*) as validation_errors
from "dvd_rental"."dev"."customer_profile"
where customer_id is null

