select ifnull(c.id, 'No customer found') as customer_id
  , ifnull(c.name, 'No customer found') as name
  , ifnull(c.email, 'No customer found') as email
  , min(o.created_at) as first_order_at
  , count(distinct o.id) as number_of_orders
from `analytics-engineers-club.coffee_shop.customers` c
full outer join `analytics-engineers-club.coffee_shop.orders` o
  on c.id = o.customer_id
group by c.id, c.name, c.email
