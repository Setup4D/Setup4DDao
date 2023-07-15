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
unit Setup4D.DAO.Custom.Interf;

interface

uses
  Setup4D.DAO.Types,

  Data.DB,

  System.JSON,

  FireDAC.Comp.Client;

type
  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface usada para definir as operações de configuração personalizada para a classe DAO.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface used to define custom configuration operations for the DAO class.
  /// </summary>
  {$ENDIF}
  ISetup4DDAOCustom = interface
    ['{98DCD0A9-04C3-46D7-8D5A-64A7C7B3EC17}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma instância de ISetup4DDAOCustom usando um objeto TFDQuery como fonte de dados.
    /// </summary>
    /// <param name="AValue">
    /// O objeto TFDQuery a ser utilizado como fonte de dados.
    /// </param>
    /// <returns>
    /// Uma instância de ISetup4DDAOCustom.
    /// </returns>
    /// <remarks>
    /// Esta função cria uma instância de ISetup4DDAOCustom usando um objeto TFDQuery como fonte de dados.
    /// O objeto TFDQuery especificado será utilizado para executar consultas e operações de manipulação de dados.
    /// Através da instância de ISetup4DDAOCustom retornada, é possível realizar operações personalizadas e finalizar a configuração do DAO.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Creates an instance of ISetup4DDAOCustom using a TFDQuery object as data source.
    /// </summary>
    /// <param name="AValue">
    /// The TFDQuery object to be used as data source.
    /// </param>
    /// <returns>
    /// An instance of ISetup4DDAOCustom.
    /// </returns>
    /// <remarks>
    /// This function creates an instance of ISetup4DDAOCustom using a TFDQuery object as data source.
    /// The specified TFDQuery object will be used to perform queries and data manipulation operations.
    /// Through the returned ISetup4DDAOCustom instance, it is possible to perform custom operations and finalize the DAO configuration.
    /// </remarks>
    {$ENDIF}
    function Query(Const AValue: TFDQuery):  ISetup4DDAOCustom; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa uma consulta SQL com o valor especificado.
    /// </summary>
    /// <param name="AValue">
    /// O valor da consulta SQL
    /// </param>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom que representa a consulta SQL
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Run an SQL query with the specified value.
    /// </summary>
    /// <param name="AValue">
    /// The value of the SQL query
    /// </param>
    /// <returns>
    /// An instance of  ISetup4DDAOCustom representing the SQL query
    /// </returns>
    {$ENDIF}
    function SQL(Const AValue: string):  ISetup4DDAOCustom; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa a consulta SQL atual.
    /// </summary>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom sem consulta SQL definida
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Clears the current SQL query.
    /// </summary>
    /// <returns>
    /// An instance of  ISetup4DDAOCustom without a defined SQL query
    /// </returns>
    {$ENDIF}
    function ClearSQL:  ISetup4DDAOCustom;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Adiciona uma cláusula JOIN à consulta SQL com o valor especificado.
    /// </summary>
    /// <param name="AValue">
    /// O valor da cláusula JOIN
    /// </param>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom com a cláusula JOIN adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds a JOIN clause to the SQL query with the specified value.
    /// </summary>
    /// <param name="AValue">The value of the JOIN clause</param>
    /// <returns>An instance of  ISetup4DDAOCustom with the JOIN clause added</returns>
    {$ENDIF}
    function Join(Const AValue: String):  ISetup4DDAOCustom;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa a cláusula JOIN da consulta SQL atual.
    /// </summary>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom sem cláusula JOIN definida
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Clears the JOIN clause of the current SQL query.
    /// </summary>
    /// <returns>An instance of  ISetup4DDAOCustom without a defined JOIN clause</returns>
    {$ENDIF}
    function ClearJoin:  ISetup4DDAOCustom;

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
    /// Uma instância de  ISetup4DDAOCustom com a cláusula WHERE adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds a WHERE clause to the SQL query with the specified key, value, and Comparison.
    /// </summary>
    /// <param name="AKey">The key of the WHERE clause</param>
    /// <param name="AValue">The value of the WHERE clause</param>
    /// <param name="AComparison">The comparisioncondition of the WHERE clause</param>
    /// <param name="AOperator"> Logical operator of the WHERE clause</param>
    /// <returns>An instance of  ISetup4DDAOCustom with the WHERE clause added</returns>
    {$ENDIF}
    function Where(Const AKey: String; Const AValue: Variant;
      Const AComparison: TComparisonOperator;
      Const AOperator: TLogicalOperator):  ISetup4DDAOCustom; overload;

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
    /// <param name="AComparision">
    /// A condição da cláusula WHERE
    /// </param>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom com a cláusula WHERE adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds a WHERE clause to the SQL query with the specified key, value, and condition.
    /// </summary>
    /// <param name="AKey">The key of the WHERE clause</param>
    /// <param name="AValue">The value of the WHERE clause</param>
    /// <param name="AComparison">The condition of the WHERE clause</param>
    /// <returns>An instance of  ISetup4DDAOCustom with the WHERE clause added</returns>
    {$ENDIF}
    function Where(Const AKey: String; Const AValue: Variant;
      Const AComparison: TComparisonOperator):  ISetup4DDAOCustom; overload;

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
    /// Uma instância de  ISetup4DDAOCustom com a cláusula WHERE adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds a WHERE clause to the SQL query with the specified key, value, and condition.
    /// </summary>
    /// <param name="AKey">The key of the WHERE clause</param>
    /// <param name="AValue">The value of the WHERE clause</param>
    /// <returns>An instance of  ISetup4DDAOCustom with the WHERE clause added</returns>
    {$ENDIF}
    function Where(Const AKey: String; Const AValue: Variant):  ISetup4DDAOCustom; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa a cláusula WHERE da consulta SQL atual.
    /// </summary>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom sem cláusula WHERE definida
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Clears the WHERE clause of the current SQL query.
    /// </summary>
    /// <returns>An instance of  ISetup4DDAOCustom without a defined WHERE clause</returns>
    {$ENDIF}
    function ClearWhere:  ISetup4DDAOCustom;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Adiciona uma cláusula ORDER BY à consulta SQL com os campos especificado.
    /// </summary>
    /// <param name="AValue">
    /// Os campos do ORDER BY
    /// </param>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom com a cláusula ORDER BY adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds an ORDER BY clause to the SQL query with the specified fields.
    /// </summary>
    /// <param name="AValue">
    /// The ORDER BY fields
    /// </param>
    /// <returns>
    /// An instance of  ISetup4DDAOCustom with added ORDER BY clause
    /// </returns>
    {$ENDIF}
    function OrderBy(Const AValue: string):  ISetup4DDAOCustom;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o tipo de ordenação da cláusula ORDER BY para a consulta SQL.
    /// </summary>
    /// <param name="AValue">
    /// O tipo de ordenação da cláusula ORDER BY
    /// </param>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom com o tipo de ordenação definido
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the ordering type of the ORDER BY clause for the SQL query.
    /// </summary>
    /// <param name="AValue">The ordering type of the ORDER BY clause</param>
    /// <returns>An instance of  ISetup4DDAOCustom with the ordering type set</returns>
    {$ENDIF}
    function TypeOrderBy(AValue: TOrderBy):  ISetup4DDAOCustom;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa a cláusula ORDER BY da consulta SQL atual.
    /// </summary>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom sem cláusula ORDER BY definida
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Clears the ORDER BY clause of the current SQL query.
    /// </summary>
    /// <returns>An instance of  ISetup4DDAOCustom without a defined ORDER BY clause</returns>
    {$ENDIF}
    function ClearOrderBy:  ISetup4DDAOCustom;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Adiciona uma cláusula GROUP BY à consulta SQL com os campos especificado.
    /// </summary>
    /// <param name="AValue">
    /// Os campos do GROUP BY
    /// </param>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom com a cláusula GROUP BY adicionada
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Adds a GROUP BY clause to the SQL query with the specified fields.
    /// </summary>
    /// <param name="AValue">
    /// The GROUP BY fields
    /// </param>
    /// <returns>
    /// An instance of  ISetup4DDAOCustom with the added GROUP BY clause
    /// </returns>
    {$ENDIF}
    function GroupBy(AValue: string):  ISetup4DDAOCustom;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa a cláusula GROUP BY da consulta SQL atual.
    /// </summary>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom sem cláusula GROUP BY definida
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Clears the GROUP BY clause of the current SQL query.
    /// </summary>
    /// <returns>An instance of  ISetup4DDAOCustom without a defined GROUP BY clause</returns>
    {$ENDIF}
    function ClearGroupBy:  ISetup4DDAOCustom;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa o comando da query (SELECT).
    /// </summary>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom com a consulta SQL aberta
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Execute the query command (SELECT).
    /// </summary>
    /// <returns>
    /// An instance of  ISetup4DDAOCustom with the open SQL query
    /// </returns>
    {$ENDIF}
    function Open:  ISetup4DDAOCustom;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa o comando da query (INSERT ou UPDATE ou DELETE).
    /// </summary>
    /// <returns>
    /// Uma instância de  ISetup4DDAOCustom com a consulta SQL aberta
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Execute the query command (INSERT or UPDATE or DELETE).
    /// </summary>
    /// <returns>
    /// An instance of  ISetup4DDAOCustom with the open SQL query
    /// </returns>
    {$ENDIF}
    function Execute:  ISetup4DDAOCustom;

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
implementation

end.
