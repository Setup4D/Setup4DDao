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

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Helper record para a enumeração TEncryptSQLite.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TEncryptSQLite enumeration.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOEncryptSQLiteOperatorHelper = record helper for TEncryptSQLite
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
  /// Helper record para a enumeração TOpenMode.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TOpenMode enumeration.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOOpenModeHelper = record helper for TOpenMode
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
  /// Helper record para a enumeração TLokingMode.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TLokingMode enumeration.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOLokingModeHelper = record helper for TLokingMode
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

{ TSetup4DDAOEncryptSQLiteOperatorHelper }

function TSetup4DDAOEncryptSQLiteOperatorHelper.ToString: string;
begin
  case self of
    TEncryptSQLite.No: Result := 'No';
    TEncryptSQLite.aes_128: Result := 'aes-128';
    TEncryptSQLite.aes_192: Result := 'aes-192';
    TEncryptSQLite.aes_256: Result := 'aes-256';
    TEncryptSQLite.aes_ctr_128: Result := 'aes-ctr-128';
    TEncryptSQLite.aes_ctr_256: Result := 'aes-ctr-256';
    TEncryptSQLite.aes_ecb_128: Result := 'aes-ecb-128';
    TEncryptSQLite.aes_ecb_192: Result := 'aes-ecb-192';
    TEncryptSQLite.aes_ecb_256: Result := 'aes-ecb-256';
  end;
end;

{ TSetup4DDAOOpenModeHelper }

function TSetup4DDAOOpenModeHelper.ToString: string;
begin
  case self of
    TOpenMode.CreateUTF8: Result := 'CreateUTF8';
    TOpenMode.CreateUTF16: Result := 'CreateUTF16';
    TOpenMode.ReadWrite: Result := 'ReadWrite';
    TOpenMode.ReadOnly: Result := 'ReadOnly';
  end;
end;

{ TSetup4DDAOLokingModeHelper }

function TSetup4DDAOLokingModeHelper.ToString: string;
begin
  case self of
    TLokingMode.Exclusive: Result := 'Exclusive';
    TLokingMode.Normal: Result := 'Normal';
  end;
end;

end.
