{% snapshot hosts_snapshot %}

{{
    config(
        target_schema='SNAPSHOTS',
        unique_key='ID',
        strategy='timestamp',
        updated_at='UPDATED_AT'
    )
}}

select
    ID,
    NAME,
    IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT

from {{ source('airbnb', 'hosts') }}

{% endsnapshot %}