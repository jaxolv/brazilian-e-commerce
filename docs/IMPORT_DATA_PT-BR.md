Esse tutorial tem uma versão em inglês: [Read in English :us: :gb:](/docs/IMPORT_DATA.md)

## Importando o Dataset para Sua Máquina Local
Abaixo estará descrito como você pode usar esse mesmo dataset em sua máquina para:
- Testar as queries que forem atualizadas aqui;
- Você mesmo resolver os desafios descritos nesse projeto.

Usarei minha máquina (Windows 11) e PostgreSQL (PgAdmin) como SO e SGBD de referência.

**Obs.:** esse tutorial foi feito para o projeto [Brazilian E-Commerce](https://www.github.com/jaxolv/brazilian-e-commerce) mas serve para outros [repositórios feitos por mim](https://github.com/jaxolv?tab=repositories), desde que aplique as alterações necessárias.

### Requisitos
- Ter instalado o Git;
- Ter conta no Github e associá-la ao seu Git;
- Ter um SGBD instalado para banco de dados relacionais. Como já foi descrito logo acima, estarei usando PostgreSQL mas você pode usar qualquer um de sua preferência (MySQL, Oracle, SQL Server, etc);
- Criar uma database específica para importação e tratativa desses dados (para facilitar acesso, use porta e senha padrão da SGBD de sua escolha);
- Criar tabelas e montar queries nesta mesma database.
    - Se preferir, pode fazer o mesmo usando `VS Code` e concentrar tudo numa única IDE.

Com todos esses requisitos preenchidos, você poderá seguir o tutorial a seguir:

### Passo-a-passo
#### Clone o repositório na sua máquina

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

#### Encontre o arquivo `.rar` para extração dos dados

Dentro da pasta `/docs` você encontrará, além de arquivos `.md`, os arquivos compactados nos formatos `.zip` e `.rar`. Um deles terá nome `archive.zip`, que é o arquivo original da forma que foi baixado no Kaggle e esse título é padrão para todo download feito do site. Recomendo que não sejam extraídos os dados desse arquivo, a não ser que você opte por tratar os dados e criar novas tabelas com base neste.

O outro arquivo compactado terá um nome específico para o projeto. O arquivo no formato `.rar` foi tratado por mim e toda a *poluição* foi removida antes da criação das tabelas para que não houvessem conflitos com tipagem, inserção de dados e duplicidade. É desse arquivo que você deverá extrair os dados a serem importados.

Após a extração dos dados, você deverá encontrar algo parecido com esse *screenshot*:

![Imagem 1](/images/094210.png)

#### Crie todas as tabelas

Abra o arquivo `_tables.sql` e execute todas as queries lá presentes, uma de cada vez (evite executar tudo simultaneamente).

No caso deste projeto em específico a ordem da criação deve ser respeitada da seguinte forma:
- Primeiro, crie as tabelas `customers`, `sellers` e `products`
- Depois você deve criar o tipo de dado `order_status_enum` para poder criar a tabela `order`;
- De mesma forma, você deve criar o tipo de dado `payment_type_enum` para criar `order_payments`;
- Assim, você poderá criar as tabelas restantes: `order_items` e `order_reviews`.

No outro repositório, você pode criar as tabelas na ordem que quiser.

#### Popule as tabelas

Depois de criada as tabelas, você agora importará em cada uma delas todos os dados. Cada tabela está relacionada diretamente ao arquivo `.csv` de mesmo nome.

No caso de usar PostgreSQL, você deve ir ao banco de dados criado e então encontrar as tabelas que foram criadas anteriormente.

Em cada uma delas, você deve clicar com o botão direito e encontrar a opção de importar. Pode estar escrito `Import/Export Data...`, como na imagem abaixo, ou apenas `Import...`, a depender do SGBD de sua preferência. Importe na mesma ordem indicada para criar as tabelas.

![Imagem 2](/images/100627.png)

Certifique-se de que a opção de importação esteja marcada com as seguintes configurações no seu SGBD:
- Delimiter: `;`
- Quote: `"`
- Escape: `'`
- Null: ` `

Na imagem abaixo você pode ver o exemplo do PgAdmin para PostgreSQL:

![Imagem 3](/images/161603.png)

Caso tudo esteja certo, volte para a tela principal e escolha o arquivo `.csv` respectivo ao nome da tabela.

![Imagem 4](/images/161655.png)

Esse mesmo procedimento será feito para todas as demais tabelas. A tendência é de que não ocorram mais conflitos, mas caso algum erro persista, reinicie o SGBD e tente novamente.

#### Opcional: preencha o arquivo dotenv

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
    - Geralmente será usado `localhost` como padrão, mas caso não seja, informe nesta variável;
- A porta.

Tome como referência o arquivo `.env.example` para preenchimento. Depois do sinal de igualdade, não use aspas (`"`), aspas simples (`'`) ou qualquer outro formato de texto. Apenas informe o dado logo após o sinal de igualdade, conforme o exemplo abaixo:

![Imagem 5](/images/094922.png)

Caso resolva subir esse projeto no seu Github, certifique-se de estar registrado `.env` no arquivo `.gitignore` para que esses dados não subam junto ao seu repositório.
