create table tarefas(
	id int primary key auto_increment,
    descricao varchar(50),
    finalizado bool,
    dataFinalizacao date,
    lugar varchar(50)
);

alter table tarefas add lugar varchar(50);

SELECT * 
FROM cliente
WHERE (cliNome = '') OR (cliNome = '');

SELECT * 
FROM cliente;

desc pedido;

DROP PROCEDURE IF EXISTS clienteSelect
DELIMITER &&
CREATE PROCEDURE clienteSelect(
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

SELECT * FROM cliente WHERE cliNome LIKE '%Br%' AND cliEmail LIKE '%car%';

CALL clienteSelect(null,'bR','car');