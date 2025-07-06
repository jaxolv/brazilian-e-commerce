## Importando o Dataset para Sua Máquina Local
Abaixo estará descrito como você pode usar esse mesmo dataset em sua máquina para:
- Testar as queries que forem atualizadas aqui;
- Você mesmo resolver os desafios descritos nesse projeto.

Usarei minha máquina (Windows 11) e PostgreSQL (PgAdmin) como SO e SGBD de referência.

### Requisitos
- Ter instalado o Git;
- Ter conta no Github e associá-la ao seu Git;
- Ter um SGBD instalado para banco de dados relacionais. Como já foi descrito logo acima, estarei usando PostgreSQL mas você pode usar qualquer um de sua preferência (MySQL, Oracle, SQL Server, etc);
- Criar uma database específica para importação e tratativa desses dados (para facilitar acesso, use porta e senha padrão da SGBD de sua escolha);
- Criar tabelas e montar queries nesta mesma database.
    - Se preferir, pode fazer o mesmo usando `VS Code` e concentrar tudo numa única IDE.

Com todos esses requisitos preenchidos, você poderá seguir o tutorial a seguir:

### Passo-a-passo

**1. Clone o repositório na sua máquina**

Após criar/encontrar o diretório que deseja usar para este repositório, abra um terminal de comando e baixe o projeto na sua máquina local:

Clone este repositório:
```
git clone https://github.com/jaxolv/brazilian-e-commerce
```
Entre na pasta criada:
```
cd brazilian-e-commerce
```

Caso o repositório seja outro, apenas substitua os links e o nome da pasta criada.

**2. Encontre o arquivo `.rar` para extração dos dados**

O arquivo `brazilian_e-commerce_dataset.rar` estará dentro da pasta `/docs` no repositório.

Clique com o botão direito do seu cursor e depois em `Extrair tudo...`. Você terá uma pasta com os seguintes arquivos conforme esta imagem abaixo onde um deles é no formato `.sql` e os demais no formato `.csv`:

![Imagem 1](/images/094210.png)

**3. Crie todas as tabelas**

Abra o arquivo `_tables.sql` e execute todas as queries lá presentes, uma de cada vez (evite executar tudo simultaneamente). Mas atente-se à ordem:

- Primeiro, crie as tabelas `customers`, `sellers` e `products`
- Depois você deve criar o tipo de dado `order_status_enum` para poder criar a tabela `order`;
- De mesma forma, você deve criar o tipo de dado `payment_type_enum` para criar `order_payments`;
- Assim, você poderá criar as tabelas restantes: `order_items` e `order_reviews`.

**4. Popule as tabelas**

Depois de criada as tabelas, você agora importará em cada uma delas todos os dados. Cada tabela está relacionada diretamente ao arquivo `.csv` de mesmo nome. Ou seja, serão feitas oito importações diferentes.

No caso de usar PostgreSQL, você deve ir ao banco de dados criado e então encontrar as tabelas que foram criadas anteriormente.

Em cada uma delas, você deve clicar com o botão direito e encontrar a opção de importar. Pode estar escrito `Import/Export Data...`, como na imagem abaixo, ou apenas `Import...`, a depender do SGBD de sua preferência.

![Imagem 2](/images\100627.png)

Certifique-se de que a opção de importação esteja marcada com as seguintes configurações no seu SGBD:
- Delimiter: `;`
- Quote: `"`
- Escape: `'`
- Null: ` `
Na imagem abaixo você pode ver o exemplo do PgAdmin para PostgreSQL:

![Imagem 3](/images/161603.png)

Caso tudo esteja certo, volte para a tela principal e escolha o arquivo `.csv` respectivo ao nome da tabela.

![Imagem 4](/images/161655.png)

Esse mesmo procedimento será feito para todas as demais tabelas. Como os dados foram tratados anteriormente para que pudessem ser importados sem conflitos, a tendência é de que não ocorram mais erros. Caso algum erro persista, reinicie o SGBD e tente novamente.

**Opcional: preencha o arquivo dotenv**

Esse passo é essencial para que seja possível criar arquivos `.csv` a partir dos scripts em Python e então montar dashboards.

Para isso, você deverá primeiramente instalar os pacotes presentes no arquivo `requirements.txt`.

Abra o terminal, certifique-se de estar no diretório principal do projeto e que a linguagem Python está instalada na sua máquina. Quando tudo estiver certo, rode a seguinte linha de código:
```
pip install -r requirements.txt
```

Então, informe no arquivo `.env` presente no diretório principal do projeto os seguintes dados:
- O nome da database;
- O user;
- A senha;
- O host:
    - Geralmente será usado `localhost` como padrão, mas caso não seja, informe aqui;
- A porta.

Tome como referência o arquivo `.env.example` para preenchimento. Depois do sinal de igualdade, não use aspas (`"`), aspas simples (`'`) ou qualquer outro formato de texto. Apenas informe o dado logo após o sinal de igualdade, conforme o exemplo abaixo:

![Imagem 5](/images/094922.png)

Caso resolva subir esse projeto no seu Github, certifique-se de estar registrado `.env` no arquivo `.gitignore` para que esses dados não subam junto ao seu repositório.
