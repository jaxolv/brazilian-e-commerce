Esses desafios podem ser lidos em Inglês: [Read in English :us: :gb:](/sql/CHALLENGES.md)

# 📦 Desafios SQL – Brazilian E-Commerce Dataset (Kaggle)

Este documento apresenta 30 desafios de SQL sobre o dataset de e-commerce brasileiro da Olist, estruturados em três níveis de dificuldade (Pleno a Sênior), baseados em consultas analíticas com múltiplas tabelas, filtros, métricas e lógica temporal.

Os desafios estão divididos em 3 partes:
|Nível|Desafios|
|-|-|
|Intermediário II|1 - 10|
|Avançado I|11 - 20|
|Avançado II|21 - 30|

---

### Intermediário II

1. [ ] Calcule o ticket médio por cliente, considerando apenas clientes com mais de 3 pedidos distintos.
2. [ ] Liste os 10 produtos com maior média de valor de frete, considerando apenas produtos com pelo menos 5 vendas.
3. [ ] Para cada estado de origem do vendedor, calcule a média de tempo entre a aprovação e a entrega ao cliente.
4. [ ] Crie uma métrica de “eficiência logística” por cidade do vendedor, definida como: (tempo médio entre aprovação e entrega) / (diferença de prefixos de CEP entre vendedor e cliente).
5. [ ] Liste as categorias de produto com maior valor de venda total, desconsiderando frete.
6. [ ] Para cada tipo de pagamento, calcule a média de valor por parcela (payment_value / payment_installments).
7. [ ] Calcule, para cada mês, o percentual de pedidos entregues após a data estimada.
8. [ ] Liste os clientes que fizeram pedidos com mais de um tipo de pagamento em um mesmo pedido.
9. [ ] Para cada categoria de produto, calcule a proporção de pedidos com avaliação 5 em relação ao total.
10. [ ] Identifique as 10 cidades com maior número de clientes únicos e, para cada uma, informe o ticket médio e a média de avaliações.

---

### Avançado I

11. [ ] Para cada ano, liste a categoria mais vendida em número de produtos (quantidade total de order_items).
12. [ ] Liste os pedidos com múltiplos vendedores e calcule o valor total do pedido e o número de vendedores envolvidos.
13. [ ] Para cada estado, calcule o atraso médio em dias entre a entrega ao cliente e a data estimada, considerando apenas pedidos entregues com atraso.
14. [ ] Calcule a avaliação média por categoria de produto e ordene da melhor para a pior.
15. [ ] Para cada cliente, calcule o tempo médio entre seus pedidos (considerando apenas clientes com pelo menos 3 pedidos).
16. [ ] Liste os 10 produtos com maior índice de devolução, definido como: número de avaliações com nota 1 / total de pedidos do produto.
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
