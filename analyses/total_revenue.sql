
-- Analyses are .sql files that live in the analyses folder.
-- Analyses will not be run with dbt run like models. However, you can still compile these from Jinja-SQL to pure SQL using dbt compile. These will compile to the target folder.
-- Analyses are useful for training queries, one-off queries, and audits

-- Using your new knowledge of analyses, create an analysis file in the analysis folder called total_revenue.sql that uses the stg_payments model and sums the amount of successful payments. (Remember to use Jinja in this rather than the raw table name)

with payments as (
select * from {{ ref('stg_payments') }}
),

aggregated as (
select
sum(amount) as total_revenue
from payments
where status = 'success'
)

select * from aggregated