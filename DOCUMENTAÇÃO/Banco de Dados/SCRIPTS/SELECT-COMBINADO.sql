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
        IN email VARCHAR(150)
)
BEGIN
    SELECT * FROM   cliente 
    WHERE cliCodigo = 
		CASE	
			WHEN codigo IS NULL THEN cliCodigo
			WHEN codigo IS NOT NULL then codigo		       
		END    
    AND cliEmail =
		CASE	
			WHEN email IS NULL THEN cliEmail
			WHEN email IS NOT NULL then email		       
		END;    
END
&&

CALL clienteSelect(null,null);