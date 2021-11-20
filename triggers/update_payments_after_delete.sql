-- Create a trigger that gets fired when we delete a payment.
DROP TRIGGER IF EXISTS payment_after_delete;

DELIMITER $$
CREATE TRIGGER payment_after_delete
	AFTER DELETE ON payments 
	FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
END $$
DELIMITER ;