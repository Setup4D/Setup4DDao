{*******************************************************}
{                                                       }
{           DAO runtime library in pascal               }
{                     DAO MAIN                          }
{                                                       }
{                                                       }
{             Copyright(c) 2010-2023                    }
{      Setup4D Consulting & Development,  Inc.          }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit Setup4D.DAO;

interface

uses
  Data.DB,

  Setup4D.DAO.Rtti,
  Setup4D.DAO.Types,
  Setup4D.DAO.Useful,
  Setup4D.DAO.Interf,
  Setup4D.DAO.Custom,
  Setup4D.DAO.Records,
  Setup4D.DAO.Session,
  Setup4D.DAO.Helpers,
  Setup4D.DAO.Attribute,
  Setup4D.DAO.Connection,
  Setup4D.DAO.Custom.Interf,

  System.Rtti,
  System.JSON,
  System.Classes,
  System.TypInfo,
  System.SysUtils,
  System.Generics.Collections,

  FireDAC.Stan.Param,
  FireDAC.Comp.Client;

type

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Implementação da classe TSetup4DDAO que implementa a interface
  /// ISetup4DDAO para uma classe genérica T.
  /// </summary>
  /// <typeparam name="T">
  /// O tipo de classe genérica associada ao DAO.
  /// </typeparam>
  {$ELSE}
  /// <summary>
  /// Implementation of the TSetup4DDAO class that implements the ISetup4DDAO interface for a generic class T.
  /// </summary>
  /// <typeparam name="T">The type of generic class associated with the DAO.</typeparam>
  {$ENDIF}
  TSetup4DDAO<T: class, constructor> = class(TInterfacedObject, ISetup4DDAO<T>,
                                              ISetup4DDAOCustom<T>)
  private
    FGeneric: T;
    FDAOCustom : ISetup4DDAOCustom;
    FQuery: TFDQuery;
    FGenericList : TObjectList<T>;
    FDataBaseType : TDatabaseTypes;
    FConnection: ISetup4DDAOConnection<T>;
    FValidateWithException : Boolean;

  {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Verifica se o campo atual é válido.
    /// </summary>
    /// <returns>
    /// True se o campo for válido, False caso contrário.
    /// </returns>
    /// <remarks>
    /// Este método verifica se o campo atual é válido de acordo com as regras de validação definidas.
    /// Retorna True se o campo for considerado válido e False caso contrário.
    /// </remarks>
  {$ELSE}
    /// <summary>
    /// Checks if the current field is valid.
    /// </summary>
    /// <returns>
    /// True if the field is valid, False otherwise.
    /// </returns>
    /// <remarks>
    /// This method checks if the current field is valid according to the defined validation rules.
    /// Returns True if the field is considered valid and False otherwise.
    /// </remarks>
  {$ENDIF}
    function IsFieldValid: Boolean;
  {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Verifica se o campo é uma chave primária.
    /// </summary>
    /// <returns>
    /// Um valor Variant que indica se o campo de uma chave primária.
    /// </returns>
    /// <remarks>
    /// Este método verifica o campo é uma chave primária no RTTI.
    /// </remarks>
  {$ELSE}
    /// <summary>
    /// Checks that the field is a primary key.
    /// </summary>
    /// <returns>
    /// A Variant value that indicates whether the field is a primary key.
    /// </returns>
    /// <remarks>
    /// This method checks the field is a primary key in RTTI.
    /// </remarks>
  {$ENDIF}
    function IsPrimaryKey: Variant;

  {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna o nome da chave primária do campo atual via RTTI.
    /// </summary>
    /// <returns>
    /// Uma string contendo o nome da chave primária.
    /// </returns>
    /// <remarks>
    /// Este método retorna o nome da chave primária associada ao campo atual via RTTI.
    /// </remarks>
  {$ELSE}
    /// <summary>
    /// Returns the name of the primary key for the current field By Rtti.
    /// </summary>
    /// <returns>
    /// A string containing the name of the primary key.
    /// </returns>
    /// <remarks>
    /// This method returns the name of the primary key associated with the current field in RTTI.
    /// </remarks>
  {$ENDIF}
    function IsPrimaryKeyName: string;

  {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Construtor da classe TSetup4DDAO.
    /// </summary>
  {$ELSE}
    /// <summary>
    /// Constructor of the TSetup4DDAO class.
    /// </summary>
  {$ENDIF}
    constructor Create;
  protected
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
    /// Retorna uma nova instância do DAO com uma configuração do
    /// banco de dados SQLite.
    /// </summary>
    /// <returns>
    /// A instância de ISetup4DDAO<T> com a configuração do
    /// banco de dados SQLite.</returns>
    /// <remarks>
    /// Este método configura o DAO para usar um banco de dados SQLite
    /// para operações de acesso aos dados.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns a new instance of the DAO with a SQLite database configuration.
    /// </summary>
    /// <returns>The instance of ISetup4DDAO<T> with the SQLite database configuration.</returns>
    /// <remarks>
    /// This method configures the DAO to use a SQLite database for data access operations.
    /// </remarks>
    {$ENDIF}
    function SQLiteDatabase: ISetup4DDAO<T>;


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
    /// O valor padrão é TSymbol.Equal ("=").
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAO<T> contendo os registros encontrados.
    /// </returns>
    /// <remarks>
    /// Este método permite buscar registros na fonte de dados com base em uma
    /// chave e valor especificados.
    /// É possível definir um símbolo de comparação para controlar o tipo
    /// de comparação a ser realizada.
    /// Por padrão, o símbolo de comparação utilizado é TSymbol.Equal ("="),
    /// que realiza uma comparação de igualdade.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finds records in the data source based on the specified key and value, using an optional comparison symbol.
    /// </summary>
    /// <param name="AKey">The key to search for records.</param>
    /// <param name="AValue">The value to compare.</param>
    /// <param name="AComparision">The comparison symbol to use (optional). The default value is TSymbol.Equal.</param>
    /// <returns>An instance of ISetup4DDAO<T> containing the found records.</returns>
    /// <remarks>
    /// This method allows you to search for records in the data source based on a specified key and value.
    /// You can define a comparison symbol to control the type of comparison to be performed.
    /// By default, the comparison symbol used is TSymbol.Equal, which performs an equality comparison.
    /// </remarks>
    {$ENDIF}
    function Find(AKey: string; AValue: Variant;
      AComparision: TComparisonOperator = TComparisonOperator.Equal): ISetup4DDAO<T>; overload;

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
      AComparision: TComparisonOperator;
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
      Const AComparision: TComparisonOperator): ISetup4DDAOCustom<T>; overload;

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


  public
  {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Destrói a instância da classe TSetup4DDAO.
    /// </summary>
  {$ELSE}
    /// <summary>
    /// Destroys the instance of the TSetup4DDAO class.
    /// </summary>
  {$ENDIF}
    destructor Destroy; override;

  {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância da classe TSetup4DDAO.
    /// </summary>
    /// <returns>
    /// Uma nova instância da interface ISetup4DDAO<T>.
    /// </returns>
  {$ELSE}
    /// <summary>
    /// Creates a new instance of the TSetup4DDAO class.
    /// </summary>
    /// <returns>
    /// A new instance of the ISetup4DDAO<T> interface.
    /// </returns>
  {$ENDIF}
    class function New: ISetup4DDAO<T>;

  end;

implementation

{ TSetup4DDAO<T> }

function TSetup4DDAO<T>.AsJSONJSONArray: TJSONArray;
begin
  Result:= FDAOCustom.AsJSONJSONArray;
end;

function TSetup4DDAO<T>.AsJSONJSONArrayString: string;
begin
  Result := FDAOCustom.AsJSONJSONArrayString;
end;

function TSetup4DDAO<T>.AsJSONObject: TJSONObject;
begin
  Result := FDAOCustom.AsJSONObject;
end;

function TSetup4DDAO<T>.AsJSONObjectString: string;
begin
  Result := FDAOCustom.AsJSONObjectString;
end;

function TSetup4DDAO<T>.ClearGroupBy: ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.ClearGroupBy;
end;

function TSetup4DDAO<T>.ClearJoin: ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.ClearJoin;
end;

function TSetup4DDAO<T>.ClearOrderBy: ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.ClearOrderBy;
end;

function TSetup4DDAO<T>.ClearSQL: ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.ClearSQL;
end;

function TSetup4DDAO<T>.ClearWhere: ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.ClearWhere;
end;

constructor TSetup4DDAO<T>.Create;
begin
  FGeneric := T.Create;
  FGenericList := TObjectList<T>.Create;
  FDaoCustom := TSetup4DDAOCustom.New;

  FDataBaseType := TDatabaseTypes.Null;
  FConnection := TSetup4DDAOConnection<T>.New;
  FValidateWithException := True;
end;

function TSetup4DDAO<T>.Custom: ISetup4DDAOCustom<T>;
begin
  Result := Self;

  if Assigned(FQuery) then
    FQuery.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};

  FQuery := FConnection.SetDataBase(FDataBaseType).GetQuery;

  FDAOCustom.Query(FQuery);
end;

function TSetup4DDAO<T>.DataSet: TDataSet;
begin
  Result := FDAOCustom.DataSet;
end;

function TSetup4DDAO<T>.Delete: ISetup4DDAO<T>;
var
  LQuery : TFDQuery;
  LTableName: string;
  LPrimaryKeyName: string;
begin
  Result := Self;

  if FDataBaseType = TDatabaseTypes.Null then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.DatabaseUndefined);

  LTableName := TSetup4DDAORtti<T>.New.GetTableName;

  LQuery := FConnection.SetDataBase(FDataBaseType).GetQuery;
  try
    LPrimaryKeyName := IsPrimaryKeyName;

    LQuery.SQL.Add('DELETE FROM');
    LQuery.SQL.Add(LTableName);
    LQuery.SQL.Add(' WHERE ');
    LQuery.SQL.Add(Format('%s = :%s', [LPrimaryKeyName, LPrimaryKeyName]));

    LQuery.ParamByName(LPrimaryKeyName).Value := IsPrimaryKey;

    LQuery.Prepare;
    LQuery.ExecSQL;
  finally
    LQuery.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;
end;

destructor TSetup4DDAO<T>.Destroy;
begin
  if Assigned(FQuery) then
    FQuery.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};

  FGenericList.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  FreeAndNil(FGeneric);
  inherited;
end;

function TSetup4DDAO<T>.Execute: ISetup4DDAOCustom<T>;
begin
  Result:= Self;

  FDAOCustom.Execute;
end;

function TSetup4DDAO<T>.Find(AKey: String; AValue: Variant;
  AComparision: TComparisonOperator): ISetup4DDAO<T>;
var
  LTableName: string;
  LFieldNames: TArray<string>;
  LFieldName: string;
  LQuery: TFDQuery;
  LProperty: TRttiProperty;
  LType: TRttiType;
  LContext: TRttiContext;
  LValue: TValue;
  LGeneric : T;
begin
  Result := Self;

  if FDataBaseType = TDatabaseTypes.Null then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.DatabaseUndefined);

  LTableName := TSetup4DDAORtti<T>.New.GetTableName;
  LFieldNames := TSetup4DDAORtti<T>.New.GetFieldNames(TCRUDOperation.Read);

  LQuery := FConnection.SetDataBase(FDataBaseType).GetQuery;
  try
    LQuery.SQL.Add('SELECT ');
    LQuery.SQL.Add(String.Join(', ', LFieldNames));
    LQuery.SQL.Add(' FROM ');
    LQuery.SQL.Add(LTableName);
    LQuery.SQL.Add(' WHERE ');
    LQuery.SQL.Add(' lower( ');
    LQuery.SQL.Add(AKey);
    LQuery.SQL.Add(') ');
    LQuery.SQL.Add(AComparision.ToString);
    LQuery.SQL.Add(' lower(:Filter)');
    LQuery.ParamByName('Filter').Value := AValue;

    LQuery.Prepare;
    LQuery.Open;

    if LQuery.IsEmpty then
    begin
      case FValidateWithException of
        True : raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.NoRecord);
        False : Exit;
      end;
    end;

    LContext := TRttiContext.Create;
    LType := LContext.GetType(FGeneric.ClassType);

    LContext := TRttiContext.Create;
    LType := LContext.GetType(FGeneric.ClassType);

    FGenericList.Clear;

    LQuery.First;
    while not LQuery.Eof do
    begin
      LGeneric := T.Create;
      for LFieldName in LFieldNames do
      begin
        LProperty := LType.GetProperty(LFieldName);
        if Assigned(LProperty) and LProperty.IsWritable then
        begin
          if LQuery.FieldByName(LFieldName).IsNull then
            LValue := TValue.FromVariant(EmptyStr)
          else
            LValue := TValue.FromVariant(LQuery.FieldByName(LFieldName).Value);
          LProperty.SetValue(TObject(LGeneric), LValue);
        end;
      end;

      FGenericList.Add(LGeneric);

      LQuery.Next;
    end;

    for LFieldName in LFieldNames do
    begin
      LProperty := LType.GetProperty(LFieldName);
      if Assigned(LProperty) and LProperty.IsWritable then
      begin
        if LQuery.FieldByName(LFieldName).IsNull then
          LValue := TValue.FromVariant(EmptyStr)
        else
          LValue := TValue.FromVariant(LQuery.FieldByName(LFieldName).Value);
        LProperty.SetValue(TObject(FGeneric), LValue);
      end;
    end;
  finally
    LQuery.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;
end;

function TSetup4DDAO<T>.FindID(AValue: string): ISetup4DDAO<T>;
var
  LTableName: string;
  LFieldNames: TArray<string>;
  LFieldName: string;
  LQuery: TFDQuery;
  LProperty: TRttiProperty;
  LType: TRttiType;
  LContext: TRttiContext;
  LValue: TValue;
begin
  Result := Self;

  if FDataBaseType = TDatabaseTypes.Null then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.DatabaseUndefined);

  LTableName := TSetup4DDAORtti<T>.New.GetTableName;
  LFieldNames := TSetup4DDAORtti<T>.New.GetFieldNames(TCRUDOperation.Read);

  LQuery := FConnection.SetDataBase(FDataBaseType).GetQuery;
  try
    LQuery.SQL.Add('SELECT ');
    LQuery.SQL.Add(String.Join(', ', LFieldNames));
    LQuery.SQL.Add(' FROM ');
    LQuery.SQL.Add(LTableName);
    LQuery.SQL.Add(' WHERE ID = :ID');

    LQuery.ParamByName('ID').Value := AValue;

    LQuery.Prepare;
    LQuery.Open;

    if LQuery.IsEmpty then
    begin
      case FValidateWithException of
        True : raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.NoRecord);
        False : Exit;
      end;
    end;

    LContext := TRttiContext.Create;
    LType := LContext.GetType(FGeneric.ClassType);

    LContext := TRttiContext.Create;
    LType := LContext.GetType(FGeneric.ClassType);

    for LFieldName in LFieldNames do
    begin
      LProperty := LType.GetProperty(LFieldName);
      if Assigned(LProperty) and LProperty.IsWritable then
      begin
        if LQuery.FieldByName(LFieldName).IsNull then
          LValue := TValue.FromVariant(EmptyStr)
        else
          LValue := TValue.FromVariant(LQuery.FieldByName(LFieldName).Value);

        LProperty.SetValue(TObject(FGeneric), LValue);
      end;
    end;

  finally
    LQuery.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;
end;

function TSetup4DDAO<T>.Finish: ISetup4DDAO<T>;
begin
  Result := Self;
end;

function TSetup4DDAO<T>.FindID(AValue: Integer): ISetup4DDAO<T>;
begin
  Result := Self;
  FindID(AValue.ToString);
end;

function TSetup4DDAO<T>.FindID(AValue: Int64): ISetup4DDAO<T>;
var
  LTableName: string;
  LFieldNames: TArray<string>;
  LFieldName: string;
  LQuery: TFDQuery;
  LProperty: TRttiProperty;
  LType: TRttiType;
  LContext: TRttiContext;
  LValue: TValue;
begin
  Result := Self;
  if FDataBaseType = TDatabaseTypes.Null then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.DatabaseUndefined);

  LTableName := TSetup4DDAORtti<T>.New.GetTableName;
  LFieldNames := TSetup4DDAORtti<T>.New.GetFieldNames(TCRUDOperation.Read);

  LQuery := FConnection.SetDataBase(FDataBaseType).GetQuery;
  try
    LQuery.SQL.Add('SELECT ');
    LQuery.SQL.Add(String.Join(', ', LFieldNames));
    LQuery.SQL.Add(' FROM ');
    LQuery.SQL.Add(LTableName);
    LQuery.SQL.Add(' WHERE ID = :ID');

    LQuery.ParamByName('ID').Value := AValue;

    LQuery.Prepare;
    LQuery.Open;

    if LQuery.IsEmpty then
    begin
      case FValidateWithException of
        True : raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.NoRecord);
        False : Exit;
      end;
    end;

    LContext := TRttiContext.Create;
    LType := LContext.GetType(FGeneric.ClassType);

    LContext := TRttiContext.Create;
    LType := LContext.GetType(FGeneric.ClassType);

    for LFieldName in LFieldNames do
    begin
      LProperty := LType.GetProperty(LFieldName);
      if Assigned(LProperty) and LProperty.IsWritable then
      begin
        if LQuery.FieldByName(LFieldName).IsNull then
          LValue := TValue.FromVariant(EmptyStr)
        else
          LValue := TValue.FromVariant(LQuery.FieldByName(LFieldName).Value);

        LProperty.SetValue(TObject(FGeneric), LValue);
      end;
    end;

  finally
    LQuery.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;
end;

function TSetup4DDAO<T>.GetClassData: T;
begin
  Result := FGeneric;
end;

function TSetup4DDAO<T>.GetClassList: TObjectList<T>;
begin
  Result := FGenericList;
end;

function TSetup4DDAO<T>.GroupBy(AValue: string): ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.GroupBy(AValue);
end;

function TSetup4DDAO<T>.Insert: ISetup4DDAO<T>;
var
  LQuery : TFDQuery;
  LTableName: string;
  LFieldNames: TArray<string>;
  LFieldName: string;
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProperty: TRttiProperty;
begin
  Result := Self;

  if FDataBaseType = TDatabaseTypes.Null then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.DatabaseUndefined);

  LTableName := TSetup4DDAORtti<T>.New.GetTableName;
  LFieldNames := TSetup4DDAORtti<T>.New.GetFieldNames(TCRUDOperation.Create);

  LQuery := FConnection.SetDataBase(FDataBaseType).GetQuery;
  try
    LQuery.SQL.Add('INSERT INTO');
    LQuery.SQL.Add(LTableName);
    LQuery.SQL.Add(' (');
    LQuery.SQL.Add(String.Join(', ', LFieldNames));
    LQuery.SQL.Add(') VALUES (');
    LQuery.SQL.Add( ':' + String.Join(', :', LFieldNames));
    LQuery.SQL.Add(')');

    if not IsFieldValid then
      Exit;

    LRttiContext := TRttiContext.Create;
    try
      LRttiType := LRttiContext.GetType(FGeneric.ClassType);

      for LFieldName in LFieldNames do
      begin
        LRttiProperty := LRttiType.GetProperty(LFieldName);

        if not Assigned(LRttiProperty) then
          Continue;

        LQuery.ParamByName(LFieldName).Value := LRttiProperty.GetValue(TObject(FGeneric)).AsVariant;
      end;

    finally
      LRttiContext.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
    end;

    LQuery.Prepare;
    LQuery.ExecSQL;
  finally
    LQuery.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;
end;

function TSetup4DDAO<T>.IsFieldValid: Boolean;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProperty: TRttiProperty;
  LFieldName: string;
  LAttribute: TCustomAttribute;
  LPropValue: TValue;
begin
  LRttiContext := TRttiContext.Create;
  try
    LRttiType := LRttiContext.GetType(FGeneric.ClassType);

    for LRttiProperty in LRttiType.GetProperties do
    begin
      LFieldName := LRttiProperty.Name;
      for LAttribute in LRttiProperty.GetAttributes do
      begin
        if LAttribute is TRequiredField then
        begin
          // Verificar se o valor do campo é nulo ou vazio
          LPropValue := LRttiProperty.GetValue(TObject(FGeneric));
          if LPropValue.IsEmpty or LPropValue.AsString.IsEmpty then
          begin
            Result := False;
            raise Exception.CreateFmt(TSetup4DDAOSession.GetInstance.SystemMessage.RequiredField, [LFieldName]);
          end;
        end;
      end;
    end;

    Result := True;
  finally
    LRttiContext.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;

end;

function TSetup4DDAO<T>.IsPrimaryKey: Variant;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProperty: TRttiProperty;
  LFieldName: string;
  LAttribute: TCustomAttribute;
  LPropValue: TValue;
begin
  Result := -1;
  LRttiContext := TRttiContext.Create;
  try
    LRttiType := LRttiContext.GetType(FGeneric.ClassType);

    for LRttiProperty in LRttiType.GetProperties do
    begin
      LFieldName := LRttiProperty.Name;
      for LAttribute in LRttiProperty.GetAttributes do
      begin
        if LAttribute is TPrimaryKey then
        begin
          // Verificar se o valor do campo é nulo ou vazio
          LPropValue := LRttiProperty.GetValue(TObject(FGeneric));
          if LPropValue.IsEmpty then
            raise Exception.CreateFmt(TSetup4DDAOSession.GetInstance.SystemMessage.NoField, [LFieldName]);

          try
            if LPropValue.AsString.IsEmpty then
              raise Exception.CreateFmt(TSetup4DDAOSession.GetInstance.SystemMessage.NoField, [LFieldName]);

          except on E: Exception do
            if LPropValue.AsInteger < 1 then
              raise Exception.CreateFmt(TSetup4DDAOSession.GetInstance.SystemMessage.NoField, [LFieldName]);
          end;

          Result := LPropValue.AsVariant;
        end;
      end;
    end;

  finally
    LRttiContext.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;

end;

function TSetup4DDAO<T>.IsPrimaryKeyName: string;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProperty: TRttiProperty;
  LFieldName: string;
  LAttribute: TCustomAttribute;
  LPropValue: TValue;
begin
  Result := EmptyStr;

  LRttiContext := TRttiContext.Create;
  try
    LRttiType := LRttiContext.GetType(FGeneric.ClassType);

    for LRttiProperty in LRttiType.GetProperties do
    begin
      LFieldName := LRttiProperty.Name;
      for LAttribute in LRttiProperty.GetAttributes do
        if LAttribute is TPrimaryKey then
          Result := LFieldName;
    end;

  finally
    LRttiContext.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;

end;

function TSetup4DDAO<T>.Join(Const AValue: String): ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.Join(AValue);
end;

class function TSetup4DDAO<T>.New: ISetup4DDAO<T>;
begin
  Result := Self.Create;
end;

function TSetup4DDAO<T>.NoValidateWithException: ISetup4DDAO<T>;
begin
  Result := Self;
  FValidateWithException := False;
end;

function TSetup4DDAO<T>.Open: ISetup4DDAOCustom<T>;
begin
  Result:= Self;
  FDAOCustom.Open;
end;

function TSetup4DDAO<T>.OrderBy(Const AValue: string): ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.OrderBy(AValue);
end;

function TSetup4DDAO<T>.PGDatabase: ISetup4DDAO<T>;
begin
  Result := Self;
  FDataBaseType := TDatabaseTypes.PG;
end;

function TSetup4DDAO<T>.SQL(Const AValue: string): ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.SQL(AValue);
end;

function TSetup4DDAO<T>.SQLiteDatabase: ISetup4DDAO<T>;
begin
  Result := Self;
  FDataBaseType := TDatabaseTypes.SQLite;
end;

function TSetup4DDAO<T>.TypeOrderBy(AValue: TOrderBy): ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.TypeOrderBy(AValue);
end;

function TSetup4DDAO<T>.Update: ISetup4DDAO<T>;
var
  LQuery : TFDQuery;
  LTableName: string;
  LFieldNames: TArray<string>;
  LFieldName: string;
  LUpdateFields: TStringList;
  LPrimaryKeyName: string;
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProperty: TRttiProperty;
begin
  Result := Self;

  if FDataBaseType = TDatabaseTypes.Null then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.DatabaseUndefined);

  LTableName := TSetup4DDAORtti<T>.New.GetTableName;
  LFieldNames := TSetup4DDAORtti<T>.New.GetFieldNames(TCRUDOperation.Update);

  LQuery := FConnection.SetDataBase(FDataBaseType).GetQuery;
  LUpdateFields := TStringList.Create;
  try
    LUpdateFields.StrictDelimiter := True;

    for LFieldName in LFieldNames do
      LUpdateFields.Add(Format('%s = :%s', [LFieldName, LFieldName]));

    if LUpdateFields.Count = 0 then
      raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.NoRecordReported);

    LPrimaryKeyName := IsPrimaryKeyName;

    LQuery.SQL.Add('UPDATE');
    LQuery.SQL.Add(LTableName);
    LQuery.SQL.Add('SET');
    LQuery.SQL.Add(LUpdateFields.DelimitedText);
    LQuery.SQL.Add(' WHERE ');
    LQuery.SQL.Add(Format('%s = :%s', [LPrimaryKeyName, LPrimaryKeyName]));

    LRttiContext := TRttiContext.Create;
    try
      LRttiType := LRttiContext.GetType(FGeneric.ClassType);

      for LFieldName in LFieldNames do
      begin
        LRttiProperty := LRttiType.GetProperty(LFieldName);

        if not Assigned(LRttiProperty) then
          Continue;

        LQuery.ParamByName(LFieldName).Value := LRttiProperty.GetValue(TObject(FGeneric)).AsVariant;
      end;

    finally
      LRttiContext.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
    end;

    LQuery.ParamByName(LPrimaryKeyName).Value := IsPrimaryKey;

    LQuery.Prepare;
    LQuery.ExecSQL;
  finally
    LUpdateFields.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
    LQuery.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;
end;

function TSetup4DDAO<T>.ValidateWithException: ISetup4DDAO<T>;
begin
  Result := Self;
  FValidateWithException := True;
end;

function TSetup4DDAO<T>.Where(const AKey: String; const AValue: Variant;
  const AComparision: TComparisonOperator): ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.Where(AKey, AValue, AComparision);
end;

function TSetup4DDAO<T>.Where(const AKey: String;
  const AValue: Variant): ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.Where(AKey, AValue);
end;

function TSetup4DDAO<T>.Where(const AKey: String; const AValue: Variant;
  AComparision: TComparisonOperator;
  AOperator: TLogicalOperator): ISetup4DDAOCustom<T>;
begin
  Result := Self;
  FDAOCustom.Where(AKey, AValue, AComparision, AOperator);
end;

end.
