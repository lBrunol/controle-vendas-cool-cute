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

-- PEDIDO
DROP PROCEDURE IF EXISTS PEDIDO_SELECT
DELIMITER &&
CREATE PROCEDURE PEDIDO_SELECT(
        IN codigo INT(11),
        IN dataVenda date,
        IN dataPostagem date,
        IN dataEntrega date,
        IN statusPedido VARCHAR(255),
        IN tipoAvaliacao VARCHAR(255),
        IN cliente VARCHAR (255),
        IN email VARCHAR (255),
        IN anuncio VARCHAR (255)
)
BEGIN
    SELECT 
		ped.pedCodigo, 
		tiv.tivDescricao, 
		stp.stpDescricao, 
		anu.anuDescricao, 
		cli.cliNome,
        cli.cliEmail,
		ped.pedDataVenda, 
		ped.pedValorFrete, 
		ped.pedDataPostagem, 
		ped.pedDataEntrega, 
		ped.pedValorTotal, 
		ped.pedCodigoPostagem, 
		ped.pedObservacao
	FROM pedido as ped 
	INNER JOIN tipoAvaliacoes as tiv ON ped.tivCodigo = tiv.TivCodigo 
	INNER JOIN anuncio as anu ON ped.anuCodigo = anu.anuCodigo 
	INNER JOIN cliente as cli ON ped.cliCodigo = cli.cliCodigo 
	INNER JOIN statusPedido as stp ON ped.stpCodigo = stp.stpCodigo
    WHERE ped.pedCodigo = 
		CASE	
			WHEN codigo = 0 OR codigo IS NULL THEN ped.pedCodigo
			WHEN codigo > 0 THEN codigo		       
		END
	AND ped.pedDataVenda LIKE
		CASE	
			WHEN dataVenda = '' OR dataVenda IS NULL THEN ped.pedDataVenda
			WHEN dataVenda <> '' THEN CONCAT('%', dataVenda, '%')
		END
    AND ped.pedDataPostagem LIKE
		CASE	
			WHEN dataPostagem = '' OR dataPostagem IS NULL THEN ped.pedDataPostagem
			WHEN dataPostagem <> '' THEN CONCAT('%', dataPostagem, '%')
		END
	AND ped.pedDataEntrega LIKE
		CASE	
			WHEN dataEntrega = '' OR dataEntrega IS NULL THEN ped.pedDataEntrega
			WHEN dataEntrega <> '' THEN CONCAT('%', dataEntrega, '%')
		END
	AND stp.stpDescricao =
		CASE	
			WHEN statusPedido = '' OR statusPedido IS NULL THEN stp.stpDescricao
			WHEN statusPedido <> '' THEN statusPedido
		END
	AND tiv.tivDescricao =
		CASE	
			WHEN tipoAvaliacao = '' OR tipoAvaliacao IS NULL THEN tiv.tivDescricao
			WHEN tipoAvaliacao <> '' THEN tipoAvaliacao
		END
	AND cli.cliNome LIKE
		CASE	
			WHEN cliente = '' OR cliente IS NULL THEN cli.cliNome
			WHEN cliente <> '' THEN CONCAT('%', cliente, '%')
		END
	AND cli.cliEmail LIKE
		CASE	
			WHEN email = '' OR email IS NULL THEN cli.cliEmail
			WHEN email <> '' THEN CONCAT('%', email, '%')
		END
	AND anu.anuDescricao LIKE
		CASE	
			WHEN anuncio = '' OR anuncio IS NULL THEN anu.anuDescricao
			WHEN anuncio <> '' THEN CONCAT('%', anuncio, '%')
		END;
END
&&