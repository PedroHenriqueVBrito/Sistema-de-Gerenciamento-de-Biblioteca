USE biblioteca;

UPDATE funcionarios SET salario = salario * 1.05 WHERE cargo = 'Bibliotecário';

UPDATE exemplares SET status_conservacao = 'Excelente' WHERE id_exemplar = 1;

UPDATE exemplares SET disponibilidade = 1 WHERE data_aquisicao > '2020-01-01';

UPDATE editoras SET contato = 'sac@editorahorizonte.com.br' WHERE nome_fantasia = 'Editora Horizonte';

UPDATE autores SET nacionalidade = 'Brasileira' WHERE nacionalidade = 'Brasil';

UPDATE multas SET status_pagamento = 'Arquivada' WHERE data_pagamento < '2023-01-01';

UPDATE funcionarios SET cargo = 'Gerente de Acervo' WHERE id_funcionario = 10;

UPDATE editoras SET contato = 'international@globalpages.com' WHERE pais != 'Brasil';

UPDATE autores SET data_nascimento = '1985-04-13' WHERE nome = 'Alana Silveira';

UPDATE usuarios SET email = 'usuario.novo@email.com' WHERE id_usuario = 5;

DELETE FROM multas WHERE valor_multa = 0;

DELETE FROM multas WHERE data_pagamento < '2010-01-01';

DELETE FROM multas WHERE status_pagamento = 'Cancelada';

DELETE FROM devolucoes WHERE data_real_devolucao < '2015-01-01';

DELETE FROM multas WHERE id_multa = 50;

DELETE FROM multas WHERE valor_multa < 1.00;

DELETE FROM devolucoes WHERE fk_funcionario = 50;

DELETE FROM multas WHERE valor_multa = 99.99;

DELETE FROM devolucoes WHERE data_real_devolucao = '2023-12-25';

DELETE FROM multas WHERE fk_emprestimo = 10;