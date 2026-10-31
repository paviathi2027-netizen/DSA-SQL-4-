SELECT 
card_name,
max(issued_amount),
min(issued_amount),
max(issued_amount) -  min(issued_amount) as difference
FROM monthly_cards_issued
GROUP BY card_name 
ORDER BY difference DESC;

SELECT 
Round(
  sum(item_count * order_occurrences)
  /sum(order_occurrences),1) as mean
FROM items_per_order;

WITH tot_profit_data AS 
(SELECT 
drug,
(total_sales - cogs) as total_profit
FROM pharmacy_sales)

SELECT
*,
row_number() OVER(order by total_profit desc) as Rnk 
from tot_profit_data limit 3;


SELECT 
manufacturer,
count(drug) as drug_count,
abs(sum(total_sales - cogs)) as total_loss
FROM pharmacy_sales where cogs > total_sales
GROUP BY manufacturer 
ORDER BY total_loss DESC;
