{*******************************************************}
{                                                       }
{           DAO runtime library in pascal               }
{                   DAO Interface                       }
{                                                       }
{                                                       }
{             Copyright(c) 2010-2023                    }
{      Setup4D Consulting & Development,  Inc.          }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit Setup4D.DAO.Interf;

interface

uses
  Setup4D.DAO.Types,

  Data.DB,
  FireDAC.Comp.Client,

  System.JSON,
  System.Generics.Collections;
type
  ISetup4DDAOCustom<T: Class> = interface;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface responsável por definir os métodos disponíveis para um DAO genérico.
  /// </summary>
  /// <typeparam name="T">
  /// O tipo de classe associado ao DAO.
  /// </typeparam>
  {$ELSE}
  /// <summary>
  /// Interface responsible for defining the methods available for a generic DAO.
  /// </summary>
  /// <typeparam name="T">
  /// The class type associated with the DAO.
  /// </typeparam>
  {$ENDIF}
  ISetup4DDAO<T: Class> = interface
    ['{BA984459-1886-419F-9CAB-263E8E524676}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna uma nova instância do DAO com uma configuração do
    /// banco de dados PostgreSQL.
    /// </summary>
    /// <returns>
    /// A instância de ISetup4DDAO<T> com a configuração do
    /// banco de dados PostgreSQL.</returns>
    /// <remarks>
    /// Este método configura o DAO para usar um banco de dados PostgreSQL
    /// para operações de acesso aos dados.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns a new instance of the DAO with a PostgreSQL database configuration.
    /// </summary>
    /// <returns>The instance of ISetup4DDAO<T> with the PostgreSQL database configuration.</returns>
    /// <remarks>
    /// This method configures the DAO to use a PostgreSQL database for data access operations.
    /// </remarks>
    {$ENDIF}
    function PGDatabase: ISetup4DDAO<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configura o DAO para realizar validação com exceções.
    /// </summary>
    /// <returns>
    /// A instância de ISetup4DDAO<T> com validação usando exceções.
    /// </returns>
    /// <remarks>
    /// Este método configura o DAO para realizar validação de dados e
    /// lança exceções se a validação falhar.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Configures the DAO to perform validation with exceptions.
    /// </summary>
    /// <returns>The instance of ISetup4DDAO<T> with validation using exceptions.</returns>
    /// <remarks>
    /// This method sets up the DAO to perform data validation and throw exceptions if validation fails.
    /// </remarks>
    {$ENDIF}
    function ValidateWithException: ISetup4DDAO<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configura o DAO para realizar validação sem exceções.
    /// </summary>
    /// <returns>
    /// A instância de ISetup4DDAO<T> com validação sem exceções.
    /// </returns>
    /// <remarks>
    /// Este método configura o DAO para realizar validação de dados e
    /// não lança exceções.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Configures the DAO to perform validation without exceptions.
    /// </summary>
    /// <returns>The instance of ISetup4DDAO<T> with validation without exceptions.</returns>
    /// <remarks>
    /// This method sets up the DAO to perform data validation and return error codes or messages instead of throwing exceptions.
    /// </remarks>
    {$ENDIF}
    function NoValidateWithException: ISetup4DDAO<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Localiza um registro no banco de dados pelo valor inteiro
    /// do ID especificado.
    /// </summary>
    /// <param name="AValue">
    /// O valor do ID a ser pesquisado.
    /// </param>
    /// <returns>
    /// A instância de ISetup4DDAO<T> com o filtro de valor ID especificado.
    /// </returns>
    /// <remarks>
    /// Este método configura o DAO para filtrar registros pelo valor
    /// inteiro do ID especificado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finds a record in the database by the specified integer ID value.
    /// </summary>
    /// <param name="AValue">The ID value to search for.</param>
    /// <returns>The instance of ISetup4DDAO<T> with the specified ID value filter.</returns>
    /// <remarks>
    /// This method sets up the DAO to filter records by the specified integer ID value.
    /// </remarks>
    {$ENDIF}
    function FindID(AValue: Integer): ISetup4DDAO<T>; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Localiza um registro no banco de dados pelo valor de ID inteiro
    /// de 64 bits especificado.
    /// </summary>
    /// <param name="AValue">
    /// O valor do ID a ser pesquisado.
    /// </param>
    /// <returns>
    /// A instância de ISetup4DDAO<T> com o filtro de valor ID especificado.
    /// </returns>
    /// <remarks>
    /// Este método configura o DAO para filtrar registros pelo valor
    /// inteiro do ID especificado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finds a record in the database by the specified 64-bit integer ID value.
    /// </summary>
    /// <param name="AValue">The ID value to search for.</param>
    /// <returns>The instance of ISetup4DDAO<T> with the specified ID value filter.</returns>
    /// <remarks>
    /// This method sets up the DAO to filter records by the specified 64-bit integer ID value.
    /// </remarks>
    {$ENDIF}
    function FindID(AValue: Int64): ISetup4DDAO<T>; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Localiza um registro no banco de dados pelo valor de
    /// ID string especificado.
    /// </summary>
    /// <param name="AValue">
    /// O valor do ID a ser pesquisado.
    /// </param>
    /// <returns>
    /// A instância de ISetup4DDAO<T> com o filtro de valor ID especificado.
    /// </returns>
    /// <remarks>
    /// Este método configura o DAO para filtrar registros pelo valor
    /// inteiro do ID especificado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finds a record in the database by the specified string ID value.
    /// </summary>
    /// <param name="AValue">The ID value to search for.</param>
    /// <returns>The instance of ISetup4DDAO<T> with the specified ID value filter.</returns>
    /// <remarks>
    /// This method sets up the DAO to filter records by the specified string ID value.
    /// </remarks>
    {$ENDIF}
    function FindID(AValue: string): ISetup4DDAO<T>; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Localiza registros na fonte de dados com base na chave e
    /// valor especificados, utilizando um símbolo de comparação opcional.
    /// </summary>
    /// <param name="AKey">
    /// A chave para buscar registros.
    /// </param>
    /// <param name="AValue">
    /// O valor a ser comparado.
    /// </param>
    /// <param name="ASymbol">
    /// O símbolo de comparação a ser utilizado (opcional).
    /// O valor padrão é TComparisonOperator.Equal ("=").
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAO<T> contendo os registros encontrados.
    /// </returns>
    /// <remarks>
    /// Este método permite buscar registros na fonte de dados com base em uma
    /// chave e valor especificados.
    /// É possível definir um símbolo de comparação para controlar o tipo
    /// de comparação a ser realizada.
    /// Por padrão, o símbolo de comparação utilizado é TComparisonOperator.Equal ("="),
    /// que realiza uma comparação de igualdade.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finds records in the data source based on the specified key and value, using an optional comparison symbol.
    /// </summary>
    /// <param name="AKey">The key to search for records.</param>
    /// <param name="AValue">The value to compare.</param>
    /// <param name="AComparision">The comparison symbol to use (optional). The default value is TComparisonOperator.Equal.</param>
    /// <returns>An instance of ISetup4DDAO<T> containing the found records.</returns>
    /// <remarks>
    /// This method allows you to search for records in the data source based on a specified key and value.
    /// You can define a comparison symbol to control the type of comparison to be performed.
    /// By default, the comparison symbol used is TComparisonOperator.Equal, which performs an equality comparison.
    /// </remarks>
    {$ENDIF}
    function Find(AKey: string; AValue: Variant;
      AComparison: TComparisonOperator = TComparisonOperator.Equal): ISetup4DDAO<T>; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Insere os dados da classe no banco de dados.
    /// </summary>
    /// <returns>
    /// Uma interface para o DAO atualizado após a inserção.
    /// </returns>
    /// <remarks>
    /// Este método insere os dados da classe no banco de dados associado ao DAO.
    /// Após a inserção, o DAO é atualizado com os dados inseridos e retornado como resultado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Inserts the class data into the database.
    /// </summary>
    /// <returns>
    /// An interface to the DAO updated after the insertion.
    /// </returns>
    /// <remarks>
    /// This method inserts the class data into the database associated with the DAO.
    /// After the insertion, the DAO is updated with the inserted data and returned as a result.
    /// </remarks>
    {$ENDIF}
    function Insert: ISetup4DDAO<T>;
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Atualiza os dados da classe no banco de dados.
    /// </summary>
    /// <returns>
    /// Uma interface para o DAO atualizado após a atualização.
    /// </returns>
    /// <remarks>
    /// Este método atualiza os dados da classe no banco de dados associado ao DAO.
    /// Após a atualização, o DAO é atualizado com os dados atualizados e retornado como resultado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Updates the class data in the database.
    /// </summary>
    /// <returns>
    /// An interface to the updated DAO after the update.
    /// </returns>
    /// <remarks>
    /// This method updates the class data in the database associated with the DAO.
    /// After the update, the DAO is updated with the updated data and returned as a result.
    /// </remarks>
    {$ENDIF}
    function Update: ISetup4DDAO<T>; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Exclui os dados da classe do banco de dados.
    /// </summary>
    /// <returns>
    /// Uma interface para o DAO após a exclusão.
    /// </returns>
    /// <remarks>
    /// Este método exclui os dados da classe do banco de dados associado ao DAO.
    /// Após a exclusão, o DAO é retornado como resultado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Deletes the class data from the database.
    /// </summary>
    /// <returns>
    /// An interface to the DAO after the deletion.
    /// </returns>
    /// <remarks>
    /// This method deletes the class data from the database associated with the DAO.
    /// After the deletion, the DAO is returned as a result.
    /// </remarks>
    {$ENDIF}
    function Delete: ISetup4DDAO<T>; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna os dados da classe associados ao DAO.
    /// </summary>
    /// <returns>
    /// Os dados da classe associados ao DAO.
    /// </returns>
    /// <remarks>
    /// Este método retorna os dados da classe associados ao DAO,
    /// que podem ser usados para manipulação ou análise de dados adicionais.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns the class data associated with the DAO.
    /// </summary>
    /// <returns>The class data associated with the DAO.</returns>
    /// <remarks>
    /// This method returns the class data associated with the DAO, which can be used for additional data manipulation or analysis.
    /// </remarks>
    {$ENDIF}
    function GetClassData: T;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna uma lista de objetos da classe associada ao DAO.
    /// </summary>
    /// <returns>
    /// Uma instância de TObjectList<T> contendo os objetos da classe.
    /// </returns>
    /// <remarks>
    /// Este método retorna uma lista de objetos da classe associada ao DAO.
    /// A lista contém os objetos que foram carregados ou manipulados através do DAO.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns a list of objects of the class associated with the DAO.
    /// </summary>
    /// <returns>An instance of TObjectList<T> containing the objects of the class.</returns>
    /// <remarks>
    /// This method returns a list of objects of the class associated with the DAO.
    /// The list contains the objects that have been loaded or manipulated through the DAO.
    /// </remarks>
    {$ENDIF}
    function GetClassList: TObjectList<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna uma interface para personalização do DAO.
    /// </summary>
    /// <returns>
    /// Uma interface para personalização do DAO.
    /// </returns>
    /// <remarks>
    /// Este método retorna uma interface que permite a personalização do DAO.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns an interface for customizing the DAO.
    /// </summary>
    /// <returns>
    /// An interface for customizing the DAO.
    /// </returns>
    /// <remarks>
    /// This method returns an interface that allows customization of the DAO.
    /// </remarks>
    {$ENDIF}
    function Custom: ISetup4DDAOCustom<T>;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface usada para definir as operações de configuração personalizada para a classe DAO.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface used to define custom configuration operations for the DAO class.
  /// </summary>
  {$ENDIF}
  ISetup4DDAOCustom<T: Class> = interface
    ['{2150B1F7-D781-4AA7-810F-2442586FB526}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Finaliza a personalização do DAO.
    /// </summary>
    /// <returns>
    /// Uma interface para o DAO após a personalização.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a personalização do DAO e retorna o DAO como resultado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finishes customizing the DAO.
    /// </summary>
    /// <returns>
    /// An interface to the DAO after customization.
    /// </returns>
    /// <remarks>
    /// This method finishes customizing the DAO and returns the DAO as a result.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DDAO<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa uma consulta SQL com o valor especificado.
    /// </summary>
    /// <param name="AValue">
    /// O valor da consulta SQL
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> que representa a consulta SQL
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Run an SQL query with the specified value.
    /// </summary>
    /// <param name="AValue">
    /// The value of the SQL query
    /// </param>
    /// <returns>
    /// An instance of ISetup4DDAOCustom<T> representing the SQL query
    /// </returns>
    {$ENDIF}
    function SQL(Const AValue: string): ISetup4DDAOCustom<T>; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa a consulta SQL atual.
    /// </summary>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> sem consulta SQL definida
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Clears the current SQL query.
    /// </summary>
    /// <returns>
    /// An instance of ISetup4DDAOCustom<T> without a defined SQL query
    /// </returns>
    {$ENDIF}
    function ClearSQL: ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Adiciona uma cláusula JOIN à consulta SQL com o valor especificado.
    /// </summary>
    /// <param name="AValue">
    /// O valor da cláusula JOIN
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> com a cláusula JOIN adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds a JOIN clause to the SQL query with the specified value.
    /// </summary>
    /// <param name="AValue">The value of the JOIN clause</param>
    /// <returns>An instance of ISetup4DDAOCustom<T> with the JOIN clause added</returns>
    {$ENDIF}
    function Join(Const AValue: String): ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa a cláusula JOIN da consulta SQL atual.
    /// </summary>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> sem cláusula JOIN definida
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Clears the JOIN clause of the current SQL query.
    /// </summary>
    /// <returns>An instance of ISetup4DDAOCustom<T> without a defined JOIN clause</returns>
    {$ENDIF}
    function ClearJoin: ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Adiciona uma cláusula WHERE à consulta SQL com a chave, valor e condição especificados.
    /// </summary>
    /// <param name="AKey">
    /// A chave da cláusula WHERE
    /// </param>
    /// <param name="AValue">
    /// O valor da cláusula WHERE
    /// </param>
    /// <param name="ACondition">
    /// A condição da cláusula WHERE
    /// </param>
    /// <param name="AOperator">
    /// Operador lógico da cláusula WHERE
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> com a cláusula WHERE adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds a WHERE clause to the SQL query with the specified key, value, and condition.
    /// </summary>
    /// <param name="AKey">The key of the WHERE clause</param>
    /// <param name="AValue">The value of the WHERE clause</param>
    /// <param name="AComparision">The condition of the WHERE clause</param>
    /// <param name="AOperator"> Logical operator of the WHERE clause</param>
    /// <returns>An instance of ISetup4DDAOCustom<T> with the WHERE clause added</returns>
    {$ENDIF}
    function Where(Const AKey: String; Const AValue: Variant;
      AComparison: TComparisonOperator;
      AOperator: TLogicalOperator): ISetup4DDAOCustom<T>; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Adiciona uma cláusula WHERE à consulta SQL com a chave, valor e condição especificados.
    /// </summary>
    /// <param name="AKey">
    /// A chave da cláusula WHERE
    /// </param>
    /// <param name="AValue">
    /// O valor da cláusula WHERE
    /// </param>
    /// <param name="ACondition">
    /// A condição da cláusula WHERE
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> com a cláusula WHERE adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds a WHERE clause to the SQL query with the specified key, value, and condition.
    /// </summary>
    /// <param name="AKey">The key of the WHERE clause</param>
    /// <param name="AValue">The value of the WHERE clause</param>
    /// <param name="AComparision">The condition of the WHERE clause</param>
    /// <returns>An instance of ISetup4DDAOCustom<T> with the WHERE clause added</returns>
    {$ENDIF}
    function Where(Const AKey: String; Const AValue: Variant;
      Const AComparison: TComparisonOperator): ISetup4DDAOCustom<T>; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Adiciona uma cláusula WHERE à consulta SQL com a chave, valor e condição especificados.
    /// </summary>
    /// <param name="AKey">
    /// A chave da cláusula WHERE
    /// </param>
    /// <param name="AValue">
    /// O valor da cláusula WHERE
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> com a cláusula WHERE adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds a WHERE clause to the SQL query with the specified key, value, and condition.
    /// </summary>
    /// <param name="AKey">The key of the WHERE clause</param>
    /// <param name="AValue">The value of the WHERE clause</param>
    /// <returns>An instance of ISetup4DDAOCustom<T> with the WHERE clause added</returns>
    {$ENDIF}
    function Where(Const AKey: String; Const AValue: Variant): ISetup4DDAOCustom<T>; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa a cláusula WHERE da consulta SQL atual.
    /// </summary>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> sem cláusula WHERE definida
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Clears the WHERE clause of the current SQL query.
    /// </summary>
    /// <returns>An instance of ISetup4DDAOCustom<T> without a defined WHERE clause</returns>
    {$ENDIF}
    function ClearWhere: ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Adiciona uma cláusula ORDER BY à consulta SQL com os campos especificado.
    /// </summary>
    /// <param name="AValue">
    /// Os campos do ORDER BY
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> com a cláusula ORDER BY adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds an ORDER BY clause to the SQL query with the specified fields.
    /// </summary>
    /// <param name="AValue">
    /// The ORDER BY fields
    /// </param>
    /// <returns>
    /// An instance of ISetup4DDAOCustom<T> with added ORDER BY clause
    /// </returns>
    {$ENDIF}
    function OrderBy(Const AValue: string): ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o tipo de ordenação da cláusula ORDER BY para a consulta SQL.
    /// </summary>
    /// <param name="AValue">
    /// O tipo de ordenação da cláusula ORDER BY
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> com o tipo de ordenação definido
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the ordering type of the ORDER BY clause for the SQL query.
    /// </summary>
    /// <param name="AValue">The ordering type of the ORDER BY clause</param>
    /// <returns>An instance of ISetup4DDAOCustom<T> with the ordering type set</returns>
    {$ENDIF}
    function TypeOrderBy(AValue: TOrderBy): ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa a cláusula ORDER BY da consulta SQL atual.
    /// </summary>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> sem cláusula ORDER BY definida
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Clears the ORDER BY clause of the current SQL query.
    /// </summary>
    /// <returns>An instance of ISetup4DDAOCustom<T> without a defined ORDER BY clause</returns>
    {$ENDIF}
    function ClearOrderBy: ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Adiciona uma cláusula GROUP BY à consulta SQL com os campos especificado.
    /// </summary>
    /// <param name="AValue">
    /// Os campos do GROUP BY
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> com a cláusula GROUP BY adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds a GROUP BY clause to the SQL query with the specified fields.
    /// </summary>
    /// <param name="AValue">
    /// The GROUP BY fields
    /// </param>
    /// <returns>
    /// An instance of ISetup4DDAOCustom<T> with the added GROUP BY clause
    /// </returns>
    {$ENDIF}
    function GroupBy(AValue: string): ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa a cláusula GROUP BY da consulta SQL atual.
    /// </summary>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> sem cláusula GROUP BY definida
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Clears the GROUP BY clause of the current SQL query.
    /// </summary>
    /// <returns>An instance of ISetup4DDAOCustom<T> without a defined GROUP BY clause</returns>
    {$ENDIF}
    function ClearGroupBy: ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa o comando da query (SELECT).
    /// </summary>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> com a consulta SQL aberta
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Execute the query command (SELECT).
    /// </summary>
    /// <returns>
    /// An instance of ISetup4DDAOCustom<T> with the open SQL query
    /// </returns>
    {$ENDIF}
    function Open: ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa o comando da query (INSERT ou UPDATE ou DELETE).
    /// </summary>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom<T> com a consulta SQL aberta
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Execute the query command (INSERT or UPDATE or DELETE).
    /// </summary>
    /// <returns>
    /// An instance of ISetup4DDAOCustom<T> with the open SQL query
    /// </returns>
    {$ENDIF}
    function Execute: ISetup4DDAOCustom<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna o conjunto de dados resultante da consulta SQL.
    /// </summary>
    /// <returns>
    /// Um objeto TDataSet contendo o conjunto de dados resultante
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Returns the dataset resulting from the SQL query.
    /// </summary>
    /// <returns>A TDataSet object containing the resulting dataset</returns>
    {$ENDIF}
    function DataSet: TDataSet;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna o objeto TJSONObject correspondente ao resultado da consulta SQL.
    /// </summary>
    /// <returns>
    /// O objeto TJSONObject correspondente ao resultado da consulta SQL
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Returns the TJSONObject object corresponding to the result of the SQL query.
    /// </summary>
    /// <returns>The TJSONObject object corresponding to the result of the SQL query</returns>
    {$ENDIF}
    function AsJSONObject: TJSONObject;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna a representação em string do objeto TJSONObject
    /// correspondente ao resultado da consulta SQL.
    /// </summary>
    /// <returns>
    /// A representação em string do objeto TJSONObject correspondente
    /// ao resultado da consulta SQL
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Returns the string representation of the TJSONObject object corresponding to the result of the SQL query.
    /// </summary>
    /// <returns>The string representation of the TJSONObject object corresponding to the result of the SQL query</returns>
    {$ENDIF}
    function AsJSONObjectString: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna o objeto TJSONArray correspondente ao resultado da consulta SQL.
    /// </summary>
    /// <returns>
    /// O objeto TJSONArray correspondente ao resultado da consulta SQL
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Returns the TJSONArray object corresponding to the result of the SQL query.
    /// </summary>
    /// <returns>The TJSONArray object corresponding to the result of the SQL query</returns>
    {$ENDIF}
    function AsJSONJSONArray: TJSONArray;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna a representação em string do objeto TJSONArray
    /// correspondente ao resultado da consulta SQL.
    /// </summary>
    /// <returns>
    /// A representação em string do objeto TJSONArray correspondente
    /// ao resultado da consulta SQL
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Returns the string representation of the TJSONArray object corresponding to the result of the SQL query.
    /// </summary>
    /// <returns>The string representation of the TJSONArray object corresponding to the result of the SQL query</returns>
    {$ENDIF}
    function AsJSONJSONArrayString: string;
  end;


  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface responsável por definir os métodos disponíveis para conexão com o banco de dados
  /// em um DAO genérico.
  /// </summary>
  /// <typeparam name="T">
  /// O tipo de classe associado ao DAO.
  /// </typeparam>
  {$ELSE}
  /// <summary>
  /// Interface responsible for defining the methods available for database connection
  /// in a generic DAO.
  /// </summary>
  /// <typeparam name="T">
  /// The class type associated with the DAO.
  /// </typeparam>
  {$ENDIF}
  ISetup4DDAOConnection<T: Class> = interface
    ['{5DD8773E-5170-4184-9FC1-7C1DF7DAFC5F}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o tipo de banco de dados a ser utilizado na conexão do DAO.
    /// </summary>
    /// <param name="AValue">
    /// O tipo de banco de dados.
    /// </param>
    /// <returns>
    /// A instância do objeto de conexão do DAO.
    /// </returns>
    /// <remarks>
    /// Este método permite definir o tipo de banco de dados a ser utilizado na conexão do DAO,
    /// fornecendo uma forma de configurar a conexão de acordo com o banco de dados específico.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Sets the type of database to be used in the DAO connection.
    /// </summary>
    /// <param name="AValue">The type of database.</param>
    /// <returns>The instance of the DAO connection object.</returns>
    /// <remarks>
    /// This method allows setting the type of database to be used in the DAO connection,
    /// providing a way to configure the connection according to the specific database.
    /// </remarks>
    {$ENDIF}
    function SetDataBase(const AValue: TDatabaseTypes): ISetup4DDAOConnection<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto de conexão associado ao DAO.
    /// </summary>
    /// <returns>
    /// O objeto de conexão associado ao DAO.
    /// </returns>
    /// <remarks>
    /// Este método retorna o objeto de conexão associado ao DAO,
    /// que pode ser usado para realizar operações e transações no banco de dados.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Retrieves the connection object associated with the DAO.
    /// </summary>
    /// <returns>The connection object associated with the DAO.</returns>
    /// <remarks>
    /// This method returns the connection object associated with the DAO,
    /// which can be used to perform database operations and transactions.
    /// </remarks>
    {$ENDIF}
    function GetConnection: TFDConnection;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto de consulta associado ao DAO.
    /// </summary>
    /// <returns>
    /// O objeto de consulta associado ao DAO.
    /// </returns>
    /// <remarks>
    /// Este método retorna o objeto de consulta associado ao DAO,
    /// que pode ser usado para executar consultas no banco de dados e obter dados.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Retrieves the query object associated with the DAO.
    /// </summary>
    /// <returns>The query object associated with the DAO.</returns>
    /// <remarks>
    /// This method returns the query object associated with the DAO,
    /// which can be used to execute database queries and retrieve data.
    /// </remarks>
    {$ENDIF}
    function GetQuery: TFDQuery;

  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface responsável por definir os métodos disponíveis para manipulação de dados
  /// utilizando reflexão (RTTI) em um DAO genérico.
  /// </summary>
  /// <typeparam name="T">
  /// O tipo de classe associado ao DAO.
  /// </typeparam>
  {$ELSE}
  /// <summary>
  /// Interface responsible for defining the methods available for data manipulation
  /// using reflection (RTTI) in a generic DAO.
  /// </summary>
  /// <typeparam name="T">
  /// The class type associated with the DAO.
  /// </typeparam>
  {$ENDIF}
  ISetup4DDAORtti<T: Class> = interface
    ['{B280ECC3-8DFD-4949-8396-3DD92BE7E03C}']
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna o nome da tabela associada ao DAO.
    /// </summary>
    /// <returns>
    /// O nome da tabela associada ao DAO.
    /// </returns>
    /// <remarks>
    /// Este método retorna o nome da tabela associada ao DAO,
    /// que pode ser usado para consultas e manipulação de dados.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns the name of the table associated with the DAO.
    /// </summary>
    /// <returns>The name of the table associated with the DAO.</returns>
    /// <remarks>
    /// This method returns the name of the table associated with the DAO,
    /// which can be used for querying and manipulating data.
    /// </remarks>
    {$ENDIF}
    function GetTableName: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna os nomes dos campos associados ao DAO.
    /// </summary>
    /// <returns>
    /// Um array contendo os nomes dos campos associados ao DAO.
    /// </returns>
    /// <remarks>
    /// Este método retorna os nomes dos campos associados ao DAO,
    /// que podem ser usados para consultas e manipulação de dados.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns the names of the fields associated with the DAO.
    /// </summary>
    /// <returns>An array containing the names of the fields associated with the DAO.</returns>
    /// <remarks>
    /// This method returns the names of the fields associated with the DAO,
    /// which can be used for querying and manipulating data.
    /// </remarks>
    {$ENDIF}
    function GetFieldNames(AValue: TCRUDOperation): TArray<string>; overload;

  end;













implementation

end.
