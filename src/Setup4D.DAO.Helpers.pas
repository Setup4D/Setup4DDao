{*******************************************************}
{                                                       }
{           DAO runtime library in pascal               }
{                      DAO HELPERS                      }
{                                                       }
{                                                       }
{             Copyright(c) 2010-2023                    }
{      Setup4D Consulting & Development,  Inc.          }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit Setup4D.DAO.Helpers;

interface

uses
  Setup4D.DAO.Types;

type
  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Helper record para a enumeração TSymbol.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TSymbol enumeration.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOSymbolHelper = record helper for TComparisonOperator
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Converte o valor da enumeração em uma string.
    /// </summary>
    /// <returns>
    /// A string correspondente ao valor da enumeração.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Converts the enumeration value to a string.
    /// </summary>
    /// <returns>
    /// The string corresponding to the enumeration value.
    /// </returns>
    {$ENDIF}
    function ToString: string;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Helper record para a enumeração TDatabaseTypes.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TDatabaseTypes enumeration.
  /// </summary>
  {$ENDIF}

  TSetup4DDAODatabaseTypesHelper = record helper for TDatabaseTypes
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Converte o valor da enumeração em uma string.
    /// </summary>
    /// <returns>
    /// A string correspondente ao valor da enumeração.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Converts the enumeration value to a string.
    /// </summary>
    /// <returns>
    /// The string corresponding to the enumeration value.
    /// </returns>
    {$ENDIF}
    function ToString: string;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Helper record para a enumeração TOrderBy.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TOrderBy enumeration.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOOrderByHelper = record helper for TOrderBy
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Converte o valor da enumeração em uma string.
    /// </summary>
    /// <returns>
    /// A string correspondente ao valor da enumeração.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Converts the enumeration value to a string.
    /// </summary>
    /// <returns>
    /// The string corresponding to the enumeration value.
    /// </returns>
    {$ENDIF}
    function ToString: string;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Helper record para a enumeração TLogicalOperator.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TLgicalOperator enumeration.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOLogicalOperatorHelper = record helper for TLogicalOperator
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Converte o valor da enumeração em uma string.
    /// </summary>
    /// <returns>
    /// A string correspondente ao valor da enumeração.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Converts the enumeration value to a string.
    /// </summary>
    /// <returns>
    /// The string corresponding to the enumeration value.
    /// </returns>
    {$ENDIF}
    function ToString: string;
  end;

implementation

uses
  System.SysUtils;


{ TSetup4DDAOSymboltHelper }

function TSetup4DDAOSymbolHelper.ToString: string;
begin
  case Self of
    TComparisonOperator.LessThan:
      Result := '<';
    TComparisonOperator.Equal:
      Result := '=';
    TComparisonOperator.GreaterThan:
      Result := '>';
    TComparisonOperator.DiferentPG:
      Result := '!=';
    TComparisonOperator.Different:
      Result := '<>';
    TComparisonOperator.Like:
      Result := 'like';
    TComparisonOperator.LikePG:
      Result := '~*';
    TComparisonOperator.LessThanOREqual:
      Result := '<=';
    TComparisonOperator.GreaterThanOREqual:
      Result := '>=';
  end;
end;

{ TSetup4DDAODatabaseTypesHelper }

function TSetup4DDAODatabaseTypesHelper.ToString: string;
begin
  case Self of
    TDatabaseTypes.Null:
      Result := '';
    TDatabaseTypes.ADS:
      Result := 'ADS';
    TDatabaseTypes.Firebird:
      Result := 'FB';
    TDatabaseTypes.MySQL:
      Result := 'MySQL';
    TDatabaseTypes.SQLite:
      Result := 'SQLite';
    TDatabaseTypes.PG:
      Result := 'PG';
  end;
end;

{ TSetup4DDAOOrderByHelper }

function TSetup4DDAOOrderByHelper.ToString: string;
begin
  case Self of
    TOrderBy.Ascending:
      Result := 'asc';
    TOrderBy.Descending:
      Result := 'desc';
  end;
end;


{ TSetup4DDAOLogicalOperatorHelper }

function TSetup4DDAOLogicalOperatorHelper.ToString: string;
begin
  case Self of
    TLogicalOperator.NULL: Result := EmptyStr;
    TLogicalOperator._AND: Result := 'AND';
    TLogicalOperator._OR: Result := 'OR';
    TLogicalOperator._AND_NOT: Result := 'AND NOT';
    TLogicalOperator._OR_NOT: Result := 'OR NOT';
  end;
end;

end.
