[![Logo da Setup4D](https://setup4d.com.br/github/assets/logotransparente.png)](https://www.setup4d.com.br)

# Setup4DDao

![Delphi Supported Versions](https://img.shields.io/badge/Delphi%20Supported%20Versions-XE3..11-blue.svg)
![Platforms](https://img.shields.io/badge/Supported%20platforms-Win32%20and%20Win64-red.svg)

Bem-vindo(a) ao repositório do projeto Setup4DDao! Esta aplicação foi desenvolvida para simplificar a conexão com bancos de dados e executar operações CRUD (Create, Read, Update, Delete) de forma fácil e eficiente. Com o Setup4DDao, você pode realizar interações com bancos de dados em suas aplicações Delphi de maneira rápida, simples e confiável.

## 📐 Principais recursos

- **Conexão com bancos de dados**: Estabeleça conexões com os seguintes bancos de dados: MySQL, PostgreSQL, Firebird, SQLite e outros.
- **Operações CRUD**: Realize operações de criação, leitura, atualização e exclusão de dados de forma simples e intuitiva.
- **Consultas personalizadas**: Execute consultas personalizadas utilizando SQL para obter dados específicos do banco de dados.
- **Tratamento de erros e exceções**: A Setup4DDao oferece recursos avançados para o tratamento de erros e exceções durante as operações de banco de dados.

## 📐 Como utilizar

### ⚙️ Instalação

#### ⚡️ Automática (via boss)

* `[Optional]` Para facilitar recomendo utilizar [**Boss**](https://github.com/HashLoad/boss) (Dependency Manager for Delphi) para instalação, bastando apenas rodar o comando abaixo em um terminal  (Windows PowerShell for example):

```
boss install github.com/Setup4D/Setup4DDao
```

#### ⚡️ Manual (Delphi)

* Se você optar por instalar manualmente, basta adicionar a pasta abaixo ao seu projeto, em *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*.

```
../Setup4DDAO/src
```


### ⚙️ Pré-requisito

* O Setup4DDao possui dependência do framework [**Dataset Serialize**](https://github.com/ricksolucoes/dataset-serialize), que é um conjunto de recursos que facilita o trabalho com JSON e DataSet. Ao utilizar o [**Boss**](https://github.com/HashLoad/boss), o framework Dataset Serialize é instalado automaticamente como parte da configuração. Caso prefira instalar manualmente, você pode adicionar a pasta abaixo em seu projeto, no seguinte caminho "Project > Options > Resource Compiler > Directories and Conditionals > Include file search path" e adicione o caminho mencionado.  

```
../dataset-serialize/src
```


## 📐 Modo de uso

### ⚙️ Idioma das mensagens

#### ⚡️ Automática 

* O sistema suporta dois idiomas, com o inglês sendo o idioma padrão. No entanto, é possível utilizar o aplicativo em português do Brasil. Para isso, siga as etapas a seguir:

```
Acesse Project > Options > Delphi Compiler > Conditionals Defines
```

* Adicione a diretiva *HAS_PORTUGUES*, necessária para habilitar o idioma português do Brasil.

#### ⚡️ Personalizado

* Para personalizar mensagens em um idioma não suportado pelo sistema ou personalizar uma mensagem específica, você pode usar a classe *Setup4D.DAO.Session*. Nessa classe, estão armazenadas as seções de todas as mensagens do sistema, na opção *TSetup4DDAOSession.GetInstance.SystemMessage*.

```delphi
uses
  Setup4D.DAO.Session;

var
  FDAOSetup : TSetup4DDAOSession;

implementation

Initialization
  FDAOSetup:= TSetup4DDAOSession.GetInstance;
  FDAOSetup.SystemMessage.ConnectionError := 'Não foi fornecido o nome do banco de dados.';
  FDAOSetup.SystemMessage.QueryError := 'Não foi fornecido uma QUERY do banco de dados.';
  FDAOSetup.SystemMessage.DatabaseUndefined := 'Nenhum banco de dados foi definido.';
  FDAOSetup.SystemMessage.DatabaseNotImplemented := 'O banco de dados ainda não foi implementado no DAO.';
  FDAOSetup.SystemMessage.NoRecord := 'Nenhum registro foi encontrado.';
  FDAOSetup.SystemMessage.RequiredField := 'O campo %s é obrigatório.';
  FDAOSetup.SystemMessage.NoRecordReported := 'Nenhum registro foi fornecido.';
  FDAOSetup.SystemMessage.NoField := 'Falta o %s no registro.';
  FDAOSetup.SystemMessage.NoSelect := 'Não é possível executar o comando SELECT.';
  FDAOSetup.SystemMessage.OnlySelect := 'Esta opção permite apenas a abertura do comando SELECT.';
finalization
  FDAOSetup.ReleaseInstance;
```

### ⚙️ Configuração

#### ⚡️ Conexão com o Banco de Dados

* Após estabelecer a configuração da conexão poderá tentar executar uma conexão, e ou consultas, e ou manipular dados no banco de dados.

##### 🌱 PostgreSQL

* Para estabelecer uma conexão com o banco de dados PostgreSQL, tem que configurar a sessão. Verifique o exemplo abaixo:
```delphi
uses
  Setup4D.DAO.Session;

var
  FDAOSetup : TSetup4DDAOSession;

implementation

Initialization
  FDAOSetup:= TSetup4DDAOSession.GetInstance;
  FDAOSetup.ConnectionParam.Host := <NOME_HOST>;
  FDAOSetup.ConnectionParam.Port := <PORTA_HOST>;
  FDAOSetup.ConnectionParam.DatabaseName := <NOME_BANCO_DADOS>;
  FDAOSetup.ConnectionParam.UserName := <NOME_USUARIO>;
  FDAOSetup.ConnectionParam.Password := <SENHA_USUARIO>;

finalization
  FDAOSetup.ReleaseInstance;
```
##### 🌱 SQLite

* Para estabelecer uma conexão com o banco de dados SQLite, tem que utilizar a classe *Setup4D.DAO.Types*, para configurar o banco de dados adequadamente. Verifique o exemplo abaixo:

```delphi
uses
  Setup4D.DAO.Session,
  Setup4D.DAO.Types;

var
  FDAOSetup : TSetup4DDAOSession;

implementation

Initialization

  FDAOSetup.ConnectionParam.DatabaseName := <LOCAL_NOME_BANCO_DADOS>;
  FDAOSetup.ConnectionParam.OpenModeSQLite := <MODO_UTILIZAR>;
  FDAOSetup.ConnectionParam.LockingMode := <MODO_ABERTURA>;
  FDAOSetup.ConnectionParam.EncryptSQLite := <MODO_CRIPTOGRARFAR_BANCO_DADO>;
  FDAOSetup.ConnectionParam.Password := <SENHA_CRIPTOGRAFIA>;

finalization
  FDAOSetup.ReleaseInstance;
```

##### 🌱 ADS

* Para estabelecer uma conexão com o banco de dados DBF (através do ADS), tem que configurar a sessão. Verifique o exemplo abaixo:

```delphi
uses
  Setup4D.DAO.Session,

var
  FDAOSetup : TSetup4DDAOSession;

implementation

Initialization
  FDAOSetup:= TSetup4DDAOSession.GetInstance;
  FDAOSetup.ConnectionParam.DatabaseName := <LOCAL_BANCO_DADOS>;
finalization
  FDAOSetup.ReleaseInstance;
```

##### 🌱 FIREBIRD

* Para estabelecer uma conexão com o banco de dados DBF (através do ADS), tem que configurar a sessão. Verifique o exemplo abaixo:

```delphi
uses
  Setup4D.DAO.Session,

var
  FDAOSetup : TSetup4DDAOSession;

implementation

Initialization
  FDAOSetup:= TSetup4DDAOSession.GetInstance;
  FDAOSetup.ConnectionParam.DatabaseName := <LOCAL_BANCO_DADOS>;
finalization
  FDAOSetup.ReleaseInstance;
```
##### 🌱 MySQL

* Para estabelecer uma conexão com o banco de dados PostgreSQL, tem que configurar a sessão. Verifique o exemplo abaixo:
```delphi
uses
  Setup4D.DAO.Session;

var
  FDAOSetup : TSetup4DDAOSession;

implementation

Initialization
  FDAOSetup:= TSetup4DDAOSession.GetInstance;
  FDAOSetup.ConnectionParam.Host := <NOME_HOST>;
  FDAOSetup.ConnectionParam.Port := <PORTA_HOST>;
  FDAOSetup.ConnectionParam.DatabaseName := <NOME_BANCO_DADOS>;
  FDAOSetup.ConnectionParam.UserName := <NOME_USUARIO>;
  FDAOSetup.ConnectionParam.Password := <SENHA_USUARIO>;

finalization
  FDAOSetup.ReleaseInstance;
```

#### ⚡️ Classe

- Definir a classe que representa o banco de dados:
```delphi
uses
  Setup4D.DAO.Attribute;

type
  [TTable('Clientes')]
  TCliente = class
  private
    FID: Integer;
    FNome: string;
    FEmail: string;
    FOcultar: string;
  public
    [TField('ID'), TAutoInc, TPrimaryKey]
    property ID: Integer read FID write FID;
    [TField('NOME')]
    [TRequiredField]
    property Nome: string read FNome write FNome;
    [TField('EMAIL')]
    property Email: string read FEmail write FEmail;
    [TField('OCULTAR')]
    [TIgnoreInSelect]
    property Ocultar: string read FOcultar write FOcultar;
  end;
```
* Segue uma descrição breve dos atributo definido que existe na *Setup4D.DAO.Attribute*, que define via RTTI a configuração junto com o banco de dados para a realização do CRUD:

  - **TTableAttribute**: Atributo usado para definir a tabela do banco de dados da classe.
  - **TFieldAttribute**: Atributo usado para definir o campo do banco de dados.
  - **TIgnoreInSelect**: Atributo usado para definir que a propriedade deve ser ignorada em operações do SELECT.
  - **TIgnoreInInsert**: Atributo usado para definir que a propriedade deve ser ignorada em operações do INSERT.
  - **TIgnoreInUpdate**: Atributo usado para definir que a propriedade deve ser ignorada em operações do UPDATE.
  - **TRequiredField**: Atributo usado para definir que uma propriedade é um campo obrigatório.
  - **TPrimaryKey**: Atributo usado para definir que a propriedade é uma chave primária.
  - **TForeignKey**: Atributo usado para definir que a propriedade é uma chave estrangeira.
  - **TAutoInc**: Atributo usado para definir que a propriedade é um campo autoincrementável.

### ⚙️ DAO padrão

#### 💻 Inserir um novo registro

```delphi
uses
  Setup4D.Dao;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .GetClassData.<CAMPO_CLASSE_BANCO_DADOS>
      .Insert;
end;
```
#### 💻 Atualizar um registro existente

```delphi
uses
  Setup4D.Dao;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .GetClassData.<CAMPO_CLASSE_BANCO_DADOS>
      .Update;
end;
```

#### 💻 Excluir um registro existente

```delphi
uses
  Setup4D.Dao;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .GetClassData.<CAMPO_CLASSE_BANCO_DADOS>
      .Delete;
end;
```

#### ⚡️ Select

#####  💻 Realizar a busca de um registro pelo ID

```delphi
uses
  Setup4D.Dao;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .FindID(<ID_FILTRO>);
end;
  ```

##### 💻 Realizar operações de busca utilizando uma chave e um valor específico.

```delphi
uses
  Setup4D.Dao;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Find(<CAMPO>, <FILTRO>);
end;

  ```

##### 💻 Realizar operações de busca utilizando uma chave, valor específico e condição.

```delphi
uses
  Setup4D.Dao,
  Setup4D.DAO.Types;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Find(<CAMPO>, <FILTRO>, <TComparisonOperator>);
end;
  ```

#### 🌱 Configurações extras

- **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.ValidateWithException** é invocado para habilitar a validação com exceção;
- **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.ValidateWithException** é invocado para habilitar a validação sem exceção;
- **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.GetClassData**, é invocado para obter o objeto genérico associado ao DAO. Em seguida, o objeto retornado é atribuído ao parâmetro *Generics* do *TSetup4DDAO&lt;T&gt;*. 
- **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.GetClassList**, é invocado para obter uma lista de objetos genéricos associados ao DAO. Em seguida, a lista retornada é atribuída ao parâmetro *Generics* do *TSetup4DDAO&lt;T&gt;*. 
- **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.NoSelect**, é invocado quando o comando na exceção não é um SELECT;
- **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.OnlySelect**, é invocado quando o comando na exceção é um SELECT;
- **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.DatabaseTransactionEnabled**, permite habilitar transações no banco de dados;
- **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.DatabaseTransactionDisabled**, permite desabilitar transações no banco de dados;

### ⚙️ DAO personalizado

#### ⚡️ Comandos de personalização do SQL

- Utilizando o recurso inline do Delphi em **TSetup4DDAO&lt;TCliente&gt;.New.Custom**, é possível realizar as seguintes personalização para gerar o comando *SQL*:

  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.SQL(*&lt;comando SQL&gt;*)**, é invocado para adicionar o comando *SQL*;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.ClearSQL**, é invocado para limpar o camando *SQL* adicionado;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.Join(*&lt;comando JOIN&gt;*)**, é invocado para adcionar o camando *JOIN*;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.ClearJoin**, é invocado para limpar o comando *JOIN*;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.Where(*&lt;campo para ser filtrado>, &lt;dados do filtro&gt;*)**, é invocado para configurar uma condição. É necessário informar o campo e o filtro. Por padrão, o operador logico utilizado é o *AND* e o operador de comparação é o igual (=). É possível utilizar mais de uma condição para essa opção;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.Where(*&lt;campo para ser filtrado>, &lt;dados do filtro&gt;, &lt;sinal da operação&gt;*)**, é invocado para configurar uma condição. É necessário informar o campo e o filtro. Por padrão, o operador logico utilizado é o *AND* e o operador de comparação a ser ser definido pelo *TComparisonOperator*, que se encontra na unit *Setup4D.DAO.Types*. É possível utilizar mais de uma condição para essa opção;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.Where(*&lt;campo para ser filtrado>, &lt;dados do filtro&gt;, &lt;sinal da operação&gt;, &lt;operador logico&gt;*)**, é invocado para configurar uma condição. É necessário informar o campo e o filtro. O operador logico tem que ser definido pelo *TLogicalOperator* e o operador de comparação pelo *TComparisonOperator*, da unit *Setup4D.DAO.Types*. É possível utilizar mais de uma condição para essa opção;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.ClearWhere**, é invocado para limpar a condição;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.OrderBy(*&lt;campos para ordenação&gt;*)**, é invocado para especificar os campos pelos quais a ordenação será feita. É possível utilizar o recurso inline do Delphi para inserir mais de um campo;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.TypeOrderBy(*&lt;tipo de ordenação&gt;*)**, é invocado para definir se vai ascedente ou descedente a ordenação;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.ClearOrderBy**, é invocado para limpar a ordenação; 
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.GroupBy(*&lt;campo do agrupamentoL&gt;*)**, é invocado a para especificar os campos pelos quais o agrupamento será feita. É possível utilizar o recurso inline do Delphi para inserir mais de um campo;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.ClearGroupBy**, é invocado para limpar o agrupamento dos campos
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.Open**, é invocado para executar o comando *SELECT*
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.Execute**, é invocado para executar o comando *Insert, ou Update, ou Delete*;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.DataSet**, é invocado para retornar um *DataSet*;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.AsJSONObject**, é invocado para retornar um *TJSONObject*;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.AsJSONObjectString**, é invocado para retornar uma *string do TJSONObject*;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.AsJSONJSONArray**, é invocado para retornar um *TJSONJSONArray*;
  - **TSetup4DDAO&lt;CLASSE_BANCO_DADO&gt;.New.Custom.AsJSONJSONArrayString**, é invocado para retornar uma *string do TJSONJSONArray*;
    
##### 💻 Consultar em uma tabela do banco de dados

* Para abrir a tabela e realizar a pesquisa, é necessário utilizar o comando Open. Além disso, o SQL deve iniciar com o comando SELECT para evitar exceções.

```delphi
uses
  Setup4D.Dao;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Custom
          .ClearSQL
          .SQL(<Comando SQL>)
        .Open;
end;
```
##### 💻 Consultar uma tabela do banco de dados utilizando uma condição

```delphi
uses
  Setup4D.Dao,
  Setup4D.DAO.Types;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Custom
          .ClearSQL
          .SQL(<Comando SQL>)
          .ClearWhere
          .Where(<CAMPO_FILTRO>, <FILTRO>, <OPERADOR_COMPARAÇÃO>, <OPERADOR_LOGICO>) 
        .Open;
end;
```

```delphi
uses
  Setup4D.Dao,
  Setup4D.DAO.Types;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Custom
          .ClearSQL
          .SQL(<Comando SQL>)
          .ClearWhere
          .Where(<CAMPO_FILTRO>, <FILTRO>, <OPERADOR_COMPARAÇÃO>) 
        .Open;
end;
```

```delphi
uses
  Setup4D.Dao,
  Setup4D.DAO.Types;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Custom
          .ClearSQL
          .SQL(<Comando SQL>)
          .ClearWhere
          .Where(<CAMPO_FILTRO>, <FILTRO>) 
        .Open;
end;
```
##### 💻 Consultar uma tabela do banco de dados utilizando um agrupamento

```delphi
uses
  Setup4D.Dao;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Custom
          .ClearSQL
          .SQL(<Comando SQL>)
          .ClearGroupBy
          .GroupBy(<CAMPO_AGRUPAR>)
        .Open;
end;
```
##### 💻 Consultar uma tabela do banco de dados utilizando ordenação

```delphi
uses
  Setup4D.Dao;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Custom
          .ClearSQL
          .SQL(<Comando SQL>)
          .ClearOrderBy
          .TypeOrderBy(<TIPO_ORDENACAO>)
          .OrderBy(<CAMPOS_ORDENACAO>)
        .Open;
end;
```

##### 💻 Consultar uma tabela do banco de dados utilizando JOIN

```delphi
uses
  Setup4D.Dao;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Custom
          .ClearSQL
          .SQL(<Comando SQL>)
          .ClearJoin
          .Join(<COMANDO_JOIN>)
        .Open;
end;
```

##### 💻 Executar o Insert, ou Update, ou Delete
```delphi
uses
  Setup4D.Dao,
  Setup4D.DAO.Types;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Custom
          .ClearSQL
          .SQL(<Comando SQL>)
          .ClearWhere
          .Where(<CAMPO_FILTRO>, <FILTRO>, <OPERADOR_COMPARAÇÃO>, <OPERADOR_LOGICO>) 
        .Execute;
end;
```

```delphi
uses
  Setup4D.Dao,
  Setup4D.DAO.Types;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Custom
          .ClearSQL
          .SQL(<Comando SQL>)
          .ClearWhere
          .Where(<CAMPO_FILTRO>, <FILTRO>, <OPERADOR_COMPARAÇÃO>) 
        .Execute;
end;
```

```delphi
uses
  Setup4D.Dao,
  Setup4D.DAO.Types;

begin
  TSetup4DDAO<CLASSE_BANCO_DADOS>
    .New
      .PGDatabase //É possível realizar modificações para outro banco de dados específico do framework
        .Custom
          .ClearSQL
          .SQL(<Comando SQL>)
          .ClearWhere
          .Where(<CAMPO_FILTRO>, <FILTRO>) 
        .Execute;
end;
```

#### ⚡️ Comandos de personalização do SQL(Direto da Classe Custom)

- Também é possível utilizar o DAO Customizado diretamente **TSetup4DDAOCustom.New**, sem a necessidade de fornecer uma classe genérica, como exemplificado abaixo.

  - **TSetup4DDAOCustom.New.Query(*&lt;TFDQuery&gt;*)**, é invocado para adicionar um objeto FDQuery a ser manipulado. Caso essa informação não seja fornecida, uma exceção será lançada ao executar o Open ou o Executar. Portanto, é necessário fornecer essa informação obrigatoriamente;
  - **TSetup4DDAOCustom.New.SQL(*&lt;comando SQL&gt;*)**, é invocado para adicionar o comando *SQL*;
  - **TSetup4DDAOCustom.New.ClearSQL**, é invocado para limpar o camando *SQL* adicionado;
  - **TSetup4DDAOCustom.New.Join(*&lt;comando JOIN&gt;*)**, é invocado para adcionar o camando *JOIN*;
  - **TSetup4DDAOCustom.New.ClearJoin**, é invocado para limpar o comando *JOIN*;
  - **TSetup4DDAOCustom.New.Where(*&lt;campo para ser filtrado>, &lt;dados do filtro&gt;*)**, é invocado para configurar uma condição. É necessário informar o campo e o filtro. Por padrão, o operador logico utilizado é o *AND* e o operador de comparação é o igual (=). É possível utilizar mais de uma condição para essa opção;
  - **TSetup4DDAOCustom.New.Where(*&lt;campo para ser filtrado>, &lt;dados do filtro&gt;, &lt;sinal da operação&gt;*)**, é invocado para configurar uma condição. É necessário informar o campo e o filtro. Por padrão, o operador logico utilizado é o *AND* e o operador de comparação a ser ser definido pelo *TComparisonOperator*, que se encontra na unit *Setup4D.DAO.Types*. É possível utilizar mais de uma condição para essa opção;
  - **TSetup4DDAOCustom.New.Where(*&lt;campo para ser filtrado>, &lt;dados do filtro&gt;, &lt;sinal da operação&gt;, &lt;operador logico&gt;*)**, é invocado para configurar uma condição. É necessário informar o campo e o filtro. O operador logico tem que ser definido pelo *TLogicalOperator* e o operador de comparação pelo *TComparisonOperator*, da unit *Setup4D.DAO.Types*. É possível utilizar mais de uma condição para essa opção;
  - **TSetup4DDAOCustom.New.ClearWhere**, é invocado para limpar a condição;
  - **TSetup4DDAOCustom.New.OrderBy(*&lt;campos para ordenação&gt;*)**, é invocado para especificar os campos pelos quais a ordenação será feita. É possível utilizar o recurso inline do Delphi para inserir mais de um campo;
  - **TSetup4DDAOCustom.New.TypeOrderBy(*&lt;tipo de ordenação&gt;*)**, é invocado para definir se vai ascedente ou descedente a ordenação;
  - **TSetup4DDAOCustom.New.ClearOrderBy**, é invocado para limpar a ordenação; 
  - **TSetup4DDAOCustom.New.GroupBy(*&lt;campo do agrupamentoL&gt;*)**, é invocado a para especificar os campos pelos quais o agrupamento será feita. É possível utilizar o recurso inline do Delphi para inserir mais de um campo;
  - **TSetup4DDAOCustom.New.ClearGroupBy**, é invocado para limpar o agrupamento dos campos
  - **TSetup4DDAOCustom.New.Open**, é invocado para executar o comando *SELECT*
  - **TSetup4DDAOCustom.New.Execute**, é invocado para executar o comando *Insert, ou Update, ou Delete*;
  - **TSetup4DDAOCustom.New.DataSet**, é invocado para retornar um *DataSet*;
  - **TSetup4DDAOCustom.New.AsJSONObject**, é invocado para retornar um *TJSONObject*;
  - **TSetup4DDAOCustom.New.AsJSONObjectString**, é invocado para retornar uma *string do TJSONObject*;
  - **TSetup4DDAOCustom.New.AsJSONJSONArray**, é invocado para retornar um *TJSONJSONArray*;
  - **TSetup4DDAOCustom.New.AsJSONJSONArrayString**, é invocado para retornar uma *string do TJSONJSONArray*;
  - **TSetup4DDAOCustom.New.Finish**, é invocado para conclui a configuração customizada e retorna para instância padrão do *TSetup4DDAO*;
    
##### 💻 Consultar em uma tabela do banco de dados

```delphi
uses
  Setup4D.DAO.Custom;

begin
  // É necessário fornecer um objeto TFDQuery previamente criado 
  // e instanciado na conexãocom o banco de dados para executar o comando SQL. 
  // Ao final, é importante destruir o objeto para evitar vazamentos de memória.
  TSetup4DDAOCustom  
    .New
      .Query(<OBJETO_FDQuery>) 
          .ClearSQL
          .SQL(<Comando SQL>)
        .Open;
end;
```

##### 💻 Consultar uma tabela do banco de dados utilizando uma condição

```delphi
uses
  Setup4D.DAO.Custom,
  Setup4D.DAO.Types;

begin
  // É necessário fornecer um objeto TFDQuery previamente criado 
  // e instanciado na conexãocom o banco de dados para executar o comando SQL. 
  // Ao final, é importante destruir o objeto para evitar vazamentos de memória.
  TSetup4DDAOCustom  
    .New
      .Query(<OBJETO_FDQuery>) 
        .ClearSQL
        .SQL(<Comando SQL>)
        .ClearWhere
        .Where(<CAMPO_FILTRO>, <FILTRO>, <OPERADOR_COMPARAÇÃO>, <OPERADOR_LOGICO>); 
      .Open;
end;
```

```delphi
uses
  Setup4D.DAO.Custom,
  Setup4D.DAO.Types;

begin
  // É necessário fornecer um objeto TFDQuery previamente criado 
  // e instanciado na conexãocom o banco de dados para executar o comando SQL. 
  // Ao final, é importante destruir o objeto para evitar vazamentos de memória.
  TSetup4DDAOCustom  
    .New
      .Query(<OBJETO_FDQuery>) 
        .ClearSQL
        .SQL(<Comando SQL>)
        .ClearWhere
        .Where(<CAMPO_FILTRO>, <FILTRO>, <OPERADOR_COMPARAÇÃO>); 
      .Open;
end;
```

```delphi
uses
  Setup4D.DAO.Custom,
  Setup4D.DAO.Types;

begin
  // É necessário fornecer um objeto TFDQuery previamente criado 
  // e instanciado na conexãocom o banco de dados para executar o comando SQL. 
  // Ao final, é importante destruir o objeto para evitar vazamentos de memória.
  TSetup4DDAOCustom  
    .New
      .Query(<OBJETO_FDQuery>) 
        .ClearSQL
        .SQL(<Comando SQL>)
        .ClearWhere
        .Where(<CAMPO_FILTRO>, <FILTRO>); 
      .Open;
end;
```
##### 💻 Consultar uma tabela do banco de dados utilizando um agrupamento

```delphi
uses
  Setup4D.Dao.Custom;

begin
  // É necessário fornecer um objeto TFDQuery previamente criado 
  // e instanciado na conexãocom o banco de dados para executar o comando SQL. 
  // Ao final, é importante destruir o objeto para evitar vazamentos de memória.
  TSetup4DDAOCustom  
    .New
      .Query(<OBJETO_FDQuery>) 
        .ClearSQL
        .SQL(<Comando SQL>)
        .ClearGroupBy
        .GroupBy(<CAMPO_AGRUPAR>)
      .Open;
end;
```
##### 💻 Consultar uma tabela do banco de dados utilizando ordenação

```delphi
uses
  Setup4D.Dao.Custom;

begin
  // É necessário fornecer um objeto TFDQuery previamente criado 
  // e instanciado na conexãocom o banco de dados para executar o comando SQL. 
  // Ao final, é importante destruir o objeto para evitar vazamentos de memória.
  TSetup4DDAOCustom  
    .New
      .Query(<OBJETO_FDQuery>) 
        .ClearSQL
        .SQL(<Comando SQL>)
        .ClearOrderBy
        .TypeOrderBy(<TIPO_ORDENACAO>)
        .OrderBy(<CAMPOS_ORDENACAO>)
      .Open;
end;
```
##### 💻 Consultar uma tabela do banco de dados utilizando JOIN

```delphi
uses
  Setup4D.Dao.Custom;

begin
  // É necessário fornecer um objeto TFDQuery previamente criado 
  // e instanciado na conexãocom o banco de dados para executar o comando SQL. 
  // Ao final, é importante destruir o objeto para evitar vazamentos de memória.
  TSetup4DDAOCustom  
    .New
      .Query(<OBJETO_FDQuery>) 
        .ClearSQL
        .SQL(<Comando SQL>)
        .ClearJoin
        .Join(<COMANDO_JOIN>)
      .Open;
end;
```

##### 💻 Executar o Insert, ou Update, ou Delete

```delphi
uses
  Setup4D.DAO.Custom,
  Setup4D.DAO.Types;

begin
  // É necessário fornecer um objeto TFDQuery previamente criado 
  // e instanciado na conexãocom o banco de dados para executar o comando SQL. 
  // Ao final, é importante destruir o objeto para evitar vazamentos de memória.
  TSetup4DDAOCustom  
    .New
      .Query(<OBJETO_FDQuery>) 
        .ClearSQL
        .SQL(<Comando SQL>)
        .ClearWhere
        .Where(<CAMPO_FILTRO>, <FILTRO>, <OPERADOR_COMPARAÇÃO>, <OPERADOR_LOGICO>); 
      .Execute;
end;
```

```delphi
uses
  Setup4D.DAO.Custom,
  Setup4D.DAO.Types;

begin
  // É necessário fornecer um objeto TFDQuery previamente criado 
  // e instanciado na conexãocom o banco de dados para executar o comando SQL. 
  // Ao final, é importante destruir o objeto para evitar vazamentos de memória.
  TSetup4DDAOCustom  
    .New
      .Query(<OBJETO_FDQuery>) 
        .ClearSQL
        .SQL(<Comando SQL>)
        .ClearWhere
        .Where(<CAMPO_FILTRO>, <FILTRO>, <OPERADOR_COMPARAÇÃO>); 
      .Execute;
end;
```

```delphi
uses
  Setup4D.DAO.Custom,
  Setup4D.DAO.Types;

begin
  // É necessário fornecer um objeto TFDQuery previamente criado 
  // e instanciado na conexãocom o banco de dados para executar o comando SQL. 
  // Ao final, é importante destruir o objeto para evitar vazamentos de memória.
  TSetup4DDAOCustom  
    .New
      .Query(<OBJETO_FDQuery>) 
        .ClearSQL
        .SQL(<Comando SQL>)
        .ClearWhere
        .Where(<CAMPO_FILTRO>, <FILTRO>); 
      .Execute;
end;
```
