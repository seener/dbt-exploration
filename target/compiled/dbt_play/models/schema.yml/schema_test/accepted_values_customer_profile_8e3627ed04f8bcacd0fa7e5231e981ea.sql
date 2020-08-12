




with all_values as (

    select distinct
        last_initial as value_field

    from "dvd_rental"."dev"."customer_profile"

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
    )
)

select count(*) as validation_errors
from validation_errors

