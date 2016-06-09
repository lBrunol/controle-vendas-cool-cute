CREATE DATABASE cool;
USE cool;

DROP TABLE IF EXISTS ProdutoAnuncio;
DROP TABLE IF EXISTS ItensPedido;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS ItensEntrada;
DROP TABLE IF EXISTS Anuncio;
DROP TABLE IF EXISTS TipoMovimentacao;
DROP TABLE IF EXISTS Entrada;
DROP TABLE IF EXISTS OutrasMovimentacoes;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS TipoAnuncio;
DROP TABLE IF EXISTS TipoAvaliacoes;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS StatusAnuncio;
DROP TABLE IF EXISTS StatusPedido;

CREATE TABLE StatusPedido (
  stpCodigo INTEGER AUTO_INCREMENT,
  stpDescricao VARCHAR(255) NOT NULL,
  PRIMARY KEY(stpCodigo)
);
CREATE TABLE StatusAnuncio (
  staCodigo INTEGER AUTO_INCREMENT,
  staDescricao VARCHAR(255) NOT NULL,
  PRIMARY KEY(staCodigo)
);
CREATE TABLE Produto (
  proCodigo INTEGER AUTO_INCREMENT,
  proNome VARCHAR(255) NOT NULL,
  proEstoqueMin INTEGER UNSIGNED DEFAULT 0,
  proPreco DECIMAL(8,2) NOT NULL,
  proQuantidade INTEGER UNSIGNED DEFAULT 0,
  proIsAtivo BOOL NOT NULL,
  PRIMARY KEY(proCodigo)
);
CREATE TABLE Usuario (
  usrCodigo INTEGER AUTO_INCREMENT,
  usrLogin VARCHAR(255) NOT NULL,
  usrSenha VARCHAR(255) NOT NULL,
  usrIsAdministrador BOOL NOT NULL,
  usrIsAtivo BOOL NOT NULL,
  PRIMARY KEY(usrCodigo)
);
CREATE TABLE TipoAvaliacoes (
  tivCodigo INTEGER AUTO_INCREMENT,
  tivDescricao VARCHAR(255) NOT NULL,
  PRIMARY KEY(tivCodigo)
);
CREATE TABLE TipoAnuncio (
  tiaCodigo INTEGER AUTO_INCREMENT,
  tiaDescricao VARCHAR(255) NOT NULL,
  tiaPercentual DECIMAL(8,2) NOT NULL,
  PRIMARY KEY(tiaCodigo)
);
CREATE TABLE Cliente (
  cliCodigo INTEGER AUTO_INCREMENT,
  cliNome VARCHAR(255) NOT NULL,
  cliEmail VARCHAR(255) NOT NULL,
  PRIMARY KEY(cliCodigo)
);
CREATE TABLE TipoMovimentacao (
  timCodigo INTEGER AUTO_INCREMENT,
  timDescricao VARCHAR(255) NOT NULL,
  timOperacao BOOL NOT NULL,
  PRIMARY KEY(timCodigo)
);
CREATE TABLE Entrada (
  entCodigo INTEGER AUTO_INCREMENT,
  entLote VARCHAR(255) NOT NULL,
  entValorTotal DECIMAL(8,2) NOT NULL,
  entObservacao VARCHAR(255),
  PRIMARY KEY(entCodigo)
);
CREATE TABLE OutrasMovimentacoes (
  movCodigo INTEGER AUTO_INCREMENT,
  timCodigo INTEGER NOT NULL,
  movDescricao VARCHAR(255) NOT NULL,
  movValor DECIMAL(8,2) NOT NULL,
  movData DATE NOT NULL,
  PRIMARY KEY(movCodigo),
  FOREIGN KEY(timCodigo) REFERENCES TipoMovimentacao(timCodigo)
);
CREATE TABLE Anuncio (
  anuCodigo INTEGER AUTO_INCREMENT,
  staCodigo INTEGER NOT NULL,
  tiaCodigo INTEGER NOT NULL,
  anuDescricao VARCHAR(255) NOT NULL,
  anuPreco DECIMAL(8,2) NOT NULL,
  anuDataCriacao DATE NOT NULL,
  anuIsAtivo BOOL NOT NULL,
  PRIMARY KEY(anuCodigo),
  FOREIGN KEY(tiaCodigo) REFERENCES TipoAnuncio(tiaCodigo),
  FOREIGN KEY(staCodigo) REFERENCES StatusAnuncio(staCodigo)
);
CREATE TABLE ItensEntrada (
  proCodigo INTEGER NOT NULL,
  entCodigo INTEGER NOT NULL,
  iteQuantidade INTEGER UNSIGNED NOT NULL,
  iteValorTotal DECIMAL(8,2),
  FOREIGN KEY(entCodigo) REFERENCES Entrada(entCodigo),
  FOREIGN KEY(proCodigo) REFERENCES Produto(proCodigo)
);
CREATE TABLE Pedido (
  pedCodigo INTEGER AUTO_INCREMENT,
  tivCodigo INTEGER NOT NULL,
  stpCodigo INTEGER NOT NULL,
  anuCodigo INTEGER NOT NULL,
  cliCodigo INTEGER NOT NULL,
  pedDataVenda DATE NOT NULL,
  pedValorFrete DECIMAL(8,2) NOT NULL DEFAULT 0,
  pedDataPostagem DATE,
  pedDataEntrega DATE,
  pedValorTotal DECIMAL(8,2) NOT NULL,
  pedCodigoPostagem VARCHAR(255),
  pedObservacao VARCHAR(255),
  PRIMARY KEY(pedCodigo),
  FOREIGN KEY(cliCodigo) REFERENCES Cliente(cliCodigo),
  FOREIGN KEY(anuCodigo) REFERENCES Anuncio(anuCodigo),
  FOREIGN KEY(stpCodigo) REFERENCES StatusPedido(stpCodigo),
  FOREIGN KEY(tivCodigo) REFERENCES TipoAvaliacoes(tivCodigo)
);
CREATE TABLE ItensPedido (
  pedCodigo INTEGER NOT NULL,
  proCodigo INTEGER NOT NULL,
  itpValorVenda DECIMAL(8,2) NOT NULL,
  itpValorCompra DECIMAL(8,2) NOT NULL,
  itpQuantidade INTEGER NOT NULL,
  itpTaxa DECIMAL(8,2) NOT NULL,
  FOREIGN KEY(proCodigo) REFERENCES Produto(proCodigo),
  FOREIGN KEY(pedCodigo) REFERENCES Pedido(pedCodigo)
);
CREATE TABLE ProdutoAnuncio(
  anuCodigo INTEGER NOT NULL,
  proCodigo INTEGER NOT NULL,
  FOREIGN KEY(anuCodigo) REFERENCES Anuncio(anuCodigo),
  FOREIGN KEY(proCodigo) REFERENCES Produto(proCodigo)
);

INSERT INTO STATUSPEDIDO (STPDESCRICAO) VALUES ('À postar');
INSERT INTO STATUSPEDIDO (STPDESCRICAO) VALUES ('Em trânsito');
INSERT INTO STATUSPEDIDO (STPDESCRICAO) VALUES ('Entregue');
INSERT INTO STATUSPEDIDO (STPDESCRICAO) VALUES ('Concretizada');
INSERT INTO STATUSPEDIDO (STPDESCRICAO) VALUES ('Qualificada');
INSERT INTO STATUSPEDIDO (STPDESCRICAO) VALUES ('Reclamação');
INSERT INTO STATUSPEDIDO (STPDESCRICAO) VALUES ('Devolução');
INSERT INTO STATUSPEDIDO (STPDESCRICAO) VALUES ('Defeito');
INSERT INTO STATUSPEDIDO (STPDESCRICAO) VALUES ('Cancelada');
INSERT INTO STATUSPEDIDO (STPDESCRICAO) VALUES ('Extravio');

INSERT INTO STATUSANUNCIO (STADESCRICAO) VALUES ('Ativo');
INSERT INTO STATUSANUNCIO (STADESCRICAO) VALUES ('Pausado');
INSERT INTO STATUSANUNCIO (STADESCRICAO) VALUES ('Finalizado');

INSERT INTO TIPOANUNCIO VALUES (0,'PREMIUM',0.16);
INSERT INTO TIPOANUNCIO VALUES (0,'CLÁSSICO',0.10);
INSERT INTO TIPOANUNCIO VALUES (0,'GRÁTIS',0);

INSERT INTO TIPOAVALIACOES VALUES (0, 'Positiva');
INSERT INTO TIPOAVALIACOES VALUES (0, 'Negativa');
INSERT INTO TIPOAVALIACOES VALUES (0, 'Neutra');
INSERT INTO TIPOAVALIACOES VALUES (0, 'Sem avaliação');

INSERT INTO TIPOMOVIMENTACAO VALUES (0,'ACERTO', TRUE);
INSERT INTO TIPOMOVIMENTACAO VALUES (0,'INVESTIMENTO', TRUE);
INSERT INTO TIPOMOVIMENTACAO VALUES (0,'OUTROS GASTOS', FALSE);
INSERT INTO TIPOMOVIMENTACAO VALUES (0,'COMPRA MERC.', TRUE);
INSERT INTO TIPOMOVIMENTACAO VALUES (0,'RETIRADA', FALSE);
INSERT INTO TIPOMOVIMENTACAO VALUES (0,'TAXA', FALSE);
INSERT INTO TIPOMOVIMENTACAO VALUES (0,'REEMBOLSO', FALSE);
INSERT INTO TIPOMOVIMENTACAO VALUES (0,'ENT. SALDO ML', TRUE);
INSERT INTO TIPOMOVIMENTACAO VALUES (0,'SAI. CAIXA', FALSE);
INSERT INTO TIPOMOVIMENTACAO VALUES (0,'ENT. CAIXA', TRUE);
INSERT INTO TIPOMOVIMENTACAO VALUES (0,'VENDA', TRUE);

INSERT INTO CLIENTE VALUES (0,'Rosimeire Fabricio De Oliveira','rosimeireoliveira78@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Helio Da Silva Macedo','kelezaopita@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Edinice Simonetti','edinicesimon@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Leonice Teixeira','leonicebeatriz@ig.com.br');
INSERT INTO CLIENTE VALUES (0,'Jeane Sawano De Siqueira','sawanokaras@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Katia Conceição De Jesus','katiacj@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Evelyn Drager','eve.fd2000@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Lorena De Sousa Teixeira','lorena.s.teixeira@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Caroline Borba De Souza','carol.bds@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Layde Ramos','layders88@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Gabriela Lauer','gabriela_lauer@yahoo.com');
INSERT INTO CLIENTE VALUES (0,'Maria De Lourdes Ferreira','ferreiramaria982@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Ana Claudia Vieira','anacclaudia.acv@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Rosimeire Fabricio De Oliveira','rosimeireoliveira78@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Paola Assumpção','pah.assumpcao@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Bruna Lemos','brunal-s@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Rosa Maria Pinheiro Batista','rosapbatista@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Loughas Souza','loughas@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Alessandra Ramos Costa','alessandra.rcosta@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Naiara Battagy Damim','naiaradamim@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Andréa Cotta Lamas Cotta','andrea-cotta@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Adrieli Rovea','Adrieli.rovea@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Adriana Luz Fernandes','luz.adrian@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Helaine Baldrigues','helainebaldrigues@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Helen Pinheiro','helenpsv@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Elisangela Aparecida','elisangelapoppet@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Denise Crespo De Oliveira','carlaoliveira2789@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Elizabete Machado','elizabetemachado@yahoo.com');
INSERT INTO CLIENTE VALUES (0,'Marcia Miranda Ferreira','marciamiranda560@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Rodrigo Alves','rpa_bituruna93@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Gabrielle De Almeida','martahabastos@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Bruna Borges','bruna_b_dasilva@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Leonardo Marques Verona','leomarques20@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Josue Santos Almeida','josuesantos@metrosp.com.br');
INSERT INTO CLIENTE VALUES (0,'Ricardo Pereira Alves','ricardopereira_77@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Lucélia Antunes S. Fraga','lucelia.s.fraga@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Raphael Agostini Marques','raphael_a.m@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Diana Dos Santos','dianadossantos2008@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Eduardo Tomaz','edduh2012@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Vera Lúcia Aparício','veraingleses@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Wallace De Andrade Souza','baiaodevaneio@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Tatiane Hoffmann','tati_hof@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Renata Silva','enata_shilva100@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Flavia Sonego','flavia.1611@hotmail.com ');
INSERT INTO CLIENTE VALUES (0,'Bianca Mayra','lisbibi@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Vaneide Silva','vaneidesilva2010@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Djenany Pommerening','djenany_dije@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Robson Sanches','rob-sanches@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Paola Bandera','paolabandera@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Isa Shideko','contatonosite@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Carla Beatriz','c.bmartins27@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Waldemilson Reis Da Silva','silvawaldemilson@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Mari Vieira','maricontrafogo@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Lilian Paula Dos Reis','lilianreis.ge@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Nilsa Santos','snilza85@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Ana Sousa','sousa.anapc@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Emmanuelle Louise Nogueira','louisanouqueira@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Fernanda Graziele Santana','fgsmotta2011@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Gilmara Tavares Nascimento','maracardosomara@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Wellida Fabiana Souza','wellfab@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Hannelise Riemer','hanneri@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Gilziane Maria Teixeira','gilzianeteixeira@bol.com.br');
INSERT INTO CLIENTE VALUES (0,'Virginia Lima','vivi-lima01@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Marly Heloisa Heloisa','marly.helo@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Keli Peçanha','keli_pecanha@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Leonardo Dlugosz','leonardohelp@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Pablinny Galdino','pablinnyg@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Jaqueline Azevedo','jaque.c.azevedo@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Hayla Cristian Dourado Santos','hayla-cristian@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Jahmmeson Borges Da Silva','jborgescv@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Flavio Lucio De Moraes Lucio','flavioluciodemoraes@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Wanessa Gonçalves','waanessag@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Gabriela Souza','gabrielaalves44@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Andreia Abdelhay','andreia.bruce.abdelhay@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Larissa Holanda Rangel','larissaholandarangel@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Carla Fernanda Silva Melocro','fernandamelocro@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Jéssica Araújo','jessycagm@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Gleicy Palmeira','gleicypalmeira19@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Maria Da Conceição Amorim Melo','maria.melo@logoplaste.com');
INSERT INTO CLIENTE VALUES (0,'Sonia Maria De Oliveira','sooliveira31@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Marcos Andrade','marcosandrade80@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Lais Pereira','laisfspereira@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Anne Caroline Menezes Santos','ac.santos@rocketmail.com');
INSERT INTO CLIENTE VALUES (0,'Joana Hughes','joana.hughes@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Ana Paula Alves De Melo','anaamelo@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Carlos Altino Machado Mattoso','altinomattoso@uol.com.br');
INSERT INTO CLIENTE VALUES (0,'Vanessa Vanzella','vanessavanzella@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Simone Lourenço','simonicas@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Samara Costa','samara.ng6@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Lorrayne Joana','lorraynne018@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Beatriz Da Silva Melo','bhiamello@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Leticia Cosmo','leticiacosmocarvalho@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Matheus Romano','matheuscontag@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Mateus Matos Ferreira','mateus.biologiaufs@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Elisangela Ferreira','elislferreira@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Thaysa Calandino','thaysa_calandino@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Meyriane Da Silva','mdasilvaassis@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'José Santos','jose1975antoniosantos@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Amanda Beatriz','amandabeatrizsilva@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Ludiceia Moreira','lmanjos@ig.com.br');
INSERT INTO CLIENTE VALUES (0,'Paloma Ferreira','ferreira-paloma@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Karina Silva Rodrigues','ka.20srodrigues@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Janaina Brito Vieira','janaina.vieirabrito@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Naiara Moreira','naiara.estrela@live.com');
INSERT INTO CLIENTE VALUES (0,'Elaine Maria Santos Souto','emss.1@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Fabio Sales','fabiocristo2009@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Adriana Pinto','adr.araujop@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Suelem Barbosa','singsuelem6@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Sabrina Simas','sasasimass@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Natalia Ferreira','natalinha_leaozinha@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Felipe Gabler','felipegabler@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Vanessa Freire','tiumpurawn@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Rosana Rodrigues Santiago','rosanasantiago2@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Rosana Oliveira','ro3570515@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Tiago De Miranda Carvalho','tiagocarvalho9979@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Márcia Teixeira','marciatxr.mt@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Bianca Zanon','bianca.zanon@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Marcia Costa','marciacqv@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Andrea Firmino Scarparo','a_scarparo@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Luane Nathalyne','luane2125@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Heliaquine Andrade Andrade','heliaquine@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Monique Guimarães','moniquesilvaguimaraes15@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Rosangela Manfredi','rosa.mar.sol@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Denise G D G Abrão','denisedelfino@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Enaldo Alcantara Reis Enaldo','yendion@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Edilene Aparecida De Carvalho Carvalho','dany-talitha@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Verônica Ferreira','veronicaferreira95@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Webert Vimiciuz','webertvinicius2@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Carlos Claiton Coimbra','carlosclaitoncoimbra@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Roberto Da Conceição Silva','robertoc26silva@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Magdos Xavier Monteiro Xavier','magdos.xm@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Pryscila Camilo','pry_camilo@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Jéssica Dorneles Da Silva','jessica_dorneles@live.com');
INSERT INTO CLIENTE VALUES (0,'Kelycristina De Souza Souza','kelycristina.souza@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Matheus Lameu','matheus.lameu@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Valmir Andrade','valmirandrade159@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Laisa Cristina Duarte Silva','laisaduarte96@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Angélica Paula Moretto','angelica@aguiaseguros.com.br');
INSERT INTO CLIENTE VALUES (0,'Flavia Passos','flaviapassos14@live.com');
INSERT INTO CLIENTE VALUES (0,'Thiago Calheiros','tgc.calheiros@ig.com.br');
INSERT INTO CLIENTE VALUES (0,'Ana Oliveira','ana_lynda13@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Edilson Jose','asthorjean@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Eliza Mara Batista','eliza_mbatista@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Jerônimo Souza De Oliveira','oliveirajeronimo@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Cicero Castelo Branco','symbolcomunicacao@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Niedja Ossola','niedjasc@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Vera Lucia Pinheiro Da Platina','vera.platina@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Eni Nascimento','enitamv@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Lais Mota','laismotadorosario_@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Jhennifer Nunes','jhennifermonise85@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Auane Samira Barbosa','auane.samira@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Jaime Silva','guidyribeiro@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Karla Paulina Botelho','karla-botello-32@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Anderson Lima','contatoup@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Kadson Teixeira De Sousa','kknabalada14@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Thamires Francieli Da Silva','thamiresfranciele2@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Ítla Santos','itla_santos@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Vera Cavaliere','verabellei@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Claudirene Eduardo Sabino','bellyceci_2010@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Isabela Coelho','isabelacoelhomoreira@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Ianca Pereira','ianca.pereira6@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Wagner Dias','eng.dias17@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Sandra Alves De Souza','ssouza@colmagno.com.br');
INSERT INTO CLIENTE VALUES (0,'Rosane Cristina','ro.cristina_@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Wilma De Souza','miminha.souza@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Marisa Seabra','marisaseabra@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Jamile Carvalho Da Silva Sousa','jamilecarvalhosousa@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Francisca Sampaio','fraan_samppayyo@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Laura Lazzarotto','laulazaroto@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Marinalva Martins','marinalvamartins235@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Joao Antonio Baloneck','joaobaloneck@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Evilaine Teixeira','evilainet@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Camila Cavalheiro','mylazinhaaa@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Adaiane Perboni Neto','adaianeperboni@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Paloma Oliveira','p.alice1@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Pamela Costa','pamelacosta.com@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Jaqueline Barbosa','jaquilegiao@bol.com.br');
INSERT INTO CLIENTE VALUES (0,'Irma Aparecida Mantovani','duirmabi@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Michael Augusto Da Rosa','spfc_michael@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Rafael Bueno','rafaelbuenofh@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Viviane Souza',' vivianny_2013@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Antonio D Isaias','antonio.isaias@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Ângela Gabriela','gabriela.angela@outlook.com');
INSERT INTO CLIENTE VALUES (0,'Alfredo Francisco Berneira','aberneira13@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Jose Hilario Pereira Da Silva','jhipsi@terra.com.br');
INSERT INTO CLIENTE VALUES (0,'Luiz Gonçalves','lgluizgoncalves@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Patricia Cunha','patriciabujica@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Wanda Lucia Ferraço','wandaferraco@bol.com.br');
INSERT INTO CLIENTE VALUES (0,'Silvia Mota','silviaphl11@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Nayara Silva','nayara_silva.25@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Jarbas De Oliveira','jvesoliveira002@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Paola Vieira','paolavieira2207@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Ellen Moraes','lili_ellen@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Denise Carvalho','denny_dance@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Jose Roberto Arroyo','jamile_arroyo1@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Vinicius Andrade','viniciusseixas2009@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Wallace Santos','wallace.santos@apsis.com.br');
INSERT INTO CLIENTE VALUES (0,'Danielle Quiozini','dani_quiozini@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Kleiton Nascimento','magrokiller@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Ricardo Pereira Vieira','fenix22ll@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Ednaldo Renovato Renovato','anapaulamengao@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Monica Martins','monicamartins60315@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Paulo Araujo','pga900@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Mariane Chaves','marianesouza0045@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Luciano Elias Ferreira','lucianoelias16@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Deivid Renan Borges','deivid_renan@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Crecencio Carneiro','crecenciocarneiro@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Altair Narciso Narciso','casadacamiseta2016@gmail.com');
INSERT INTO CLIENTE VALUES (0,'João Paulo','paocomovo1@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Ellen Araujo','ellencrystie@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Rayane Nascimento','rayanny.pfuo@gmail.com');
INSERT INTO CLIENTE VALUES (0,'Elza Josefa Andrade','beteandilha@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Nilza Vargas','agdatean@yahoo.com.br');
INSERT INTO CLIENTE VALUES (0,'Juliana De Souza Mendonça','juliaejulianasouza@hotmail.com');
INSERT INTO CLIENTE VALUES (0,'Kleiton Luiz','kleitonluizgoncalves@live.com');

INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA BOLSA FEMININA ESCOLAR UNIVERSITÁRIA IMPORTADA!!!' , 69.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA MOCHILA ESCOLAR FEMININA COM ESTAMPA DE PÁSSAROS' , 49.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA LONA FEMININA BIGODE MUSTACHE FACUL ESCOL PROMOÇÃO' , 54.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA MOCHILA ESCOLAR FEMININA COM ESTAMPA DE CORUJA' , 45.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA MOCHILA ESCOLAR FEMININA COM ESTAMPA DE LETRAS' , 49.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA MOCHILA ESCOLAR FEMININA ESTAMPA DE PÁSSAROS CORES !!' , 69.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA SACO FEMININA COM FRANJA TRANVERSAL EM COURO / CAMURÇA' , 79.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA FEMININA BOLSA COURO SINTÉTICO PRODUTO IMPORTADO' , 69.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA LONA FEMININA BIGODE MUSTACHE FACUL ESCOL PROMOÇÃO' , 49.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA BOLSA FEMININA ESCOLAR UNIVERSITÁRIA IMPORTADA!!! (ESTAMPADAS)' , 79.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA BOLSA FEMININA ESCOLAR BIGODE IMPORTADA!!!' , 69.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA BOLSA FEMININA ESCOLAR UNIVERSITÁRIA IMPORTADA!!!' , 74.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA MOCHILA ESCOLAR FEMININA ESTAMPA DE PÁSSAROS CORES !!' , 59.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA BOLSA FEMININA XADREZ UNIVERSITÁRIA VERMELHA E PRETA' , 54.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'PENDRIVE ROMERO BRITO 16GB' , 30 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA BOLSA FEMININA ESCOLAR UNIVERSITÁRIA IMPORTADA!!! (ANTIGO)' , 85.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA BOLSA FEMININA ESCOLAR UNIVERSITÁRIA IMPORTADA!!! (ANTIGO)' , 79.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'CAPA CELULAR TAMPA TRASEIRA MOTO G 1º E 2º GERAÇÃO MADEIRA' , 15.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'CAPA CELULAR TAMPA TRASEIRA MOTO G 1º E 2º GERAÇÃO MADEIRA' , 14.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA DE BIGODES (ANTIGO)' , 64.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA DE PASSAROS (ANTIGO)' , 51.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA DE PASSAROS (ANTIGO)' , 49.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA DE COURO (ANTIGO)' , 79.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'CAPA CELULAR TAMPA TRASEIRA MOTO G 1º E 2º GERAÇÃO MADEIRA' , 10.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'MOCHILA BOLSA FEMININA XADREZ UNIVERSITÁRIA VERMELHA E PRETA' , 54.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA BOLSA FEMININA ESCOLAR UNIVERSITÁRIA IMPORTADA!!!' , 59.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'MOCHILA BOLSA FEMININA ESCOLAR UNIVERSITÁRIA IMPORTADA!!!' , 59.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'BOLSA SACO FEMININA COM FRANJA TRANVERSAL EM COURO / CAMURÇA' , 69.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'MOCHILA BOLSA FEMININA ESCOLAR UNIVERSITÁRIA IMPORTADA!!!' , 69.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'BOLSA MOCHILA ESCOLAR FEMININA ESTAMPA DE PÁSSAROS CORES !!' , 69.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'CAPA CELULAR TAMPA TRASEIRA MOTO G 3º GERAÇÃO MADEIRA' , 10.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA FEMININA TOMMY HILFIGER SACOLA IMPORTADA PROMOÇÃO !' , 45 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'MOCHILA FEMININA BOLSA COURO SINTÉTICO PRODUTO IMPORTADO' , 69.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'BOLSA NIKE FEMININA HERITAGE LANÇAMENTO' , 64.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'MOCHILA JEANS E CAMURÇA ARTESANAL FEMININA MASCULINO' , 99.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'BOLSA MOCHILA ESCOLAR FEMININA ESTAMPA DE PÁSSAROS CORES !!' , 59.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'BOLSA NIKE FEMININA HERITAGE LANÇAMENTO' , 79.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA FEMININA CHANNEL LE BOY EM COURO IMPORTADA' , 89.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA BOLSA FEMININA LONA UNIVERSITÁRIA ESCOLAR' , 39.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'CINTO SOCIAL MASCULINO EM COURO LOUIS VITON' , 45 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'MOCHILA BOLSA FEMININA LONA UNIVERSITÁRIA ESCOLAR' , 44.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'BOLSA FEMININA CHANNEL LE BOY EM COURO IMPORTADA' , 129.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'BOLSA FEMININA IMPORTADA LE BOY INSPIRED PEQUENA' , 129.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA FEMININA LE BOY INSPIRED MÉDIA CHANNEL FRETE GRÁTIS !' , 159.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA FEMININA LE BOY INSPIRED MÉDIA CHANNEL FRETE GRÁTIS !' , 159.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 1 , 'BOLSA FEMININA COURO FRETE GRÁTIS ! (MÉDIA)' , 159.9 , '2016-05-21', true);
INSERT INTO ANUNCIO VALUES (0 ,1 , 2 , 'MOCHILA BOLSA FEMININA ESCOLAR UNIVERSITÁRIA IMPORTADA!!!' , 72.9 , '2016-05-21', true);

INSERT INTO PRODUTO VALUES (0,'MOCHILA BEGE DE PÁSSAROS', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA ROSA DE PÁSSAROS', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA AZUL DE PÁSSAROS', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA PRETA DE PÁSSAROS', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA VERMELHA DE LETRAS', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA BEGE DE CORUJA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA CINZA DE CORUJA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA PRETA DE CORUJA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA AMARELA DE CORUJA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA AZUL DE CORUJA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA ROSA DE CORUJA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA VERDE DE BIGODES', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA LISTRADA PRETA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA LISTRADA AZUL', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA LISTRADA VERMELHA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA LISTRADA ROSA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA BEGE DE PÁSSAROS', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA ROSA DE PÁSSAROS', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA AZUL DE PÁSSAROS', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA PRETA DE PÁSSAROS', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA PRETA DE COURO', 1 ,25, 4, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA CARAMELO DE COURO', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA MARROM DE COURO', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA VERMELHA DE COURO', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA BEGE CLARA DE COURO', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA  AZUL DE BIGODES', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA BEGE DE BIGODES', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA XADREZ VERMELHA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA XADREZ AZUL', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA CINZA DE ELEFANTES', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA PRETA DE ELEFANTES', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA PARA NOTEBOOK PRETA', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA COM FRANJAS MARROM AMARELADO', 1 ,33, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA COM FRANJAS BEGE', 1 ,33, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA COM FRANJAS MARROM', 1 ,33, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'PENDRIVE ROMERO BRITO', 1 ,30, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'CAPA DE MOTO G1', 1 ,5, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'CAPA DE MOTO G2', 1 ,5, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'CAPA DE MOTO G3', 1 ,5, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA AZUL DE COURO (ESCURO)', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA PRETA PÁSSAROS (NOVO)', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA AZUL PÁSSAROS (NOVO)', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA AMARELA PÁSSAROS (NOVO)', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA NIKE PRETA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA NIKE BRANCA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA TOMMY AZUL', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA TOMMY VERMELHA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA ROSA  PÁSSAROS (NOVO)', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA LOUIS VUITTON PRETA + BOLSINHA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA LOUIS VUITTON BRANCA + BOLSINHA', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA JEANS AZUL', 1 ,50, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA CHANNEL BORDEAUX (PEQUENA)', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA CHANNEL CARAMELO (PEQUENA)', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA CHANNEL PRETA (PEQUENA)', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA CHANNEL MARROM (PEQUENA)', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA ROSA DE COURO', 1 ,40, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA CHANNEL PRETA (MÉDIA)', 1 ,50, 50, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA CHANNEL CARAMELO (MÉDIA)', 1 ,50, 30, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA NIKE COURO PRETA', 1 ,33, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'BOLSA NIKE COURO BRANCA', 1 ,33, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'CINTO CALVIN KLEIN', 1 ,25, 100, TRUE);
INSERT INTO PRODUTO VALUES (0,'MOCHILA AZUL DE COURO (CLARA)', 1 ,40, 100, TRUE);

INSERT INTO PRODUTOANUNCIO VALUES (1,21);
INSERT INTO PRODUTOANUNCIO VALUES (1,22);
INSERT INTO PRODUTOANUNCIO VALUES (1,23);
INSERT INTO PRODUTOANUNCIO VALUES (1,24);
INSERT INTO PRODUTOANUNCIO VALUES (1,25);
INSERT INTO PRODUTOANUNCIO VALUES (3,12);
INSERT INTO PRODUTOANUNCIO VALUES (3,26);
INSERT INTO PRODUTOANUNCIO VALUES (3,32);
INSERT INTO PRODUTOANUNCIO VALUES (8,34);
INSERT INTO PRODUTOANUNCIO VALUES (8,35);
INSERT INTO PRODUTOANUNCIO VALUES (9,12);
INSERT INTO PRODUTOANUNCIO VALUES (9,27);
INSERT INTO PRODUTOANUNCIO VALUES (12,21);
INSERT INTO PRODUTOANUNCIO VALUES (12,24);
INSERT INTO PRODUTOANUNCIO VALUES (13,1);
INSERT INTO PRODUTOANUNCIO VALUES (13,2);
INSERT INTO PRODUTOANUNCIO VALUES (13,3);
INSERT INTO PRODUTOANUNCIO VALUES (13,4);
INSERT INTO PRODUTOANUNCIO VALUES (24,38);
INSERT INTO PRODUTOANUNCIO VALUES (25,29);
INSERT INTO PRODUTOANUNCIO VALUES (26,28);
INSERT INTO PRODUTOANUNCIO VALUES (26,29);
INSERT INTO PRODUTOANUNCIO VALUES (27,29);
INSERT INTO PRODUTOANUNCIO VALUES (28,33);
INSERT INTO PRODUTOANUNCIO VALUES (28,34);
INSERT INTO PRODUTOANUNCIO VALUES (28,36);
INSERT INTO PRODUTOANUNCIO VALUES (29,21);
INSERT INTO PRODUTOANUNCIO VALUES (29,22);
INSERT INTO PRODUTOANUNCIO VALUES (29,23);
INSERT INTO PRODUTOANUNCIO VALUES (29,24);
INSERT INTO PRODUTOANUNCIO VALUES (29,25);
INSERT INTO PRODUTOANUNCIO VALUES (29,33);
INSERT INTO PRODUTOANUNCIO VALUES (29,40);
INSERT INTO PRODUTOANUNCIO VALUES (29,56);
INSERT INTO PRODUTOANUNCIO VALUES (31,39);
INSERT INTO PRODUTOANUNCIO VALUES (32,46);
INSERT INTO PRODUTOANUNCIO VALUES (32,47);
INSERT INTO PRODUTOANUNCIO VALUES (34,44);
INSERT INTO PRODUTOANUNCIO VALUES (34,45);
INSERT INTO PRODUTOANUNCIO VALUES (35,51);
INSERT INTO PRODUTOANUNCIO VALUES (36,41);
INSERT INTO PRODUTOANUNCIO VALUES (36,42);
INSERT INTO PRODUTOANUNCIO VALUES (36,43);
INSERT INTO PRODUTOANUNCIO VALUES (36,48);
INSERT INTO PRODUTOANUNCIO VALUES (37,44);
INSERT INTO PRODUTOANUNCIO VALUES (37,45);
INSERT INTO PRODUTOANUNCIO VALUES (38,52);
INSERT INTO PRODUTOANUNCIO VALUES (38,54);
INSERT INTO PRODUTOANUNCIO VALUES (39,12);
INSERT INTO PRODUTOANUNCIO VALUES (39,29);
INSERT INTO PRODUTOANUNCIO VALUES (40,61);
INSERT INTO PRODUTOANUNCIO VALUES (41,29);
INSERT INTO PRODUTOANUNCIO VALUES (42,53);
INSERT INTO PRODUTOANUNCIO VALUES (46,57);
INSERT INTO PRODUTOANUNCIO VALUES (47,21);
INSERT INTO PRODUTOANUNCIO VALUES (47,22);
INSERT INTO PRODUTOANUNCIO VALUES (47,24);
INSERT INTO PRODUTOANUNCIO VALUES (47,40);
INSERT INTO PRODUTOANUNCIO VALUES (47,62);

INSERT INTO USUARIO VALUES (0, 'bruno', 'bruno', true, true);
INSERT INTO USUARIO VALUES (0, 'thiago', 'thiago', true, true);

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

DROP PROCEDURE IF EXISTS STATUSPEDIDO_SELECT;
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

DROP PROCEDURE IF EXISTS STATUSANUNCIO_SELECT;
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

DROP PROCEDURE IF EXISTS PRODUTO_SELECT;
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

DROP PROCEDURE IF EXISTS USUARIO_SELECT;
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

DROP PROCEDURE IF EXISTS TIPOAVALIACAO_SELECT;
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

DROP PROCEDURE IF EXISTS TIPOANUNCIO_SELECT;
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

DROP PROCEDURE IF EXISTS CLIENTE_SELECT;
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
			END
		ORDER BY cliNome;
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

DROP PROCEDURE IF EXISTS TIPOMOVIMENTACAO_SELECT;
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

DROP PROCEDURE IF EXISTS ENTRADA_SELECT;
DELIMITER &&
	CREATE PROCEDURE ENTRADA_SELECT(
        IN codigo INT(11),
        IN lote varchar(255),
        IN valorTotal DECIMAL(8,2),
        IN observacao VARCHAR (255)
	)
	BEGIN
	    SELECT *
		FROM entrada
	    WHERE entCodigo = 
			CASE	
				WHEN codigo = 0 OR codigo IS NULL THEN entCodigo
				WHEN codigo > 0 THEN codigo		       
			END	
		AND entLote LIKE
			CASE	
				WHEN lote = '' OR lote IS NULL THEN entLote
				WHEN lote <> '' THEN CONCAT('%', lote, '%')
			END
		AND entValorTotal =
			CASE	
				WHEN valorTotal = 0 OR valorTotal IS NULL THEN entValorTotal
				WHEN valorTotal > 0 THEN valorTotal
			END
		AND entObservacao LIKE
			CASE	
				WHEN observacao = '' OR observacao IS NULL THEN entObservacao
				WHEN observacao <> '' THEN CONCAT('%', observacao, '%')
			END;
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

DROP PROCEDURE IF EXISTS OUTRASMOVIMENTACOES_DESCRICAO_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE OUTRASMOVIMENTACOES_DESCRICAO_UPDATE (
	IN  V_MOVDESCRICAO VARCHAR(255),
		V_MOVVALOR DECIMAL(8,2), 
		V_MOVDATA DATE
           	   
   	)
	BEGIN
    	UPDATE OUTRASMOVIMENTACOES SET MOVVALOR = V_MOVVALOR, MOVDATA = V_MOVDATA 
		WHERE MOVDESCRICAO = V_MOVDESCRICAO;
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

DROP PROCEDURE IF EXISTS OUTRASMOVIMENTACOES_DESCRICAO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE OUTRASMOVIMENTACOES_DESCRICAO_DELETE (
	IN  V_MOVDESCRICAO VARCHAR(255) 
   	)
	BEGIN
    	DELETE FROM OUTRASMOVIMENTACOES WHERE MOVDESCRICAO = V_MOVDESCRICAO;
  	END
&&

DROP PROCEDURE IF EXISTS OUTRASMOVIMENTACOES_SELECT;
DELIMITER &&
	CREATE PROCEDURE OUTRASMOVIMENTACOES_SELECT (
		IN codigo INT,
		IN descricao VARCHAR(255),
		IN valor DECIMAL(8,2),
		IN data DATE,
		IN tipoMovimentacao VARCHAR(255)
	)
	BEGIN
		SELECT movCodigo, movDescricao, movValor, movData, outrasmovimentacoes.timCodigo, timDescricao
		FROM outrasmovimentacoes 
		INNER JOIN tipoMovimentacao 
		ON outrasMovimentacoes.timCodigo = tipoMovimentacao.timCodigo
		WHERE movCodigo = 
			CASE	
				WHEN codigo = 0 OR codigo IS NULL THEN movCodigo
				WHEN codigo > 0 THEN codigo		       
			END
		AND movDescricao LIKE
			CASE	
				WHEN descricao = '' OR descricao IS NULL THEN movDescricao
				WHEN descricao <> '' THEN CONCAT('%', descricao, '%')
			END
		AND movValor LIKE
			CASE	
				WHEN valor = 0 OR valor IS NULL THEN movValor
				WHEN valor > 0 THEN valor
			END
		AND movData LIKE
			CASE	
				WHEN data = '' OR data IS NULL THEN movData
				WHEN data <> '' THEN CONCAT('%', data, '%')
			END
		AND timDescricao =
			CASE	
				WHEN tipoMovimentacao = '' OR tipoMovimentacao IS NULL THEN timDescricao
				WHEN tipoMovimentacao <> '' THEN tipoMovimentacao
			END;
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
	IN  V_ANUCODIGO INT,
		V_STACODIGO INT,
	    V_TIACODIGO INT,
		V_ANUDESCRICAO VARCHAR(255),
	   	V_ANUPRECO DECIMAL(8,2),
		V_ANUISATIVO BOOL   	   
   	)
	BEGIN
    	UPDATE ANUNCIO SET STACODIGO = V_STACODIGO, TIACODIGO = V_TIACODIGO,ANUDESCRICAO = V_ANUDESCRICAO, ANUPRECO = V_ANUPRECO, ANUISATIVO = V_ANUISATIVO
		WHERE ANUCODIGO = V_ANUCODIGO;
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

DROP PROCEDURE IF EXISTS ANUNCIO_SELECT;
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
			
		ORDER BY a.anuDescricao;
	END
&&

-- ITENSENTRADA
DROP PROCEDURE IF EXISTS ITENSENTRADA_INSERT;
DELIMITER &&
 	CREATE PROCEDURE ITENSENTRADA_INSERT (
	IN V_PROCODIGO INT,
	   V_ENTCODIGO INT,
	   V_ITEQUANTIDADE INT,
       V_ITEVALORTOTAL DECIMAL(8,2)	   
   	)
	BEGIN
    	INSERT INTO ITENSENTRADA (PROCODIGO,ENTCODIGO,ITEQUANTIDADE,ITEVALORTOTAL) 
		VALUES (V_PROCODIGO,V_ENTCODIGO,V_ITEQUANTIDADE,V_ITEVALORTOTAL);
  	END
&&

DROP PROCEDURE IF EXISTS ITENSENTRADA_UPDATE;
DELIMITER &&
 	CREATE PROCEDURE ITENSENTRADA_UPDATE (
	IN  V_PROCODIGO INT,
	    V_ENTCODIGO INT,
		V_ITEQUANTIDADE INT,
		V_ITEVALORTOTAL DECIMAL(8,2)
           	   
   	)
	BEGIN
    	UPDATE ITENSENTRADA SET PROCODIGO = V_PROCODIGO, ENTCODIGO = V_ENTCODIGO,ITEQUANTIDADE = V_ITEQUANTIDADE, ITEVALORTOTAL = V_ITEVALORTOTAL WHERE PROCODIGO = V_PROCODIGO AND ENTCODIGO = V_ENTCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS ITENSENTRADA_DELETE;
DELIMITER &&
 	CREATE PROCEDURE ITENSENTRADA_DELETE (
	IN V_ENTCODIGO INT
   	)
	BEGIN
    	DELETE FROM ITENSENTRADA WHERE ENTCODIGO = V_ENTCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS ITENSENTRADA_SELECT;
DELIMITER &&
	CREATE PROCEDURE ITENSENTRADA_SELECT(
	    IN codigo INT(11)
	)
	BEGIN
		SELECT itensEntrada.*, produto.proNome, produto.proPreco
		FROM itensEntrada INNER JOIN produto on itensEntrada.proCodigo = produto.proCodigo
		WHERE entCodigo = codigo;
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

DROP PROCEDURE IF EXISTS PEDIDO_SELECT;
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
			ped.pedObservacao,
			tiv.tivCodigo,
			stp.stpCodigo,
			anu.anuCodigo,
			cli.cliCodigo
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
		AND ((ped.pedDataVenda =
			CASE	
				WHEN dataVenda = '' OR dataVenda IS NULL THEN ped.pedDataVenda
				WHEN dataVenda <> '' THEN dataVenda
			END)
		OR (ped.pedDataVenda IS NULL))
	    AND ((ped.pedDataPostagem =
			CASE	
				WHEN dataPostagem = '' OR dataPostagem IS NULL THEN ped.pedDataPostagem
				WHEN dataPostagem <> '' THEN dataPostagem
			END)
		OR (ped.pedDataPostagem IS NULL))
		AND ((ped.pedDataEntrega =
			CASE	
				WHEN dataEntrega = '' OR dataEntrega IS NULL THEN ped.pedDataEntrega
				WHEN dataEntrega <> '' THEN dataEntrega
			END)
		OR (ped.pedDataEntrega IS NULL))
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

-- ITENSPEDIDO
DROP PROCEDURE IF EXISTS ITENSPEDIDO_INSERT;
DELIMITER &&
 	CREATE PROCEDURE ITENSPEDIDO_INSERT (
 	IN V_PEDCODIGO INT,
	   V_PROCODIGO INT,
	   V_ITPVALORVENDA DECIMAL(8,2),
	   V_ITPVALORCOMPRA DECIMAL(8,2),
	   V_ITPQUANTIDADE INT,
	   V_ITPTAXA DECIMAL(8,2)
   	)
	BEGIN
    	INSERT INTO ITENSPEDIDO (PEDCODIGO,PROCODIGO,ITPVALORVENDA,ITPVALORCOMPRA,ITPQUANTIDADE,ITPTAXA) VALUES (V_PEDCODIGO, V_PROCODIGO, V_ITPVALORVENDA,
		V_ITPVALORCOMPRA,V_ITPQUANTIDADE,V_ITPTAXA);
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
	IN V_PEDCODIGO INT   
   	)
	BEGIN
    	DELETE FROM ITENSPEDIDO WHERE PEDCODIGO = V_PEDCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS ITENSPEDIDO_SELECT;
DELIMITER &&
	CREATE PROCEDURE ITENSPEDIDO_SELECT(
    	IN codigo INT(11)
	)
	BEGIN
		SELECT itensPedido.*, produto.proNome, (itensPedido.itpValorVenda * itensPedido.itpQuantidade) as valorTotal
		FROM itensPedido INNER JOIN produto on itensPedido.proCodigo = produto.proCodigo
		WHERE pedCodigo = codigo;
	END
&&

--PRODUTO ANÚNCIO
DROP PROCEDURE IF EXISTS ANUNCIOPRODUTO_INSERT;
DELIMITER &&
 	CREATE PROCEDURE ANUNCIOPRODUTO_INSERT (
 	IN V_PROCODIGO INT,
	   V_ANUCODIGO INT
   	)
	BEGIN
    	INSERT INTO PRODUTOANUNCIO (ANUCODIGO, PROCODIGO) VALUES (V_PROCODIGO, V_ANUCODIGO);
  	END
&&

DROP PROCEDURE IF EXISTS ANUNCIOPRODUTO_DELETE;
DELIMITER &&
 	CREATE PROCEDURE ANUNCIOPRODUTO_DELETE (
 	IN V_ANUCODIGO INT
   	)
	BEGIN
    	DELETE FROM PRODUTOANUNCIO WHERE ANUCODIGO = V_ANUCODIGO;
  	END
&&

DROP PROCEDURE IF EXISTS ANUNCIOPRODUTO_SELECT;
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

--OUTRAS PROCEDURES
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

DROP PROCEDURE IF EXISTS AUTENTICA_USUARIO;
DELIMITER &&
	CREATE PROCEDURE AUTENTICA_USUARIO (
		IN V_USRLOGIN VARCHAR(255),
		IN V_USRSENHA VARCHAR(32)
	)
	BEGIN
		SELECT COUNT(USRCODIGO)
		FROM USUARIO
		WHERE USRLOGIN = V_USRLOGIN 
		AND USRSENHA = V_USRSENHA;
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