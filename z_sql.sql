ALTER TABLE `lrvlive`.`voucher_orders`
ADD COLUMN `voucher_orders_lastname` VARCHAR(100) NULL DEFAULT NULL COMMENT '' AFTER `voucher_order_name`;