DELIMITER //

CREATE FUNCTION fatorial (n INT)
RETURNS INT
BEGIN
	DECLARE resultado INT DEFAULT 1;
    WHILE n > 0 DO
		SET resultado = resultado * n;
        SET n = n - 1;
	END WHILE;
    RETURN resultado;
END;

DELIMITER ;

SELECT FATORIAL (n);