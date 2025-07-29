Esses desafios podem ser lidos em Inglês: [Read in English :us: :gb:](/sql/CHALLENGES.md)

# Desafios SQL – Brazilian E-Commerce Dataset (Kaggle)

Este documento apresenta 30 desafios de SQL sobre o dataset de e-commerce brasileiro da Olist, estruturados em três níveis de dificuldade (Pleno a Sênior), baseados em consultas analíticas com múltiplas tabelas, filtros, métricas e lógica temporal.

Os desafios estão divididos em 3 partes:
|Nível|Desafios|
|-|-|
|[Intermediário II](#intermediário-ii)|1 - 10|
|[Avançado I](#avançado-i)|11 - 20|
|[Avançado II](#avançado-ii)|21 - 30|

---

### Intermediário II

1. [x] Calcule o ticket médio por cliente, considerando apenas clientes do estado de São Paulo. [(Resolução)](/sql/01_intermediate/c01.sql)
2. [x] Liste os 10 produtos com maior média de valor de frete, considerando apenas produtos com pelo menos 5 vendas. [(Resolução)](/sql/01_intermediate/c02.sql)
3. [x] Para cada estado de origem do vendedor, calcule a média de tempo entre a aprovação e a entrega ao cliente. [(Resolução)](/sql/01_intermediate/c03.sql)
4. [x] Crie uma métrica de “eficiência logística” por cidade do vendedor, definida como: (tempo médio entre aprovação e entrega) / (diferença de prefixos de CEP entre vendedor e cliente). [(Resolução)](/sql/01_intermediate/c04.sql)
5. [x] Liste as categorias de produto com maior valor de venda total, desconsiderando frete. [(Resolução)](/sql/01_intermediate/c05.sql)
6. [x] Para cada tipo de pagamento, calcule a média de valor por parcela (payment_value / payment_installments). [(Resolução)](/sql/01_intermediate/c06.sql)
7. [x] Calcule, para cada mês, o percentual de pedidos entregues após a data estimada. [(Resolução)](/sql/01_intermediate/c07.sql)
8. [x] Liste os clientes que fizeram pedidos com mais de um tipo de pagamento em um mesmo pedido. [(Resolução)](/sql/01_intermediate/c08.sql)
9. [x] Para cada categoria de produto, calcule a proporção de pedidos com avaliação 5 em relação ao total. [(Resolução)](/sql/01_intermediate/c09.sql)
10. [x] Identifique as 10 cidades com maior número de clientes únicos e, para cada uma, informe o ticket médio e a média de avaliações. [(Resolução)](/sql/01_intermediate/c10.sql)

---

### Avançado I

11. [x] Para cada ano, liste a categoria mais vendida em número de produtos (quantidade total de order_items). [(Resolução)](/sql/02_advanced_i/c11.sql)
12. [x] Liste os pedidos com múltiplos vendedores e calcule o valor total do pedido e o número de vendedores envolvidos. [(Resolução)](/sql/02_advanced_i/c12.sql)
13. [x] Para cada estado, calcule o atraso médio em dias entre a entrega ao cliente e a data estimada, considerando apenas pedidos entregues com atraso. [(Resolução)](/sql/02_advanced_i/c13.sql)
14. [x] Calcule a avaliação média por categoria de produto e ordene da melhor para a pior. [(Resolução)](/sql/02_advanced_i/c14.sql)
15. [x] Para cada cliente, calcule o tempo médio entre seus pedidos (considerando apenas clientes com pelo menos 3 pedidos). [(Resolução)](/sql/02_advanced_i/c14.sql)
16. [x] Liste os 10 produtos com maior índice de devolução, definido como: número de avaliações com nota 1 / total de pedidos do produto. [(Resolução)](/sql/02_advanced_i/c16.sql)
17. [ ] Crie uma métrica de “custo médio logístico por produto”, definida como: (frete médio do produto / peso médio do produto).
18. [ ] Para cada tipo de pagamento, calcule o valor total movimentado e o número médio de parcelas por pedido.
19. [ ] Liste os pedidos que foram entregues antes mesmo da data de aprovação (possíveis erros de sistema).
20. [ ] Para cada vendedor, calcule o valor médio por pedido considerando apenas aqueles com avaliação 5.

---

### Avançado II

21. [ ] Identifique as categorias que tiveram crescimento de vendas (quantidade total de itens vendidos) por 3 meses consecutivos. Liste a categoria e os meses em que isso ocorreu.
22. [ ] Para cada cliente que fez pelo menos 3 compras, identifique se o valor total gasto cresceu a cada pedido. Liste esses clientes e os respectivos valores.
23. [ ] Liste os estados onde o tempo médio de entrega melhorou a cada ano consecutivo (por pelo menos 3 anos).
24. [ ] Para cada vendedor, identifique os anos em que ele vendeu produtos em pelo menos 4 categorias distintas.
25. [ ] Crie um índice de fidelidade por cliente, definido como: número de pedidos com o mesmo vendedor / total de pedidos. Liste os clientes com índice acima de 0.8.
26. [ ] Identifique as 5 categorias de produtos com maior crescimento percentual no número de avaliações 5 estrelas nos últimos 12 meses do dataset.
27. [ ] Liste os produtos que passaram de avaliação média abaixo de 3 para acima de 4 em dois anos consecutivos.
28. [ ] Para cada cidade de entrega, calcule se o prazo médio de entrega foi reduzido consistentemente a cada semestre durante pelo menos 3 semestres consecutivos.
29. [ ] Liste os vendedores que aumentaram o valor médio de venda por item por 3 trimestres consecutivos.
30. [ ] Crie um ranking anual de cidades com melhor performance logística, definida como: (entregas no prazo / total de pedidos). Mostre as 3 melhores por ano.
