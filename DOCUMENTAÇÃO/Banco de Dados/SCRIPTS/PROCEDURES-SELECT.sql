-- PRODUTO
DROP PROCEDURE IF EXISTS PRODUTO_SELECT
DELIMITER &&
CREATE PROCEDURE PRODUTO_SELECT(
        IN codigo INT(11),
        IN nome VARCHAR(150),
        IN preco DECIMAL(8,2),
        IN quantidade INT
)
BEGIN
    SELECT * FROM   PRODUTO 
    WHERE proCodigo = 
		CASE	
			WHEN codigo = 0 OR codigo IS NULL THEN proCodigo
			WHEN codigo > 0 THEN codigo		       
		END
	AND proNome LIKE
		CASE	
			WHEN nome = '' OR nome IS NULL THEN proNome
			WHEN nome <> '' THEN CONCAT('%', nome, '%')
		END
    AND proPreco LIKE
		CASE	
			WHEN preco = 0 OR preco IS NULL THEN proPreco
			WHEN preco > 0 THEN preco
		END
	AND proQuantidade LIKE
		CASE	
			WHEN quantidade = 0 OR quantidade IS NULL THEN proQuantidade
			WHEN quantidade > 0 THEN quantidade
		END;   
END
&&

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

-- USUÁRIOS
DROP PROCEDURE IF EXISTS USUARIO_SELECT
DELIMITER &&
CREATE PROCEDURE USUARIO_SELECT(
        IN codigo INT(11),
        IN login VARCHAR(150)
)
BEGIN
    SELECT * FROM USUARIO 
    WHERE usrCodigo = 
		CASE	
			WHEN codigo = 0 OR codigo IS NULL THEN usrCodigo
			WHEN codigo > 0 THEN codigo		       
		END
	AND usrLogin LIKE
		CASE	
			WHEN login = '' OR login IS NULL THEN usrLogin
			WHEN login <> '' THEN CONCAT('%', login, '%')
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

-- TIPOS DE ANÚNCIO
DROP PROCEDURE IF EXISTS TIPOMOVIMENTACAO_SELECT
DELIMITER &&
CREATE PROCEDURE TIPOMOVIMENTACAO_SELECT(
        IN codigo INT(11),
        IN descricao VARCHAR(150)
)
BEGIN
    SELECT * FROM TIPOMOVIMENTACAO 
    WHERE timCodigo = 
		CASE	
			WHEN codigo = 0 OR codigo IS NULL THEN timCodigo
			WHEN codigo > 0 THEN codigo		       
		END
	AND timDescricao LIKE
		CASE	
			WHEN descricao = '' OR descricao IS NULL THEN timDescricao
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

-- STATUS DO PEDIDO
DELIMITER &&
CREATE PROCEDURE STATUSPEDIDO_SELECT(
        IN codigo INT(11),
        IN descricao VARCHAR(150)
)
BEGIN
    SELECT * FROM statuspedido 
    WHERE stpCodigo = 
		CASE	
			WHEN codigo = 0 OR codigo IS NULL THEN stpCodigo
			WHEN codigo > 0 THEN codigo		       
		END
	AND stpDescricao LIKE
		CASE	
			WHEN descricao = '' OR descricao IS NULL THEN stpDescricao
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

-- ANÚNCIO
DELIMITER &&
CREATE PROCEDURE ANUNCIOPRODUTO_SELECT(
    IN codigo INT(11)
)
BEGIN
	SELECT pro.proCodigo, pro.proNome, pro.proPreco, anu.anuPreco, ROUND((tip.tiaPercentual *  anu.anuPreco),2) as taxa 
	FROM tipoanuncio as tip 
	INNER JOIN (produto AS pro INNER JOIN (anuncio as anu INNER JOIN produtoAnuncio as prodAnu ON prodAnu.anuCodigo = anu.anuCodigo) ON pro.proCodigo = prodAnu.proCodigo) ON tip.tiaCodigo = anu.tiaCodigo 
	WHERE anu.anuCodigo = codigo 
	ORDER BY anu.anuDescricao;
END
&&

DELIMITER &&
CREATE PROCEDURE ANUNCIO_SELECT (
	IN codigo INT,
	IN descricao VARCHAR(255),
	IN preco DECIMAL(8,2),
	IN dataCriacao DATE,
	IN tipoAnuncio VARCHAR(255),
	IN statusAnuncio VARCHAR(255)
)
BEGIN
	SELECT a.anuCodigo, s.staDescricao, t.tiaDescricao, a.anuDescricao, a.anuPreco, a.anuDataCriacao, s.staCodigo, t.tiaCodigo
	FROM anuncio AS a 
	INNER JOIN statusAnuncio AS s ON a.staCodigo = s.staCodigo 
	INNER JOIN tipoanuncio AS t on a.tiaCodigo = t.tiaCodigo
	WHERE a.anuCodigo = 
		CASE	
			WHEN codigo = 0 OR codigo IS NULL THEN a.anuCodigo
			WHEN codigo > 0 THEN codigo		       
		END
	AND a.anuDescricao LIKE
		CASE	
			WHEN descricao = '' OR descricao IS NULL THEN a.anuDescricao
			WHEN descricao <> '' THEN CONCAT('%', descricao, '%')
		END
	AND a.anuPreco LIKE
		CASE	
			WHEN preco = 0 OR preco IS NULL THEN a.anuPreco
			WHEN preco > 0 THEN preco
		END
	AND a.anuDataCriacao LIKE
		CASE	
			WHEN dataCriacao = '' OR dataCriacao IS NULL THEN a.anuDataCriacao
			WHEN dataCriacao <> '' THEN CONCAT('%', dataCriacao, '%')
		END    
	AND s.staDescricao =
		CASE	
			WHEN statusAnuncio = '' OR statusAnuncio IS NULL THEN s.staDescricao
			WHEN statusAnuncio <> '' THEN statusAnuncio
		END
	AND t.tiaDescricao =
		CASE	
			WHEN tipoAnuncio = '' OR tipoAnuncio IS NULL THEN t.tiaDescricao
			WHEN tipoAnuncio <> '' THEN tipoAnuncio
		END
		
	ORDER BY a.anuCodigo;
END
&&