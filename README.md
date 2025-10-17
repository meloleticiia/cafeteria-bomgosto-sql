# Sistema de Gerenciamento: Cardápio e Comandas (SQLite)

## Sobre o Projeto

Este repositório contém o código SQL para a criação e gerenciamento de um pequeno banco de dados focado em um sistema de pedidos (comandas) para uma cafeteria ou estabelecimento similar.

O projeto foi desenvolvido com foco na prática de comandos essenciais de SQL, incluindo:
* Definição da Estrutura (DDL): Criação de tabelas com chaves primárias e estrangeiras.
* Manipulação de Dados (DML): Inserção de dados de exemplo.
* Consultas Avançadas: Utilização de JOINs para relacionar dados, e comandos como GROUP BY, SUM e HAVING para realizar agregações e cálculos de faturamento.

Tecnologias e Ambiente

| Recurso | Detalhe |
| :--- | :--- |
| **Banco de Dados** | SQLite |
| **Ambiente de Desenvolvimento** | Visual Studio Code (VS Code) |
| **Extensão Utilizada** | Extensão SQLite para VS Code |

Arquivos no Repositório

* `cardapio.sql`: Contém todo o script SQL (criação das tabelas, inserção dos dados de teste e as consultas de análise).
* `meu_cardapio.db`: O arquivo binário do banco de dados SQLite onde os dados foram armazenados e testados.

Detalhes do código

O script `cardapio.sql` inclui várias consultas prontas para análise do negócio:

1.  **Detalhe da Comanda:** Retorna uma visão completa de todos os itens em cada comanda, incluindo a quantidade e o preço total por item.
2.  **Valor Total por Comanda:** Calcula o somatório do valor de todos os itens, apresentando o total para cada pedido individual.
3.  **Comandas com Múltiplos Itens:** Filtra apenas as comandas que contêm mais de um tipo de produto (usando o `HAVING`).
4.  **Faturamento Diário:** Calcula o faturamento total da cafeteria agrupado pela data.

Como exercutar o projeto

Para testar o código e as consultas no seu computador:

1.  **Instalação:** Certifique-se de ter o **Visual Studio Code** e a **Extensão SQLite** instalada.
2.  **Conexão:** No VS Code, abra o arquivo `cardapio.sql`. Use a extensão SQLite para conectar este script ao arquivo `meu_cardapio.db` (onde o banco será criado).
3.  **Execução Inicial:** Selecione e execute (Run Query) os comandos `CREATE TABLE` e `INSERT INTO` no `cardapio.sql` para construir e popular o banco de dados.
4.  **Análise:** Execute as consultas `SELECT` individualmente para ver os resultados e a prova de funcionamento das agregações e JOINs.
