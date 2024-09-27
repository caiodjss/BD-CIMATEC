DELIMITER //

CREATE FUNCTION verificar_par_impar (a INT)
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	IF a % 2 = 0 THEN
		RETURN 'Par';
	ELSE
		RETURN 'Impar';
	END IF;
END//

DELIMITER ;

select verificar_par_impar (10)