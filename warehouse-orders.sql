--Joining the two tables.
SELECT
  orders.*,
  warehouse.warehouse_alias,
  warehouse.state
FROM
  warehouse_orders.Orders orders
INNER JOIN warehouse_orders.Warehouse warehouse
  ON orders.warehouse_id = warehouse.warehouse_id;

--Count number of orders by state.
SELECT
  warehouse.state,
  COUNT(DISTINCT orders.order_id) number_of_orders
FROM
  warehouse_orders.Orders orders
INNER JOIN warehouse_orders.Warehouse warehouse
  ON  orders.warehouse_id = warehouse.warehouse_id
GROUP BY
  warehouse.state
ORDER BY
  number_of_orders DESC;

--Return the number of all the unique customers from each state.
SELECT
  warehouse.state state,
  COUNT(DISTINCT customer_id) number_of_customers
FROM
  warehouse_orders.Orders orders
INNER JOIN warehouse_orders.Warehouse warehouse
  ON orders.warehouse_id = warehouse.warehouse_id
GROUP BY
  warehouse.state
ORDER BY
  number_of_customers DESC;