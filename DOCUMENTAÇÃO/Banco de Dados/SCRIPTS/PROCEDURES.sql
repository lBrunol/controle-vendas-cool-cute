-- STATUSPEDIDO
DROP PROCEDURE IF EXISTS STATUSPEDIDO_INSERT;
DELIMITER &&
 	CREATE PROCEDURE STATUSPEDIDO_INSERT (
	IN V_STPDESCRICAO VARCHAR(255)
	   
   	)
	BEGIN
    	INSERT INTO STATUSPEDIDO (STPDESCRICAO ) VALUES (V_STPDESCRICAO);
  	END
&&

DROP PROCEDURE IF EXISTS STATUSPEDIDO_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE STATUSPEDIDO_UPDATE (
	IN  V_STPCODIGO INT,
        V_STPDESCRICAO VARCHAR(255)
	   	   
   	)
	BEGIN
    	UPDATE STATUSPEDIDO SET STPDESCRICAO = V_STPDESCRICAO WHERE STPCODIGO = V_STPCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS STATUSPEDIDO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE STATUSPEDIDO_DELETE (
	IN  V_STPCODIGO INT		  
   	)
	BEGIN
    	DELETE FROM STATUSPEDIDO WHERE STPCODIGO = V_STPCODIGO;
  	END
&&

-- STATUSANUNCIO
DROP PROCEDURE IF EXISTS STATUSANUNCIO_INSERT;
DELIMITER &&
 	CREATE PROCEDURE STATUSANUNCIO_INSERT (
	IN V_STADESCRICAO VARCHAR(255)
	   
   	)
	BEGIN
    	INSERT INTO STATUSANUNCIO (STADESCRICAO ) VALUES (V_STADESCRICAO);
  	END
&&

DROP PROCEDURE IF EXISTS STATUSANUNCIO_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE STATUSANUNCIO_UPDATE (
	IN  V_STACODIGO INT,
	V_STADESCRICAO VARCHAR(255)
	   	   
   	)
	BEGIN
    	UPDATE STATUSANUNCIO SET STADESCRICAO = V_STADESCRICAO WHERE STACODIGO = V_STACODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS STATUSANUNCIO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE STATUSANUNCIO_DELETE (
	IN  V_STACODIGO INT		  
   	)
	BEGIN
    	DELETE FROM STATUSANUNCIO WHERE STACODIGO = V_STACODIGO;
  	END
&&

-- PRODUTO
DROP PROCEDURE IF EXISTS PRODUTO_INSERT;
DELIMITER &&
CREATE PROCEDURE PRODUTO_INSERT (
 	IN V_PRONOME VARCHAR(255),
	   V_PROESTOQUEMIN INT,
	   V_PROPRECO DECIMAL(8,2),
	   V_PROISATIVO BOOL 
   	)
	BEGIN
    	INSERT INTO PRODUTO (PRONOME, PROESTOQUEMIN, PROPRECO, PROQUANTIDADE, PROISATIVO) VALUES (V_PRONOME, V_PROESTOQUEMIN, V_PROPRECO, V_PROQUANTIDADE, V_PROISATIVO);
  	END
&&

DROP PROCEDURE IF EXISTS PRODUTO_UPDATE;
DELIMITER &&
CREATE PROCEDURE PRODUTO_UPDATE (

 	IN 
	V_PROCODIGO INT,
 	V_PRONOME VARCHAR(255),
  	V_PROESTOQUEMIN INT,
   	V_PROPRECO DECIMAL(8,2),
   	V_PROISATIVO BOOL
   	)
	BEGIN

    	UPDATE PRODUTO SET PRONOME = V_PRONOME, PROESTOQUEMIN = V_PROESTOQUEMIN, PROPRECO = V_PROPRECO, PROISATIVO = V_PROISATIVO WHERE PROCODIGO = V_PROCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS PRODUTO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE PRODUTO_DELETE (
		IN V_PROCODIGO INT	   
   	)
	BEGIN
    	DELETE FROM PRODUTO WHERE PROCODIGO = V_PROCODIGO;
  	END
&&

-- USUARIO
DROP PROCEDURE IF EXISTS USUARIO_INSERT;
DELIMITER &&
 	CREATE PROCEDURE USUARIO_INSERT (
	IN V_USRLOGIN VARCHAR(255),
	   v_USRSENHA VARCHAR(255),
	   V_USRISADMINISTRADOR BOOL,
	   V_USRISATIVO BOOL	   
   	)
	BEGIN
    	INSERT INTO USUARIO (USRLOGIN,USRSENHA,USRISADMINISTRADOR,USRISATIVO) 
		VALUES (V_USRLOGIN,V_USRSENHA,V_USRISADMINISTRADOR,V_USRISATIVO);
  	END
&&

DROP PROCEDURE IF EXISTS USUARIO_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE USUARIO_UPDATE (
	IN  V_USRCODIGO INT,
        V_USRLOGIN VARCHAR(255),
	    V_USRSENHA VARCHAR(255),
		V_USRISADMINISTRADOR BOOL,
		V_USRISATIVO BOOL
           	   
   	)
	BEGIN
    	UPDATE USUARIO SET USRLOGIN = V_USRLOGIN, USRSENHA = V_USRSENHA, USRISADMINISTRADOR = V_USRISADMINISTRADOR, USRISATIVO = V_USRISATIVO 
		WHERE USRCODIGO = V_USRCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS USUARIO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE USUARIO_DELETE (
	IN  V_USRCODIGO INT		  
   	)
	BEGIN
    	DELETE FROM USUARIO WHERE USRCODIGO = V_USRCODIGO;
  	END
&&

-- TIPOAVALIACOES
DROP PROCEDURE IF EXISTS TIPOAVALIACOES_INSERT;
DELIMITER &&
 	CREATE PROCEDURE TIPOAVALIACOES_INSERT (
	IN V_TIVDESCRICAO VARCHAR(255)
	   
   	)
	BEGIN
    	INSERT INTO TIPOAVALIACOES (TIVDESCRICAO ) VALUES (V_TIVDESCRICAO);
  	END
&&

DROP PROCEDURE IF EXISTS TIPOAVALIACOES_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE TIPOAVALIACOES_UPDATE (
	IN  V_TIVCODIGO INT,
	V_TIVDESCRICAO VARCHAR(255)
	   	   
   	)
	BEGIN
    	UPDATE TIPOAVALIACOES SET TIVDESCRICAO = V_TIVDESCRICAO WHERE TIVCODIGO = V_TIVCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS TIPOAVALIACOES_DELETE;
DELIMITER &&
 	CREATE PROCEDURE TIPOAVALIACOES_DELETE (
	IN  V_TIVCODIGO INT		  
   	)
	BEGIN
    	DELETE FROM TIPOAVALIACOES WHERE TIVCODIGO = V_TIVCODIGO;
END
&&

-- TIPOANUNCIO
DROP PROCEDURE IF EXISTS TIPOANUNCIO_INSERT;
DELIMITER &&
 	CREATE PROCEDURE TIPOANUNCIO_INSERT (
	IN V_TIADESCRICAO VARCHAR(255),
	   V_TIAPERCENTUAL DECIMAL(8,2)	   
   	)
	BEGIN
    	INSERT INTO TIPOANUNCIO (TIADESCRICAO, TIAPERCENTUAL) VALUES (V_TIADESCRICAO, V_TIAPERCENTUAL);
  	END
&&

DROP PROCEDURE IF EXISTS TIPOANUNCIO_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE TIPOANUNCIO_UPDATE (
	IN  V_TIACODIGO INT,
		V_TIADESCRICAO VARCHAR(255),
	   	V_TIAPERCENTUAL DECIMAL(8,2)	   
   	)
	BEGIN
    	UPDATE TIPOANUNCIO SET TIADESCRICAO = V_TIADESCRICAO, TIAPERCENTUAL = V_TIAPERCENTUAL WHERE TIACODIGO = V_TIACODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS TIPOANUNCIO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE TIPOANUNCIO_DELETE (
	IN  V_TIACODIGO INT		  
   	)
	BEGIN
    	DELETE FROM TIPOANUNCIO WHERE TIACODIGO = V_TIACODIGO;
  	END
&&

-- CLIENTE
DROP PROCEDURE IF EXISTS CLIENTE_INSERT;
DELIMITER &&
 	CREATE PROCEDURE CLIENTE_INSERT (
	IN V_CLINOME VARCHAR(255),
	   V_CLIEMAIL VARCHAR(255)	   
   	)
	BEGIN
    	INSERT INTO CLIENTE (CLINOME, CLIEMAIL) VALUES (V_CLINOME, V_CLIEMAIL);
  	END
&&

DROP PROCEDURE IF EXISTS CLIENTE_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE CLIENTE_UPDATE (
	IN  V_CLICODIGO INT,
		V_CLINOME VARCHAR(255),
	   	V_CLIEMAIL VARCHAR(255)	   
   	)
	BEGIN
    	UPDATE CLIENTE SET CLINOME = V_CLINOME, CLIEMAIL = V_CLIEMAIL WHERE CLICODIGO = V_CLICODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS CLIENTE_DELETE;
DELIMITER &&
 	CREATE PROCEDURE CLIENTE_DELETE (
	IN  V_CLICODIGO INT		  
   	)
	BEGIN
    	DELETE FROM CLIENTE WHERE CLICODIGO = V_CLICODIGO;
  	END
&&

-- TIPOMOVIMENTACAO
DROP PROCEDURE IF EXISTS TIPOMOVIMENTACAO_INSERT;
DELIMITER &&
 	CREATE PROCEDURE TIPOMOVIMENTACAO_INSERT (
	IN V_TIMDESCRICAO VARCHAR(255),
	   V_OPERACAO BOOL	   
   	)
	BEGIN
    	INSERT INTO TIPOMOVIMENTACAO (TIMDESCRICAO,TIMOPERACAO) 
		VALUES (V_TIMDESCRICAO,V_OPERACAO);
  	END
&&

DROP PROCEDURE IF EXISTS TIPOMOVIMENTACAO_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE TIPOMOVIMENTACAO_UPDATE (
	IN  V_TIMCODIGO INT,
		V_TIMDESCRICAO VARCHAR(255),
		V_TIMOPERACAO BOOL
           	   
   	)
	BEGIN
    	UPDATE TIPOMOVIMENTACAO SET TIMDESCRICAO = V_TIMDESCRICAO, TIMOPERACAO = V_TIMOPERACAO 
		WHERE TIMCODIGO = V_TIMCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS TIPOMOVIMENTACAO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE TIPOMOVIMENTACAO_DELETE (
	IN  V_TIMCODIGO INT		  
   	)
	BEGIN
    	DELETE FROM TIPOMOVIMENTACAO WHERE TIMCODIGO = V_TIMCODIGO;
  	END
&&

-- ENTRADA--
DROP PROCEDURE IF EXISTS ENTRADA_INSERT;
DELIMITER &&
 	CREATE PROCEDURE ENTRADA_INSERT (
	IN 
	   V_ENTLOTE VARCHAR(255),
	   V_ENTVALORTOTAL DECIMAL(8,2),
       V_ENTOBSERVACAO VARCHAR(255)	   
   	)
	BEGIN
    	INSERT INTO ENTRADA (ENTLOTE, ENTVALORTOTAL,ENTOBSERVACAO) VALUES (V_ENTLOTE, V_ENTVALORTOTAL,V_ENTOBSERVACAO);
  	END
&&

DROP PROCEDURE IF EXISTS ENTRADA_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE ENTRADA_UPDATE (
	IN  V_ENTCODIGO INT,
	    V_ENTLOTE VARCHAR(255),
		V_VALORTOTAL DECIMAL(8,2),
        V_ENTOBSERVACAO VARCHAR(255)   	   
   	)
	BEGIN
    	UPDATE ENTRADA SET ENTLOTE = V_ENTLOTE, ENTVALORTOTAL = V_VALORTOTAL,ENTOBSERVACAO= V_ENTOBSERVACAO WHERE ENTCODIGO = V_ENTCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS ENTRADA_DELETE;
DELIMITER &&
 	CREATE PROCEDURE ENTRADA_DELETE (
	IN  V_ENTCODIGO INT		  
   	)
	BEGIN
    	DELETE FROM ENTRADA WHERE ENTCODIGO = V_ENTCODIGO;
  	END
&&

-- OUTRASMOVIMENTAÇOES
DROP PROCEDURE IF EXISTS OUTRASMOVIMENTACOES_INSERT;
DELIMITER &&
 	CREATE PROCEDURE OUTRASMOVIMENTACOES_INSERT (
	IN V_TIMCODIGO INT,
	   V_MOVDESCRICAO VARCHAR(255),
	   V_MOVVALOR DECIMAL(8,2),
       V_MOVDATA DATE	   
   	)
	BEGIN
    	INSERT INTO OUTRASMOVIMENTACOES ( TIMCODIGO, MOVDESCRICAO,MOVVALOR,MOVDATA) 
		VALUES (V_TIMCODIGO, V_MOVDESCRICAO,V_MOVVALOR,V_MOVDATA);
  	END
&&

DROP PROCEDURE IF EXISTS OUTRASMOVIMENTACOES_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE OUTRASMOVIMENTACOES_UPDATE (
	IN  V_MOVCODIGO INT,
		V_TIMCODIGO INT,
	    V_MOVDESCRICAO VARCHAR(255),
		V_MOVVALOR DECIMAL(8,2), 
		V_MOVDATA DATE
           	   
   	)
	BEGIN
    	UPDATE OUTRASMOVIMENTACOES SET TIMCODIGO = V_TIMCODIGO, MOVDESCRICAO = V_MOVDESCRICAO, MOVVALOR = V_MOVVALOR, MOVDATA = V_MOVDATA 
		WHERE MOVCODIGO = V_MOVCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS OUTRASMOVIMENTACOES_DELETE;
DELIMITER &&
 	CREATE PROCEDURE OUTRASMOVIMENTACOES_DELETE (
	IN  V_MOVCODIGO INT		  
   	)
	BEGIN
    	DELETE FROM OUTRASMOVIMENTACOES WHERE MOVCODIGO = V_MOVCODIGO;
  	END
&&

-- ANUNCIO
DROP PROCEDURE IF EXISTS ANUNCIO_INSERT;
DELIMITER &&
 	CREATE PROCEDURE ANUNCIO_INSERT (
	IN V_STACODIGO INT,
	   v_TIACODIGO INT,
	   V_ANUDESCRICAO VARCHAR(255),
	   V_ANUPRECO DECIMAL(8,2),
	   V_ANUDATACRIACAO DATE,
	   V_ANUISATIVO BOOL	   
   	)
	BEGIN
    	INSERT INTO ANUNCIO (STACODIGO,TIACODIGO,ANUDESCRICAO,ANUPRECO,ANUDATACRIACAO,ANUISATIVO) VALUES (V_STACODIGO, V_TIACODIGO, V_ANUDESCRICAO, V_ANUPRECO, V_ANUDATACRIACAO, V_ANUISATIVO);
  	END
&&

DROP PROCEDURE IF EXISTS ANUNCIO_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE ANUNCIO_UPDATE (
	IN  V_STACODIGO INT,
	    V_TIACODIGO INT,
		V_ANUDESCRICAO VARCHAR(255),
	   	V_ANUPRECO DECIMAL(8,2),
		V_ANUDATACRIACAO DATE,
		V_ANUISATIVO BOOL   	   
   	)
	BEGIN
    	UPDATE ANUNCIO SET STACODIGO = V_STACODIGO, TIACODIGO = V_TIACODIGO,ANUDESCRICAO = V_ANUDESCRICAO, ANUPRECO = V_ANUPRECO,ANUDATACRIACAO = V_ANUDATACRIACAO, ANUISATIVO = V_ANUISATIVO
		WHERE STACODIGO = V_STACODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS ANUNCIO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE ANUNCIO_DELETE (
	IN  V_ANUCODIGO INT		  
   	)
	BEGIN
    	DELETE FROM ANUNCIO WHERE ANUCODIGO = V_ANUCODIGO;
  	END
&&

-- ITENSENTRADA
DROP PROCEDURE IF EXISTS ITENSENTRADA_INSERT;
DELIMITER &&
 	CREATE PROCEDURE ITENSENTRADA_INSERT (
	IN V_PROCODIGO INT,
	   V_ENTCODIGO INT,
	   V_ITEQUANTIDADE INT,
	   V_ITEVALOR DECIMAL(8,2),
       V_ITEVALORTOTAL DECIMAL(8,2)	   
   	)
	BEGIN
    	INSERT INTO ITENSENTRADA (PROCODIGO,ENTCODIGO,ITEQUANTIDADE,ITEVALOR,ITEVALORTOTAL) 
		VALUES (V_PROCODIGO,V_ENTCODIGO,V_ITEQUANTIDADE,V_ITEVALOR,V_ITEVALORTOTAL);
  	END
&&

DROP PROCEDURE IF EXISTS ITENSENTRADA_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE ITENSENTRADA_UPDATE (
	IN  V_PROCODIGO INT,
	    V_ENTCODIGO INT,
		V_ITEQUANTIDADE INT,
		V_ITEVALOR DECIMAL(8,2), 
		V_ITEVALORTOTAL DECIMAL(8,2)
           	   
   	)
	BEGIN
    	UPDATE ITENSENTRADA SET PROCODIGO = V_PROCODIGO, ENTCODIGO = V_ENTCODIGO,ITEQUANTIDADE = V_ITEQUANTIDADE,
		ITEVALOR = V_ITEVALOR, ITEVALORTOTAL = V_ITEVALORTOTAL WHERE PROCODIGO = V_PROCODIGO AND ENTCODIGO = V_ENTCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS ITENSENTRADA_DELETE;
DELIMITER &&
 	CREATE PROCEDURE ITENSENTRADA_DELETE (
	IN  V_PROCODIGO INT,
	V_ENTCODIGO INT
   	)
	BEGIN
    	DELETE FROM ITENSENTRADA WHERE PROCODIGO = V_PROCODIGO AND ENTCODIGO = V_ENTCODIGO;
  	END
&&

-- PEDIDO
DROP PROCEDURE IF EXISTS PEDIDO_INSERT;
DELIMITER &&
 	CREATE PROCEDURE PEDIDO_INSERT (
 	IN V_TIVCODIGO INT,
	   V_STPCODIGO INT,
	   V_ANUCODIGO INT,
	   V_CLICODIGO INT,
	   V_PEDDATAVENDA DATE,
	   V_PEDVALORFRETE DECIMAL(8,2),
	   V_PEDDATAPOSTAGEM DATE,
	   V_PEDDATAENTREGA DATE,
	   V_PEDVALORTOTAL DECIMAL(8,2),
	   V_PEDCODIGOPOSTAGEM VARCHAR(255),
	   V_PEDOBSERVACAO VARCHAR(255)
   	)
	BEGIN
    	INSERT INTO PEDIDO (TIVCODIGO, STPCODIGO, ANUCODIGO, CLICODIGO, PEDDATAVENDA, PEDVALORFRETE, PEDDATAPOSTAGEM, PEDDATAENTREGA, PEDVALORTOTAL, PEDCODIGOPOSTAGEM, PEDOBSERVACAO) VALUES (V_TIVCODIGO, V_STPCODIGO, V_ANUCODIGO, V_CLICODIGO, V_PEDDATAVENDA, V_PEDVALORFRETE, V_PEDDATAPOSTAGEM, V_PEDDATAENTREGA, V_PEDVALORTOTAL, V_PEDCODIGOPOSTAGEM, V_PEDOBSERVACAO);
  	END
&&

DROP PROCEDURE IF EXISTS PEDIDO_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE PEDIDO_UPDATE (
	IN V_PEDCODIGO INT,
	   V_TIVCODIGO INT,
	   V_STPCODIGO INT,
	   V_ANUCODIGO INT,
	   V_CLICODIGO INT,
	   V_PEDDATAVENDA DATE,
	   V_PEDVALORFRETE DECIMAL(8,2),
	   V_PEDDATAPOSTAGEM DATE,
	   V_PEDDATAENTREGA DATE,
	   V_PEDVALORTOTAL DECIMAL(8,2),
	   V_PEDCODIGOPOSTAGEM VARCHAR(255),
	   V_PEDOBSERVACAO VARCHAR(255)
   	)
	BEGIN
    	UPDATE PEDIDO SET TIVCODIGO = V_TIVCODIGO, STPCODIGO = V_STPCODIGO, CLICODIGO = V_CLICODIGO, PEDDATAVENDA = V_PEDDATAVENDA, PEDVALORFRETE = V_PEDVALORFRETE, PEDDATAPOSTAGEM = V_PEDDATAPOSTAGEM, PEDDATAENTREGA = V_PEDDATAENTREGA, PEDVALORTOTAL = V_PEDVALORTOTAL,  PEDCODIGOPOSTAGEM = V_PEDCODIGOPOSTAGEM, PEDOBSERVACAO = V_PEDOBSERVACAO WHERE PEDCODIGO = V_PEDCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS PEDIDO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE PEDIDO_DELETE (
	IN V_PEDCODIGO INT	   
   	)
	BEGIN
    	DELETE FROM PEDIDO WHERE PEDCODIGO = V_PEDCODIGO;
  	END
&&
-- ITENSPEDIDO
DROP PROCEDURE IF EXISTS ITENSPEDIDO_INSERT;
DELIMITER &&
 	CREATE PROCEDURE ITENSPEDIDO_INSERT (
 	IN V_PEDCODIGO INT,
	   V_PROCODIGO INT,
	   V_ITPVALORVENDA DECIMAL(8,2),
	   V_ITPVALORCOMPRA DECIMAL(8,2),
	   V_ITPTAXA DECIMAL(8,2)
   	)
	BEGIN
    	INSERT INTO ITENSPEDIDO (PEDCODIGO,PROCODIGO,ITPVALORVENDA,ITPVALORCOMPRA,ITPTAXA) VALUES (V_PEDCODIGO, V_PROCODIGO, V_ITPVALORVENDA,
		V_ITPVALORCOMPRA,V_ITPTAXA);
  	END
&&

DROP PROCEDURE IF EXISTS ITENSPEDIDO_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE ITENSPEDIDO_UPDATE (
	IN V_PEDCODIGO INT,
	   V_PROCODIGO INT,
	   V_ITPVALORVENDA DECIMAL(8,2),
	   V_ITPVALORCOMPRA DECIMAL(8,2),
	   V_ITPTAXA DECIMAL(8,2)
   	)
	BEGIN
    	UPDATE ITENSPEDIDO SET PEDCODIGO = V_PEDCODIGO, PROCODIGO = V_PROCODIGO, ITPVALORVENDA = V_ITPVALORVENDA, ITPVALORCOMPRA = V_ITPVALORCOMPRA,
		ITPTAXA = V_ITPTAXA WHERE PEDCODIGO = V_PEDCODIGO AND PROCODIGO = V_PROCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS ITENSPEDIDO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE ITENSPEDIDO_DELETE (
	IN V_PEDCODIGO INT,
	V_PROCODIGO INT	   
   	)
	BEGIN
    	DELETE FROM ITENSPEDIDO WHERE PEDCODIGO = V_PEDCODIGO AND PROCODIGO = V_PROCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS RETORNA_INDEX;
DELIMITER &&
	CREATE PROCEDURE RETORNA_INDEX (
		IN TABELA VARCHAR(80)
	)
	BEGIN
		SELECT AUTO_INCREMENT
		FROM information_schema.tables
		WHERE table_name = TABELA
		AND table_schema = DATABASE();
	END
&&

DROP PROCEDURE IF EXISTS ATUALIZA_QUANTIDADE_PRODUTO;
DELIMITER &&
	CREATE PROCEDURE ATUALIZA_QUANTIDADE_PRODUTO (
		IN V_PROCODIGO INT,
		   V_QUANTIDADE INT,
		   V_OPERACAO BOOL
	)
	BEGIN
		DECLARE V_QUANTIDADE_ATUAL INT;

		SELECT PROQUANTIDADE
		INTO V_QUANTIDADE_ATUAL
		FROM PRODUTO
		WHERE PROCODIGO = V_PROCODIGO;

		IF V_OPERACAO = TRUE THEN
			UPDATE PRODUTO SET PROQUANTIDADE = V_QUANTIDADE_ATUAL + V_QUANTIDADE WHERE PROCODIGO = V_PROCODIGO;
		ELSE 
	  		UPDATE PRODUTO SET PROQUANTIDADE = V_QUANTIDADE_ATUAL - V_QUANTIDADE WHERE PROCODIGO = V_PROCODIGO;
  		END IF;
	END
&&

DROP PROCEDURE IF EXISTS VERIFICA_USUARIO;
DELIMITER &&
	CREATE PROCEDURE VERIFICA_USUARIO (
		IN V_USRLOGIN VARCHAR(255)
	)
	BEGIN
		SELECT COUNT(USRLOGIN) FROM USUARIO WHERE USRLOGIN = V_USRLOGIN;
	END
&&