-- Criação da Base de Dados
CREATE DATABASE ApiPosGraduacao;
USE ApiPosGraduacao;

CREATE TABLE Pessoas (
	id_pessoa INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	nivel INT NOT NULL DEFAULT 0,

	PRIMARY KEY (id_pessoa)
);

CREATE TABLE Skills (
	id_skill INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	
	PRIMARY KEY (id_skill)
);

CREATE TABLE ListaDominios (
	id_dominio INT NOT NULL AUTO_INCREMENT,
	nome_dominio VARCHAR(45) NOT NULL,

	PRIMARY KEY (id_dominio)
);

CREATE TABLE SkillsDominios (
	id_skill INT NOT NULL,
    id_dominio INT NOT NULL,
	
	PRIMARY KEY (id_skill, id_dominio),
    FOREIGN KEY SkillDominios(id_skill) REFERENCES Skills(id_skill),
    FOREIGN KEY SkillDominios(id_dominio) REFERENCES ListaDominios(id_dominio)
);

CREATE TABLE Problemas (
	id_problema INT NOT NULL AUTO_INCREMENT,
	titulo VARCHAR(250) NOT NULL,
	descricao VARCHAR(250) NOT NULL,
	status boolean NOT NULL DEFAULT false,

	PRIMARY KEY(id_problema)
);

CREATE TABLE ProblemasSkills (
	id_problema INT NOT NULL,
	id_skill INT NOT NULL,

	PRIMARY KEY (id_problema, id_skill),

	FOREIGN KEY ProblemasSkills(id_problema) REFERENCES Problemas(id_problema),
	FOREIGN KEY ProblemasSkills(id_skill) REFERENCES Skills(id_skill)
);

CREATE TABLE Respostas (
	id_resposta INT NOT NULL AUTO_INCREMENT,
	id_problema INT NOT NULL,
	resposta VARCHAR (500) NOT NULL,
	qtd_like INT NOT NULL DEFAULT 0,

	PRIMARY KEY (id_resposta),
	FOREIGN KEY ProblemasRespostas(id_problema) REFERENCES Problemas(id_problema)
);
CREATE TABLE PessoaSkills (
	id_pessoa INT NOT NULL,
	id_skill INT NOT NULL,

	PRIMARY KEY (id_pessoa, id_skill),

	FOREIGN KEY PessoaSkills(id_pessoa) REFERENCES Pessoas(id_pessoa),
	FOREIGN KEY PessoaSkills(id_skill) REFERENCES Skills(id_skill)
);

-- INSERT
-- Pessoas
INSERT INTO Pessoas(nome, nivel) VALUES ('Nicandro', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Ana Maeve', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Micila', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Individuo', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Diego Oliveira', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Junior Oliveira', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Jair Oliveira', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Santos Silva', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Anderson Silva', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Cleide Oliveira', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Efren Oliveira', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Carlos Oliveira', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Carlos Silva', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Karla Nascimento', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Karla Borges', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Ketlen da Silva', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Diogo Lima', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Joao dos Santos', 4);
INSERT INTO Pessoas(nome, nivel) VALUES ('Kleber Machado', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Galvao Bueno', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Ana Claudia', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Anita Ferreira', 5);
INSERT INTO Pessoas(nome, nivel) VALUES ('Ivete Souza', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Thiago Lopez', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Isis da Silva', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Marisa Monte', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Eduarda Araujo', 4);
INSERT INTO Pessoas(nome, nivel) VALUES ('Eduarda da Silva', 0);
INSERT INTO Pessoas(nome, nivel) VALUES ('Edson Arantes', 5);
INSERT INTO Pessoas(nome, nivel) VALUES ('Pelegolas Monte', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Gargolas da Silva', 4);
INSERT INTO Pessoas(nome, nivel) VALUES ('Fredson Frederico', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Jason Chassina', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Fred Grugues', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Drax Montes', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Petes Quil', 4);
INSERT INTO Pessoas(nome, nivel) VALUES ('Emanuele da Bande', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Renata Chapelim', 5);
INSERT INTO Pessoas(nome, nivel) VALUES ('Andreza Cruz', 0);
INSERT INTO Pessoas(nome, nivel) VALUES ('Andreza da Silva', 6);
INSERT INTO Pessoas(nome, nivel) VALUES ('Diolena de Almeida', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Priscila Oliveira', 5);
INSERT INTO Pessoas(nome, nivel) VALUES ('Adriana Calcanhoto', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Adriana Moraes', 4);
INSERT INTO Pessoas(nome, nivel) VALUES ('Jeferson Correia', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Adriana Santos', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Gustavo Bernardes', 4);
INSERT INTO Pessoas(nome, nivel) VALUES ('Bernardes Pequeno', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Glaucio Machado', 5);
INSERT INTO Pessoas(nome, nivel) VALUES ('Placido Silva', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Laiza Pereira', 6);
INSERT INTO Pessoas(nome, nivel) VALUES ('Simone Albuquerque', 0);
INSERT INTO Pessoas(nome, nivel) VALUES ('Keila Santos', 7);
INSERT INTO Pessoas(nome, nivel) VALUES ('Jhenyfer Oliveira', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Rose Santos', 6);
INSERT INTO Pessoas(nome, nivel) VALUES ('Loly Silva', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Tatiana Oliveira', 5);
INSERT INTO Pessoas(nome, nivel) VALUES ('Thaty Silva', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Janaian Carvalho', 4);
INSERT INTO Pessoas(nome, nivel) VALUES ('Rhosana Gigante', 4);
INSERT INTO Pessoas(nome, nivel) VALUES ('Jorgivan do Mato', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Jackson da Silva', 5);
INSERT INTO Pessoas(nome, nivel) VALUES ('Renata Souza', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Matheus Oliveira', 6);
INSERT INTO Pessoas(nome, nivel) VALUES ('Matheus Silva', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Raiza Moreno', 7);
INSERT INTO Pessoas(nome, nivel) VALUES ('Rilda Gaviao', 0);
INSERT INTO Pessoas(nome, nivel) VALUES ('Ligia Lopez', 8);
INSERT INTO Pessoas(nome, nivel) VALUES ('Lemos Santos Silva', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Georgia Oliveira', 7);
INSERT INTO Pessoas(nome, nivel) VALUES ('Hortencia Costa', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Jenivam Santos', 6);
INSERT INTO Pessoas(nome, nivel) VALUES ('Graciane Pereira', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Bruna Carvalho', 5);
INSERT INTO Pessoas(nome, nivel) VALUES ('Bruna Santos', 5);
INSERT INTO Pessoas(nome, nivel) VALUES ('Azanete Siqueira', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Nana de Minas', 7);
INSERT INTO Pessoas(nome, nivel) VALUES ('Ada Hortiz', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Ada Oliveira', 9);
INSERT INTO Pessoas(nome, nivel) VALUES ('Marta Souza', 0);
INSERT INTO Pessoas(nome, nivel) VALUES ('Milena Santos', 10);
INSERT INTO Pessoas(nome, nivel) VALUES ('Micaela dos Santos', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Marcia Meirelez', 9);
INSERT INTO Pessoas(nome, nivel) VALUES ('Laura Miller', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Natasha Silva', 8);
INSERT INTO Pessoas(nome, nivel) VALUES ('Natiele Sumida', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Natimy Sobral', 7);
INSERT INTO Pessoas(nome, nivel) VALUES ('Mariza Ortiz', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Gisela Furiosa', 5);
INSERT INTO Pessoas(nome, nivel) VALUES ('Bety Carvalho', 1);
INSERT INTO Pessoas(nome, nivel) VALUES ('Gamora do Piter', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Barbara Janaina', 8);
INSERT INTO Pessoas(nome, nivel) VALUES ('Luana Oliveira', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Beatriz Alencar', 2);
INSERT INTO Pessoas(nome, nivel) VALUES ('Marcos da Costa', 4);
INSERT INTO Pessoas(nome, nivel) VALUES ('Debora Silva Santos', 6);
INSERT INTO Pessoas(nome, nivel) VALUES ('Diana Correia', 3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Bianca Lardone', 8);
INSERT INTO Pessoas(nome, nivel) VALUES ('Borges Silva',  3);
INSERT INTO Pessoas(nome, nivel) VALUES ('Olivia Popay', 10);

-- Skills
INSERT INTO Skills(id_skill, nome, descricao) VALUES (1, 'HTML', 'Linguagem de Marcação.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (2, 'JavaScript', 'Linguagem de Script.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (3, 'CSS', 'Linguagem de Estilo.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (4, 'AngularJs', 'FrameWork Javascript.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (5, 'jQuery', 'Framework javascript.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (6, 'Jasmine', 'Framework para testar aplicações escritas em JavaScript.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (7, 'jUnit', 'Framework para testar aplicações escritas em Java.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (8, 'Java', 'Linguagem de programação.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (9, 'C# e C++', 'Linguagem de programação.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (10, 'PHP', 'Linguagem de Programação.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (11, 'HTML5', 'Linguagem de marcação.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (12, 'Debian', 'Distribuição de sistema baseado no Kernel Linux, ou algo assim.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (13, 'Ubuntu', 'Distribuição baseada no Debian');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (14, 'Kubunut', 'Distribuição linux baseada em outra distribuição linux.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (15, 'Windows XP', 'Sistema operacional da Microsoft.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (16, 'Windows 7', 'Sistema operacional da Microsoft.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (17, 'Windows 8', 'Sistema operacional da Microsoft.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (18, 'Android', 'Sistema operacional da Google.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (19, 'Ardoino', 'Hardware utilizado em micro controladores.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (20, 'Microservices', 'Metodologia de desenvolvimento de software voltada para escalabilidade.');
INSERT INTO Skills(id_skill, nome, descricao) VALUES (21, 'Arquitetura de Software', 'Area responsavel pela estruturação de um sistema de informação');

-- PessoaSkills
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (1, 1);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (1, 2);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (1, 4);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (2, 5);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (2, 7);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (2, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (3, 2);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (3, 3);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (3, 6);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (3, 11);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (4, 19);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (5, 21);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (6, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (6, 11);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (6, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (6, 13);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (6, 14);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (8, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (10, 21);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (12, 5);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (13, 6);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (13, 7);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (13, 8);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (16, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (16, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (17, 19);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (18, 18);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (19, 17);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (20, 16);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (21, 15);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (22, 15);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (22, 14);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (22, 13);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (22, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (30, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (31, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (32, 11);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (32, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (32, 16);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (32, 17);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (33, 1);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (33, 2);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (33, 5);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (35, 11);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (35, 17);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (36, 6);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (37, 7);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (38, 8);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (38, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (39, 14);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (40, 15);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (40, 8);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (40, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (41, 6);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (42, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (42, 13);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (42, 15);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (43, 17);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (43, 19);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (44, 21);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (45, 2);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (46, 1);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (46, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (47, 16);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (48, 6);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (49, 13);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (50, 1);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (50, 2);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (51, 3);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (52, 4);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (53, 5);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (54, 6);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (55, 7);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (55, 8);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (56, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (57, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (58, 11);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (58, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (58, 13);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (59, 14);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (59, 15);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (59, 16);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (59, 17);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (59, 18);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (59, 19);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (59, 20);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (59, 21);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (59, 13);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (60, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (60, 13);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (60, 14);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (61, 13);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (65, 14);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (65, 15);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (65, 16);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (67, 19);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (70, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (70, 16);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (70, 19);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (70, 20);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (73, 1);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (74, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (77, 8);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (77, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (77, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (77, 14);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (77, 15);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (77, 16);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (77, 17);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (77, 18);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (80, 1);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (80, 2);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (80, 3);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (80, 4);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (80, 5);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (84, 5);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (84, 6);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (84, 7);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (85, 7);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (86, 7);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (87, 7);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (87, 8);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (87, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (88, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (89, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (89, 11);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (89, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (90, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (91, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (93, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (94, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (95, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (96, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (97, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (97, 11);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (97, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (98, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (99, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (99, 13);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 1);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 2);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 3);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 4);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 5);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 6);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 7);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 8);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 9);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 10);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 11);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 12);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 13);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 14);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 15);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 16);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 17);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 18);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 19);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 20);
INSERT INTO PessoaSkills (id_pessoa, id_skill) VALUES (100, 21);

-- ListaDominio 
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (1, 'Web');
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (2, 'Ambiente Linux');
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (3, 'Linguagem para Shell');
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (4, 'Ambiente Windows');
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (5, 'Teste de Software');
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (6, 'Desenvolvimento de Software');
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (7, 'Sistema Operacionais');
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (8, 'Sistema mobiles');
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (9, 'Engenharia de Software');
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (10, 'Aplicações de Backend');
INSERT INTO ListaDominios(id_dominio, nome_dominio) VALUES (11, 'Aplicações de Frontend');

-- SkillsDominio
-- HTML
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (1, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (1, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (1, 5);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (1, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (1, 8);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (1, 9);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (1, 11);
-- JavaScript
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (2, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (2, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (2, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (2, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (2, 5);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (2, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (2, 8);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (2, 9);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (2, 10);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (2, 11);
-- CSS
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (3, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (3, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (3, 8);
-- AngularJs
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (4, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (4, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (4, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (4, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (4, 5);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (4, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (4, 8);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (4, 9);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (4, 10);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (4, 11);
-- jQuery
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (5, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (5, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (5, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (5, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (5, 5);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (5, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (5, 8);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (5, 9);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (5, 10);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (5, 11);
-- Jasmine
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (6, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (6, 5);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (6, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (6, 11);
-- jUnit
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (7, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (7, 10);
-- Java
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (8, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (8, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (8, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (8, 8);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (8, 10);
-- C# e C++
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (9, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (9, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (9, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (9, 8);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (9, 10);
-- PHP
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (10, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (10, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (10, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (10, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (10, 8);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (10, 10);
-- HTML5
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (11, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (11, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (11, 5);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (11, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (11, 8);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (11, 9);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (11, 11);
-- Debian
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (12, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (12, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (12, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (12, 7);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (12, 10);
-- Ubuntu
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (13, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (13, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (13, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (13, 7);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (13, 10);
-- Kubuntu
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (14, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (14, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (14, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (14, 7);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (14, 10);
-- Windows Xp
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (15, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (15, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (15, 7);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (15, 10);
-- Windows 7
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (16, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (16, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (16, 7);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (16, 10);
-- Windows 8
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (17, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (17, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (17, 7);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (17, 10);
-- Android
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (18, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (18, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (18, 7);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (18, 8);
-- Arduino
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (19, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (19, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (19, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (19, 5);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (19, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (19, 8);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (19, 9);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (19, 10);
-- MicroServices
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (20, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (20, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (20, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (20, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (20, 5);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (20, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (20, 9);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (20, 10);
-- Arquitetura de Software
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 1);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 2);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 3);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 4);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 5);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 6);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 7);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 8);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 9);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 10);
INSERT INTO SkillsDominios(id_skill, id_dominio) VALUES (21, 11);

-- Problemas
INSERT INTO Problemas(id_problema, titulo, descricao) VALUES (1, 'Como realizar e testar Ajax utilizando JavaScrit e seus Frameworks', 'A ideia é criar uma API e através desta API realizar testes de verificação.');
INSERT INTO Problemas(id_problema, titulo, descricao) VALUES (2, 'Como criar e configurar um servidor apache no Ubuntu?', 'Preciso criar um serviço que funcione através do navegador e então consumilo em dispositivos moveis, como faço isso?');
INSERT INTO Problemas(id_problema, titulo, descricao) VALUES (3, 'Criando rotinas de backup de dados no linux', 'Preciso criar rotinas que executem automaticamene o backup dos dados do servidor em horas pré determinadas, como posso fazer isso?');
INSERT INTO Problemas(id_problema, titulo, descricao) VALUES (4, 'Configuração de grupo de usuários Windows', 'Como posso configurar grupos especificos de usuários para acessar determinadas pastas utilizando as distribuições do Windows?');
INSERT INTO Problemas(id_problema, titulo, descricao) VALUES (5, 'Como posso criar um serviço que suporte demandas extra gigantes?', 'Preciso criar m sistema que quando necessário possa escalar automaticamente determinado serviços do meu sistema?');

-- ProblemasSkills
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (1, 1);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (1, 2);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (1, 4);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (1, 5);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (1, 6);

INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (2, 8);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (2, 9);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (2, 10);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (2, 12);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (2, 13);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (2, 14);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (2, 18);

INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (3, 12);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (3, 13);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (3, 14);

INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (4, 15);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (4, 16);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (4, 17);

INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (5, 12);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (5, 13);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (5, 14);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (5, 19);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (5, 20);
INSERT INTO ProblemasSkills (id_problema, id_skill) VALUES (5, 21);

-- Respostas
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (1, 'Utilize o Jasmine para configurar seus cenarios de teste, através dele você vai conseguir elaborar testes confiaveis e com geração automatica de relatórios.', 5);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (1, 'Eu criei um mini framework utilizando a biblioteca do jQuery. O processo é simples, eu declaro uma variavel \'expected\' e nela coloco o valor do jSon que gostaria de receber como retorno, posteriormente eu utilizo o ajax do jQuery para capturar o json da api e entao comparo com o objeto.', 2);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (1, 'A melhor forma de se fazer isso é utilizando os frameworks de teste, Jasmine, AngularUnit, phantom. Voce so precisa verifica qual melhor se adequa a sua situação e escolher. Assista a aulas no youtube e verifique na pagina dos desenvolvedores para ter mais informações sobre cada um.', 20);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (1, 'Segue o conselho do carinha acima, essa é a melhor forma mesmo de se testar javascript.', 10);

INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (2, 'Bom, você vai precisar instalar os pacotes referentes ao PHP e ao framework que você for utilizar para criar seu servidor REST, e muito provavelmente vai ter de alterar o Apache para que a URL possa ser reescrita.', 0);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (2, 'Você vai precisar instalar o Apache, faça isso através do APT, é a forma mais fácil, depois disso crie a pasta do seu projeto no diretorio www e vuala, tudo ira funcionar :D', 2);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (2, 'Existem trocentas formas de se fazer isso, mas, qual é mesmo a finalidade do seu servidor REST, talvez o apache não seje a melhor escolha.', 10);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (2, 'Não sei qual é a sua necessidade, mas se desempenho for critico, sugiro que você pesquise sobre NoSql e NodeJs, você consegue subir um servidor REST utilizando essas duas tacnologias.', 0);

INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (3, 'Pesquise sobre o contrab, ele é o gerenciador de tarefas agendadas no Ubuntu, Debian, e provavelmente de outras distribuições...', 7);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (3, 'E isso ai, você também vai precisar pesquisar sobre linguagens de script como shell script, utilização de script PHP para o shell do linux e outras linguagens. São esses que iram executar as rotinas que você deseja.', 12);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (3, 'Aconselho a utilizar somente shell script, utilizar PHP ou JavaScript pode ser perigoso a longo prazo visto que essas linguagens não foram criadas para essa finalidade. Mas se a rotina for pequena, eles serao suficiente.', 0);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (3, 'Yep, vou verificar essas possibilidades, vlw galera =)', 1);

INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (4, 'Você vai precisar de um servidor Windows, qualquer distribuição do Windows Server será suficiente, depois disso o resto e sussa.', 0);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (4, 'Opa, não necessariamente deve existir um servidor Windows Server para se obter isso, existem formas de se utilizar de uma distribuição para usuários do Windows para alcancar este objetivo. Seria uma solução barata e eficaz.', 0);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (4, 'Discordo, se o objetivo é gerenciar uma empresa, uma distribuição para usuários comuns do Windows jamais deverá ser utilizada. Se o custo for um problema, escolha alguma distribuição linux para fazer isso, mas não utiliza um Windows comum para esta tarefa.', 1041);

INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (5, 'Puts, existem inumeras softwares que podem auxiliar você nesta missão, Load balance é um deles. Aconselho você a dar uma olhada na estrutura oferecida pela Amazon e seus concorrentes, eles podem fazer isso por você.',18);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (5, 'Fato, existem muitas soluções. O desenvolvimento do software também ajuda bastante para se obter esse resultado. Se o software ainda for ser desenvolvido, procure informações a respeito de MicroServices. Esta metodologia de desenvolvimento apresenta grandes vantagens relacionadas a escalabilidade.', 0);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (5, 'Perfeito. Se sua aplicação for desenvolvida utlizando os padrões de MicroServices você com certeza não vai ter problemas relacionados a performance do seu produto, levando em consideração que a escalabilidade estará disponivel.', 0);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (5, 'Essa é uma questão tipica referente a sistemas distribuidos. Vale fazer uma analise mais profunda afim de descobrir quais seriam os serviços com maior potencial para serem escalados. Isso evitarias custos desnecessarios durante o desenvolvimento.', 2332);
INSERT INTO Respostas ( id_problema, resposta, qtd_like ) VALUES (5, 'Sabias palavras. O problema do MicroService e o tempo necessario para que os resultados comecem a surgir. Se o cliente não estiver ciente do que esta acontecendo ele pode achar que a sua empresa é lenta e acabar indo para a concorrencia..', 35);
