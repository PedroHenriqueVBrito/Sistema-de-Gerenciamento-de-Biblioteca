Sistema de Biblioteca
O sistema de biblioteca tem como objetivo gerenciar livros, usuários, funcionários e empréstimos.

A biblioteca possui um conjunto de livros, onde cada livro está associado a um autor, uma editora e uma categoria.

Cada livro pode possuir vários exemplares físicos, que representam as unidades disponíveis para empréstimo. Cada exemplar possui um estado de conservação e um status de disponibilidade.

Os usuários podem realizar empréstimos de exemplares. Cada empréstimo é registrado com a data de saída e a data prevista de devolução.

Os empréstimos são processados por funcionários, que são responsáveis pelo atendimento.

Quando um exemplar é devolvido, é registrado em devoluções, contendo a data de entrega e o número de dias de atraso, caso exista.

Se houver atraso na devolução, pode ser gerada uma multa, que possui um valor e um status de pagamento.

Regras de Negócio

Um livro pode ter vários exemplares

Um usuário pode ter vários empréstimos

Um empréstimo está ligado a um único exemplar

Um empréstimo pode gerar uma devolução

Uma devolução pode gerar uma multa

Um funcionário pode registrar vários empréstimos