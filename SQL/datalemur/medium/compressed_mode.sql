SELECT
  item_count as mode
FROM items_per_order
WHERE order_occurrences = (
      SELECT max(order_occurrences) as max_occurrence
      FROM items_per_order
)
ORDER BY item_count;
