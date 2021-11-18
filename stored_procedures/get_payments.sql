DROP PROCEDURE IF EXISTS get_payments;

DELIMITER $$
CREATE PROCEDURE get_payments(cid INT, pmid TINYINT)
BEGIN
	SELECT *
    FROM payments p
    WHERE p.client_id = IFNULL(cid, p.client_id) AND p.payment_method = IFNULL(pmid, p.payment_method);
END $$
DELIMITER ;