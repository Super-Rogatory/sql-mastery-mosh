DROP PROCEDURE IF EXISTS get_invoices_by_client;
DELIMITER $$
CREATE PROCEDURE get_invoices_by_client(cid INT)
BEGIN
	SELECT *
	FROM clients c
	JOIN invoices
		USING(client_id)
	WHERE c.client_id = cid;	
END $$

DELIMITER ;