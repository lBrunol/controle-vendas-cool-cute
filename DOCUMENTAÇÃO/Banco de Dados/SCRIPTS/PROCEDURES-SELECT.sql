DROP PROCEDURE IF EXISTS CLIENTE_SELECT
DELIMITER &&
CREATE PROCEDURE CLIENTE_SELECT(
        IN codigo INT(11),
        IN nome VARCHAR(150),
        IN email VARCHAR(150)
)
BEGIN
    SELECT * FROM   cliente 
    WHERE cliCodigo = 
		CASE	
			WHEN codigo = 0 OR codigo IS NULL THEN cliCodigo
			WHEN codigo > 0 THEN codigo		       
		END
	AND cliNome LIKE
		CASE	
			WHEN nome = '' OR nome IS NULL THEN cliNome
			WHEN nome <> '' THEN CONCAT('%', nome, '%')
		END
    AND cliEmail LIKE
		CASE	
			WHEN email = '' OR email IS NULL THEN cliEmail
			WHEN email <> '' THEN CONCAT('%', email, '%')
		END;    
END
&&

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIPOANUNCIO_SELECT`(
        IN codigo INT(11),
        IN descricao VARCHAR(150)
)
BEGIN
    SELECT * FROM   TIPOANUNCIO 
    WHERE tiaCodigo = 
		CASE	
			WHEN codigo = 0 OR codigo IS NULL THEN tiaCodigo
			WHEN codigo > 0 THEN codigo		       
		END
	AND tiaDescricao LIKE
		CASE	
			WHEN descricao = '' OR descricao IS NULL THEN tiaDescricao
			WHEN descricao <> '' THEN CONCAT('%', descricao, '%')
		END;    
END$$
DELIMITER ;
