desc ANUNCIO;

select * from tipoAnuncio;

select * from anuncio;

SELECT a.anuCodigo, s.staDescricao, t.tiaDescricao, a.anuDescricao, a.anuPreco, a.anuDataCriacao FROM anuncio AS a INNER JOIN statusanuncio AS s ON a.staCodigo = s.staCodigo INNER JOIN tipoanuncio AS t on a.tiaCodigo = t.tiaCodigo;

INSERT INTO ANUNCIO VALUES (0, 25, 8, 'Bolsa de Couro', 89.90, '2016-05-19', true);
INSERT INTO ANUNCIO VALUES (0, 25, 8, 'Cinto Calvin Klein', 64.90, '2016-05-19', true);


SELECT pro.proCodigo, proNome, estPreco, estQuantidade FROM produto as pro INNER JOIN produtoestoque as pre ON pro.proCodigo = pre.proCodigo;

Select * from produtoestoque ;

INSERT INTO produtoestoque VALUES (0, 1, 23, 10);

CREATE TABLE tblProduto (
	codigo int auto_increment primary key,
    nome varchar(50),
    valor decimal(8,2)
);

CREATE TABLE tblAnuncio (
	codigo int auto_increment primary key,
    nome varchar(50),
    preco decimal(8,2)
);

CREATE TABLE tblProdAnu (
	codigoPro int,
    codigoAnu int,
    foreign key (codigoPro) references tblProduto (codigo),
    foreign key (codigoAnu) references tblAnuncio(codigo)
);

INSERT INTO tblproduto VALUES (0,'Sabonete', 8.99);
INSERT INTO tblproduto VALUES (0,'Danone', 1.99);
INSERT INTO tblproduto VALUES (0,'Arroz', 10.50);

INSERT INTO tblAnuncio VALUES (0,'Anuncio 1', 12.99);
INSERT INTO tblAnuncio VALUES (0,'Anuncio 2', 3.99);
INSERT INTO tblAnuncio VALUES (0,'Anuncio 3', 15.50);

INSERT INTO tblprodanu VALUES (1,1);
INSERT INTO tblprodanu VALUES (1,3);
INSERT INTO tblprodanu VALUES (2,1);
INSERT INTO tblprodanu VALUES (3,1);

SELECT pro.nome, pro.valor, anu.nome, anu.preco FROM tblprodanu as rel INNER JOIN tblproduto AS pro ON rel.codigoPro = pro.codigo INNER JOIN tblanuncio AS anu ON  rel.codigoAnu = anu.codigo WHERE anu.codigo = 1;

