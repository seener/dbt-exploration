




with all_values as (

    select distinct
        language as value_field

    from "dvd_rental"."dev"."customer_profile"

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'English','Italian','Japanese','Mandarin','French','German'
    )
)

select count(*) as validation_errors
from validation_errors

