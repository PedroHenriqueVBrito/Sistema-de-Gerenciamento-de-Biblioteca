DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);

CREATE TABLE editoras (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome_fantasia VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    contato VARCHAR(50)
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(50)
);

CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    fk_autor INT,
    fk_editora INT,
    fk_categoria INT,
    isbn VARCHAR(20) UNIQUE,
    ano_publicado INT,
    FOREIGN KEY (fk_autor) REFERENCES autores (id_autor),
    FOREIGN KEY (fk_editora) REFERENCES editoras (id_editora),
    FOREIGN KEY (fk_categoria) REFERENCES categorias (id_categoria)
);

CREATE TABLE exemplares (
    id_exemplar INT AUTO_INCREMENT PRIMARY KEY,
    fk_livro INT,
    fk_funcionario INT,
    data_aquisicao DATE,
    FOREIGN KEY (fk_livro) REFERENCES livros (id_livro),
    FOREIGN KEY (fk_funcionario) REFERENCES funcionarios (id_funcionario)
);

CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    fk_usuario INT,
    fk_exemplar INT,
    data_saida DATE,
    data_devolucao_prevista DATE,
    FOREIGN KEY (fk_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (fk_exemplar) REFERENCES exemplares (id_exemplar)
);

CREATE TABLE devolucoes (
    id_devolucao INT AUTO_INCREMENT PRIMARY KEY,
    fk_emprestimo INT,
    fk_funcionario INT,
    data_real_entrega DATE,
    FOREIGN KEY (fk_emprestimo) REFERENCES emprestimos (id_emprestimo),
    FOREIGN KEY (fk_funcionario) REFERENCES funcionarios (id_funcionario)
);

CREATE TABLE multas (
    id_multa INT AUTO_INCREMENT PRIMARY KEY,
    fk_emprestimo INT,
    valor_multa DECIMAL(10,2) DEFAULT 0.00,
    data_pagamento DATE,
    FOREIGN KEY (fk_emprestimo) REFERENCES emprestimos (id_emprestimo)
);

USE biblioteca;

ALTER TABLE exemplares ADD COLUMN status_conservacao VARCHAR(50) DEFAULT 'Bom';
ALTER TABLE exemplares ADD COLUMN disponibilidade BOOLEAN DEFAULT 1;

ALTER TABLE multas ADD COLUMN status_pagamento VARCHAR(20) DEFAULT 'Pendente';

SET SQL_SAFE_UPDATES = 0;
UPDATE multas SET status_pagamento = 'Pago' WHERE data_pagamento IS NOT NULL;
SET SQL_SAFE_UPDATES = 1;