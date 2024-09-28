SELECT ROUND(sum(item_count::decimal*order_occurrences::decimal)/sum(order_occurrences::decimal),1) as mean
FROM items_per_order;
