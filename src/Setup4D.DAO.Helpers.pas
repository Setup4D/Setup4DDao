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
  TSetup4DDAOOpenModeSQLiteHelper = record helper for TOpenModeSQLite
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

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Helper record para a enumeração TProtocol.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TProtocol enumeration.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOProtocolHelper = record helper for TProtocol
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
  /// Helper record para a enumeração TCharacterSetFB.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TCharacterSetFB enumeration.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOCharacterSetFBHelper = record helper for TCharacterSetFB
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
  /// Helper record para a enumeração TColleteFB.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TColleteFB enumeration.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOColleteFBHelper = record helper for TColleteFB
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
  /// Helper record para a enumeração TOpenModeFB.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Helper record for the TOpenModeFB enumeration.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOOpenModeFBHelper = record helper for TOpenModeFB
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
    TComparisonOperator.DifferentPG:
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

function TSetup4DDAOOpenModeSQLiteHelper.ToString: string;
begin
  case self of
    TOpenModeSQLite.CreateUTF8: Result := 'CreateUTF8';
    TOpenModeSQLite.CreateUTF16: Result := 'CreateUTF16';
    TOpenModeSQLite.ReadWrite: Result := 'ReadWrite';
    TOpenModeSQLite.ReadOnly: Result := 'ReadOnly';
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

{ TSetup4DDAOProtocolHelper }

function TSetup4DDAOProtocolHelper.ToString: string;
begin
  case Self of
    TProtocol.null: Result:= EmptyStr;
    TProtocol.Local: Result:= 'Local';
    TProtocol.TCPIP: Result:= 'TCPIP';
    TProtocol.NetBEUI: Result:= 'NetBEUI';
    TProtocol.SPX: Result:= 'SPX';
  end;
end;

{ TSetup4DDAOCharacterSetFBHelper }

function TSetup4DDAOCharacterSetFBHelper.ToString: string;
begin
  case Self of
    TCharacterSetFB.null: Result := EmptyStr;
    TCharacterSetFB.ISO8859_1: Result := 'ISO8859_1';
    TCharacterSetFB.WIN1252: Result := 'WIN1252';
  end;
end;

{ TSetup4DDAOColleteFBHelper }

function TSetup4DDAOColleteFBHelper.ToString: string;
begin
  case Self of
    TColleteFB.null: Result := EmptyStr;
    TColleteFB.PT_BR: Result := 'PT_BR';
    TColleteFB.ISO8859_1: Result := 'ISO8859_1';
    TColleteFB.WIN_PTBR: Result := 'WIN_PTBR';
    TColleteFB.WIN1252: Result := 'WIN1252';
  end;
end;

{ TSetup4DDAOOpenModeFBHelper }

function TSetup4DDAOOpenModeFBHelper.ToString: string;
begin
  case self of
    TOpenModeFB.Open: Result := 'Open';
    TOpenModeFB.Create: Result := 'Create';
    TOpenModeFB.OpenOrCreate: Result := 'OpenOrCreate';
  end;
end;

end.
