﻿DROP VIEW IF EXISTS inventory.item_scrud_view;

CREATE VIEW inventory.item_scrud_view
AS
SELECT
    inventory.items.item_id,
    inventory.items.item_code,
    inventory.items.item_name,
    inventory.items.barcode,
    inventory.items.item_group_id,
    inventory.item_groups.item_group_name,
    inventory.item_types.item_type_id,
    inventory.item_types.item_type_name,
    inventory.items.brand_id,
    inventory.brands.brand_name,
    inventory.items.preferred_supplier_id,
    inventory.items.unit_id,
    inventory.units.unit_code,
    inventory.units.unit_name,
    inventory.items.hot_item,
    inventory.items.cost_price,
    inventory.items.selling_price,
    inventory.items.maintain_inventory,
    inventory.items.allow_sales,
    inventory.items.allow_purchase,
    inventory.items.photo
FROM inventory.items
INNER JOIN inventory.item_groups
ON inventory.item_groups.item_group_id = inventory.items.item_group_id
INNER JOIN inventory.item_types
ON inventory.item_types.item_type_id = inventory.items.item_type_id
INNER JOIN inventory.brands
ON inventory.brands.brand_id = inventory.items.brand_id
INNER JOIN inventory.units
ON inventory.units.unit_id = inventory.items.unit_id
WHERE NOT inventory.items.deleted;