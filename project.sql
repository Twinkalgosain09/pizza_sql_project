create database pizzahut;
use  pizzahut;

create table order_details (
order_details_id int not null,
order_id int not null,
pizza_id text,
quantity int not null,
primary key(order_details_id) );

create table orders (
order_id int not null ,
order_date date not null ,
order_time time not null ,
primary key(order_id) );

SELECT * FROM pizzahut.orders; 
SELECT * FROM pizzahut.orders;
select * from order_details ; 
select * from pizzas; 
select * from pizza_types; 

-- Retrieve the total number of orders placed
select count(order_id) as total_orders from orders; 

-- Calculate the total revenue generated from pizza sales.
SELECT 
    SUM(order_details.quantity * pizzas.price) AS total_revanue
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;

-- Identify the highest-priced pizza.--
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1; 

-- Identify the most common pizza size ordered.
SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC; 

-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC LIMIT 5;  



