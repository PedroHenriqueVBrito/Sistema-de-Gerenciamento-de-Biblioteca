# Dicionário de Dados - Sistema de Biblioteca

Este documento apresenta a estrutura do banco de dados utilizado no sistema de gerenciamento de biblioteca. O objetivo é detalhar as tabelas, campos e relacionamentos existentes no projeto, facilitando a manutenção e compreensão do sistema.

---

# Tabela: autores

Responsável pelo armazenamento das informações dos autores cadastrados no sistema.

| Campo | Tipo | Descrição |
|---|---|---|
| id_autor | INT | Identificador único do autor |
| nome | VARCHAR(100) | Nome completo do autor |
| nacionalidade | VARCHAR(50) | Nacionalidade do autor |
| data_nascimento | DATE | Data de nascimento do autor |

---

# Tabela: editoras

Armazena os dados das editoras responsáveis pela publicação dos livros.

| Campo | Tipo | Descrição |
|---|---|---|
| id_editora | INT | Identificador único da editora |
| nome_fantasia | VARCHAR(100) | Nome fantasia da editora |
| pais | VARCHAR(50) | País de origem da editora |
| contato | VARCHAR(50) | Informações de contato da editora |

---

# Tabela: categorias

Tabela utilizada para organizar os livros por categoria.

| Campo | Tipo | Descrição |
|---|---|---|
| id_categoria | INT | Identificador único da categoria |
| nome_categoria | VARCHAR(100) | Nome da categoria cadastrada |

---

# Tabela: usuarios

Contém os dados dos usuários que utilizam os serviços da biblioteca.

| Campo | Tipo | Descrição |
|---|---|---|
| id_usuario | INT | Identificador único do usuário |
| nome | VARCHAR(100) | Nome completo do usuário |
| email | VARCHAR(100) | Endereço de e-mail do usuário |
| senha | VARCHAR(50) | Senha utilizada para acesso ao sistema |

---

# Tabela: funcionarios

Responsável pelo armazenamento das informações dos funcionários da biblioteca.

| Campo | Tipo | Descrição |
|---|---|---|
| id_funcionario | INT | Identificador único do funcionário |
| nome | VARCHAR(100) | Nome completo do funcionário |
| cargo | VARCHAR(50) | Cargo ocupado pelo funcionário |
| salario | DECIMAL(10,2) | Valor salarial do funcionário |

---

# Tabela: livros

Tabela principal do acervo da biblioteca.

| Campo | Tipo | Descrição |
|---|---|---|
| id_livro | INT | Identificador único do livro |
| titulo | VARCHAR(150) | Título do livro |
| fk_autor | INT | Referência ao autor do livro |
| fk_editora | INT | Referência à editora do livro |
| fk_categoria | INT | Referência à categoria do livro |
| isbn | VARCHAR(20) | Código ISBN do livro |
| ano_publicado | INT | Ano de publicação do livro |

---

# Tabela: exemplares

Representa os exemplares físicos disponíveis no acervo.

| Campo | Tipo | Descrição |
|---|---|---|
| id_exemplar | INT | Identificador único do exemplar |
| fk_livro | INT | Referência ao livro correspondente |
| fk_funcionario | INT | Funcionário responsável pelo cadastro |
| data_aquisicao | DATE | Data de aquisição do exemplar |
| status_conservacao | VARCHAR(50) | Estado físico do exemplar |
| disponibilidade | BOOLEAN | Situação de disponibilidade do exemplar |

---

# Tabela: emprestimos

Armazena os registros de empréstimos realizados pelos usuários.

| Campo | Tipo | Descrição |
|---|---|---|
| id_emprestimo | INT | Identificador único do empréstimo |
| fk_usuario | INT | Usuário responsável pelo empréstimo |
| fk_exemplar | INT | Exemplar emprestado |
| data_saida | DATE | Data em que o empréstimo foi realizado |
| data_devolucao_prevista | DATE | Prazo previsto para devolução |

---

# Tabela: devolucoes

Controla as devoluções realizadas na biblioteca.

| Campo | Tipo | Descrição |
|---|---|---|
| id_devolucao | INT | Identificador único da devolução |
| fk_emprestimo | INT | Referência ao empréstimo realizado |
| fk_funcionario | INT | Funcionário responsável pelo recebimento |
| data_real_entrega | DATE | Data efetiva da devolução |

---

# Tabela: multas

Responsável pelo controle de multas geradas por atraso na devolução de exemplares.

| Campo | Tipo | Descrição |
|---|---|---|
| id_multa | INT | Identificador único da multa |
| fk_emprestimo | INT | Referência ao empréstimo relacionado |
| valor_multa | DECIMAL(10,2) | Valor aplicado na multa |
| data_pagamento | DATE | Data em que a multa foi quitada |
| status_pagamento | VARCHAR(20) | Situação atual da multa |

---

# Relacionamentos Principais

- Um autor pode estar relacionado a vários livros.
- Uma editora pode publicar vários livros.
- Uma categoria pode possuir diversos livros cadastrados.
- Um livro pode possuir vários exemplares.
- Um usuário pode realizar vários empréstimos.
- Cada empréstimo está vinculado a um exemplar.
- Um empréstimo pode gerar uma multa.
- Funcionários realizam cadastros e controlam devoluções.

---

# Considerações Finais

O banco de dados foi desenvolvido com foco na organização do acervo bibliográfico, no controle de empréstimos e na administração das atividades internas da biblioteca. A estrutura permite futuras expansões do sistema, mantendo a integridade e o relacionamento entre os dados cadastrados.
