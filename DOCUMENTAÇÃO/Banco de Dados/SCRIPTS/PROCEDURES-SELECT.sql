-- CLIENTES
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

-- TIPOS DE ANÚNCIO
DROP PROCEDURE IF EXISTS TIPOANUNCIO_SELECT
DELIMITER &&
CREATE PROCEDURE TIPOANUNCIO_SELECT(
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
END
&&

-- STATUS DO ANÚNCIO
DELIMITER &&
CREATE PROCEDURE STATUSANUNCIO_SELECT(
        IN codigo INT(11),
        IN descricao VARCHAR(150)
)
BEGIN
    SELECT * FROM statusanuncio 
    WHERE staCodigo = 
		CASE	
			WHEN codigo = 0 OR codigo IS NULL THEN staCodigo
			WHEN codigo > 0 THEN codigo		       
		END
	AND staDescricao LIKE
		CASE	
			WHEN descricao = '' OR descricao IS NULL THEN staDescricao
			WHEN descricao <> '' THEN CONCAT('%', descricao, '%')
		END;    
END
&&

-- TIPOS DE AVALIAÇÕES
DELIMITER &&
CREATE PROCEDURE TIPOAVALIACAO_SELECT(
        IN codigo INT(11),
        IN descricao VARCHAR(150)
)
BEGIN
    SELECT * FROM tipoavaliacoes 
    WHERE tivCodigo = 
		CASE	
			WHEN codigo = 0 OR codigo IS NULL THEN tivCodigo
			WHEN codigo > 0 THEN codigo		       
		END
	AND tivDescricao LIKE
		CASE	
			WHEN descricao = '' OR descricao IS NULL THEN tivDescricao
			WHEN descricao <> '' THEN CONCAT('%', descricao, '%')
		END;    
END
&&