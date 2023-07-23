{*******************************************************}
{                                                       }
{           DAO runtime library in pascal               }
{                     DAO CUSTOM                        }
{                                                       }
{                                                       }
{             Copyright(c) 2010-2023                    }
{      Setup4D Consulting & Development,  Inc.          }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit Setup4D.DAO.Custom;

interface

uses
  Data.DB,

  DataSet.Serialize,

  Setup4D.DAO.Types,
  Setup4D.DAO.Useful,
  Setup4D.DAO.Session,
  Setup4D.DAO.Records,
  Setup4D.DAO.Helpers,
  Setup4D.DAO.Custom.Interf,

  System.JSON,
  System.SysUtils,
  System.Variants,
  System.Generics.Collections,

  FireDAC.Stan.Param,
  FireDAC.Comp.Client;

type
  TSetup4DDAOCustom = class(TInterfacedObject, ISetup4DDAOCustom)
  private
    FQuery: TFDQuery;
    FJoin: TList<string>;
    FWhere: TDictionary<string, TValueCondition>;
    FOrder: TList<string>;
    FOrderType : TOrderBy;
    FGroup: TList<string>;
    FJSONObject: TJSONObject;
    FJSONArry: TJSONArray;


    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Verifica se a cláusula JOIN está definida na consulta SQL.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Checks if the JOIN clause is defined in the SQL query.
    /// </summary>
    {$ENDIF}
    procedure IsSetJoin;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Verifica se a cláusula WHERE está definida na consulta SQL.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Checks if the WHERE clause is defined in the SQL query.
    /// </summary>
    {$ENDIF}
    procedure IsSetCondition;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Verifica se a cláusula GROUP BY está definida na consulta SQL.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Checks if the GROUP BY clause is defined in the SQL query.
    /// </summary>
    {$ENDIF}
    procedure IsSetGroup;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Verifica se a cláusula ORDER BY está definida na consulta SQL.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Checks if the ORDER BY clause is defined in the SQL query.
    /// </summary>
    {$ENDIF}
    procedure IsSetOrder;

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
    /// <param name="ACondition">
    /// A condição da cláusula WHERE
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
  public
    class function New: ISetup4DDAOCustom;
    destructor Destroy; override;
  end;
implementation

{ TSetup4DDAOCustom }

function TSetup4DDAOCustom.AsJSONJSONArray: TJSONArray;
begin
  FJSONArry := FQuery.ToJSONArray();
  Result:= FJSONArry;
end;

function TSetup4DDAOCustom.AsJSONJSONArrayString: string;
begin
  Result := AsJSONJSONArray.ToString;
end;

function TSetup4DDAOCustom.AsJSONObject: TJSONObject;
begin
  FJSONObject := FQuery.ToJSONObject();
  Result := FJSONObject;
end;

function TSetup4DDAOCustom.AsJSONObjectString: string;
begin
  Result := AsJSONObject.ToString;
end;

function TSetup4DDAOCustom.ClearGroupBy: ISetup4DDAOCustom;
begin
  Result := Self;
  FGroup.Clear;
end;

function TSetup4DDAOCustom.ClearJoin: ISetup4DDAOCustom;
begin
  Result := Self;
  FJoin.Clear;
end;

function TSetup4DDAOCustom.ClearOrderBy: ISetup4DDAOCustom;
begin
  Result := Self;
  FOrder.Clear;
end;

function TSetup4DDAOCustom.ClearSQL: ISetup4DDAOCustom;
begin
  Result := Self;
  FQuery.SQL.Clear;
end;

function TSetup4DDAOCustom.ClearWhere: ISetup4DDAOCustom;
begin
  Result := Self;
  FWhere.Clear;
end;

constructor TSetup4DDAOCustom.Create;
begin
  FOrderType := TOrderBy.Ascending;
  FJoin := TList<string>.Create;
  FWhere := TDictionary<string, TValueCondition>.Create;
  FOrder := TList<string>.Create;
  FGroup := TList<string>.Create;
end;

function TSetup4DDAOCustom.DataSet: TDataSet;
begin
  Result := TDataSet(FQuery);
end;

destructor TSetup4DDAOCustom.Destroy;
begin
  if Assigned(FJSONObject) then
    FJSONObject.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};

  if Assigned(FJSONArry) then
    FJSONArry.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};

  if Assigned(FOrder) then
    FOrder.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};

  if Assigned(FGroup) then
    FGroup.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};

  if Assigned(FWhere) then
    FWhere.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};

  if Assigned(FJoin) then
    FJoin.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};

  inherited;
end;

function TSetup4DDAOCustom.Execute: ISetup4DDAOCustom;
begin
  Result:= Self;

  if TSetup4DDAOuseful.WordExistsInString(FQuery.SQL.Text, 'SELECT') then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.NoSelect);

  IsSetCondition;

  FQuery.Prepare;
  FQuery.ExecSQL;
end;

function TSetup4DDAOCustom.GroupBy(AValue: string): ISetup4DDAOCustom;
begin
  Result := Self;
  FGroup.Add(AValue);
  FGroup.TrimExcess;
end;

procedure TSetup4DDAOCustom.IsSetCondition;
var
  LKey: string;
  LValue: Int64;
  LValueCondition: TValueCondition;
begin
  if FWhere.Count < 1 then
    Exit;

  FQuery.SQL.Add(' WHERE 1=1 ');

  for LKey in FWhere.Keys do
  begin
    FWhere.TryGetValue(LKey, LValueCondition);
    FQuery.SQL.Add(LValueCondition.Operator.ToString);

    LValue := StrToIntDef(LValueCondition.Value, -2);

    if LValue = -2 then
      FQuery.SQL.Add(' lower(');

    FQuery.SQL.Add(LKey);

    if LValue = -2 then
      FQuery.SQL.Add(') ');

    FQuery.SQL.Add(LValueCondition.Comparison.ToString);

    if LValue = -2 then
      FQuery.SQL.Add(' lower(');

    FQuery.SQL.Add(':' + LKey);

    if LValue = -2 then
      FQuery.SQL.Add(') ');

    if LValue = -2 then
      FQuery.ParamByName(LKey).Value := LValueCondition.Value
    else
      FQuery.ParamByName(LKey).Value := LValue;

  end;
end;


procedure TSetup4DDAOCustom.IsSetGroup;
var
  LGroupBy: string;
begin
  LGroupBy := EmptyStr;

  if FGroup.Count < 1 then
    Exit;

  for var I := 0 to Pred(FGroup.Count) do
  begin
    if not LGroupBy.Trim.IsEmpty then
      LGroupBy := LGroupBy + ', ';
    LGroupBy := LGroupBy + FGroup[I];
  end;

  FQuery.SQL.Add(' GROUP BY ');
  FQuery.SQL.Add(LGroupBy);
end;


procedure TSetup4DDAOCustom.IsSetJoin;
begin
  if FJoin.Count < 1 then
    Exit;

  for var I := 0 to Pred(FJoin.Count) do
    FQuery.SQL.Add(FJoin[I]);
end;

procedure TSetup4DDAOCustom.IsSetOrder;
var
  LOrderBy: string;
begin
  LOrderBy := EmptyStr;

  if FOrder.Count < 1 then
    Exit;

  for var I := 0 to Pred(FOrder.Count) do
  begin
    if not LOrderBy.Trim.IsEmpty then
      LOrderBy := LOrderBy + ', ';
    LOrderBy := LOrderBy + FOrder[I];
  end;

  FQuery.SQL.Add(' ORDER BY ');
  FQuery.SQL.Add(LOrderBy);
  FQuery.SQL.Add(FOrderType.ToString);
end;

function TSetup4DDAOCustom.Join(const AValue: String): ISetup4DDAOCustom;
begin
  Result := Self;
  FJoin.Add(AValue);
  FJoin.TrimExcess;
end;

class function TSetup4DDAOCustom.New: ISetup4DDAOCustom;
begin
  Result:= Self.Create;
end;

function TSetup4DDAOCustom.Open: ISetup4DDAOCustom;
begin
  Result:= Self;
  if not Assigned(FQuery) then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.QueryError);

  if not TSetup4DDAOuseful.WordExistsInString(FQuery.SQL.Text, 'SELECT') then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.OnlySelect);

  IsSetJoin;
  IsSetCondition;
  IsSetGroup;
  IsSetOrder;

  FQuery.Prepare;
  FQuery.Open;
end;

function TSetup4DDAOCustom.OrderBy(const AValue: string): ISetup4DDAOCustom;
begin
  Result := Self;
  FOrder.Add(AValue);
  FOrder.TrimExcess;
end;

function TSetup4DDAOCustom.Query(const AValue: TFDQuery): ISetup4DDAOCustom;
begin
  Result:= Self;
  FQuery:= AValue;
end;

function TSetup4DDAOCustom.SQL(const AValue: string): ISetup4DDAOCustom;
begin
  Result := Self;
  FQuery.SQL.Add(AValue);
end;

function TSetup4DDAOCustom.TypeOrderBy(AValue: TOrderBy): ISetup4DDAOCustom;
begin
  Result := Self;
  FOrderType := AValue;
end;

function TSetup4DDAOCustom.Where(const AKey: String; const AValue: Variant;
  Const AComparison: TComparisonOperator;
  Const AOperator: TLogicalOperator): ISetup4DDAOCustom;
var
  LValueCondition : TValueCondition;
begin
  Result := Self;

  if AKey.Trim.IsEmpty then
    Exit;

  if AComparison = TComparisonOperator.Null then
    Exit;

  if AOperator = TLogicalOperator.NULL then
    Exit;


  LValueCondition.Value := AValue;
  LValueCondition.Comparison := AComparison;
  LValueCondition.Operator := AOperator;

  FWhere.Add(AKey, LValueCondition);
  FWhere.TrimExcess;
end;

function TSetup4DDAOCustom.Where(const AKey: String;
  const AValue: Variant): ISetup4DDAOCustom;
begin
  Result := Self;
  Where(AKey, AValue, TComparisonOperator.Equal, TLogicalOperator._AND);
end;

function TSetup4DDAOCustom.Where(const AKey: String; const AValue: Variant;
  Const AComparison: TComparisonOperator): ISetup4DDAOCustom;
begin
  Result := Self;
  Where(AKey, AValue, AComparison, TLogicalOperator._AND);
end;

end.
