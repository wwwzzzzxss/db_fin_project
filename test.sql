UPDATE orders
SET deleted = 0
WHERE deleted IS NULL;
