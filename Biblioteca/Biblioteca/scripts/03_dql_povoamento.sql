SELECT * FROM autores;
SELECT * FROM editoras;
SELECT * FROM categorias;
SELECT * FROM usuarios;
SELECT * FROM funcionarios;
SELECT * FROM livros;
SELECT * FROM exemplares;
SELECT * FROM emprestimos;
SELECT * FROM devolucoes;
SELECT * FROM multas;
SELECT titulo, isbn FROM livros;
SELECT nome, email FROM usuarios;
SELECT nome, cargo FROM funcionarios;
SELECT nome_fantasia, pais FROM editoras;
SELECT id_emprestimo, data_saida FROM emprestimos;

SELECT titulo, ano_publicado FROM livros WHERE ano_publicado > 2015;

SELECT nome, nacionalidade FROM autores WHERE nacionalidade = 'Brasileira';

SELECT nome, cargo, salario FROM funcionarios WHERE salario > 5000;

SELECT nome_fantasia, pais FROM editoras WHERE pais = 'Brasil';

SELECT nome, email FROM usuarios WHERE email LIKE '%@email.com';

SELECT * FROM multas WHERE data_pagamento IS NULL;

SELECT titulo FROM livros WHERE titulo LIKE '%Sombras%';

SELECT * FROM emprestimos WHERE data_saida LIKE '2026-01%';

SELECT nome_categoria FROM categorias WHERE nome_categoria LIKE 'F%';

SELECT * FROM devolucoes WHERE fk_funcionario = 1;

SELECT nome, data_nascimento FROM autores WHERE data_nascimento < '1970-01-01';

SELECT * FROM exemplares WHERE data_aquisicao LIKE '2024-03%';

SELECT * FROM multas WHERE valor_multa > 15.00;

SELECT titulo FROM livros WHERE ano_publicado = 2012;

SELECT nome FROM usuarios WHERE nome LIKE 'A%';

SELECT l.titulo, a.nome AS autor FROM livros l JOIN autores a ON l.fk_autor = a.id_autor;

SELECT l.titulo, e.nome_fantasia AS editora FROM livros l JOIN editoras e ON l.fk_editora = e.id_editora;

SELECT l.titulo, c.nome_categoria FROM livros l JOIN categorias c ON l.fk_categoria = c.id_categoria;

SELECT em.id_emprestimo, u.nome FROM emprestimos em JOIN usuarios u ON em.fk_usuario = u.id_usuario;

SELECT d.data_real_entrega, f.nome AS funcionario FROM devolucoes d JOIN funcionarios f ON d.fk_funcionario = f.id_funcionario;

SELECT u.nome, l.titulo, em.data_saida 
FROM emprestimos em 
JOIN usuarios u ON em.fk_usuario = u.id_usuario 
JOIN exemplares ex ON em.fk_exemplar = ex.id_exemplar 
JOIN livros l ON ex.fk_livro = l.id_livro;

SELECT u.nome, m.valor_multa 
FROM multas m 
JOIN emprestimos em ON m.fk_emprestimo = em.id_emprestimo 
JOIN usuarios u ON em.fk_usuario = u.id_usuario;

SELECT l.titulo, a.nome AS autor, e.nome_fantasia AS editora, c.nome_categoria AS categoria 
FROM livros l 
JOIN autores a ON l.fk_autor = a.id_autor 
JOIN editoras e ON l.fk_editora = e.id_editora 
JOIN categorias c ON l.fk_categoria = c.id_categoria;

SELECT ex.id_exemplar, l.titulo, f.nome AS cadastrado_por 
FROM exemplares ex 
JOIN livros l ON ex.fk_livro = l.id_livro 
JOIN funcionarios f ON ex.fk_funcionario = f.id_funcionario;

SELECT l.titulo, em.data_saida, d.data_real_entrega 
FROM devolucoes d 
JOIN emprestimos em ON d.fk_emprestimo = em.id_emprestimo 
JOIN exemplares ex ON em.fk_exemplar = ex.id_exemplar 
JOIN livros l ON ex.fk_livro = l.id_livro;

SELECT COUNT(*) AS total_livros FROM livros;
SELECT COUNT(*) AS total_usuarios FROM usuarios;
SELECT COUNT(*) AS total_multas_pendentes FROM multas WHERE data_pagamento IS NULL;

SELECT SUM(salario) AS custo_mensal_folha FROM funcionarios;
SELECT SUM(valor_multa) AS total_arrecadado FROM multas WHERE data_pagamento IS NOT NULL;
SELECT SUM(valor_multa) AS total_a_receber FROM multas WHERE data_pagamento IS NULL;

SELECT AVG(salario) AS media_salarial FROM funcionarios;
SELECT AVG(valor_multa) AS media_multas FROM multas WHERE valor_multa > 0;
SELECT AVG(ano_publicado) AS media_idade_acervo FROM livros;

SELECT MAX(salario) AS maior_salario FROM funcionarios;
SELECT MIN(ano_publicado) AS livro_mais_antigo FROM livros;
SELECT MAX(valor_multa) AS maior_multa_aplicada FROM multas;