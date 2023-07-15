{*******************************************************}
{                                                       }
{           DAO runtime library in pascal               }
{                  Control Types                        }
{                                                       }
{                                                       }
{             Copyright(c) 2010-2023                    }
{      Setup4D Consulting & Development,  Inc.          }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit Setup4D.DAO.Types;

interface

type
{$SCOPEDENUMS ON}

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Enumeração dos tipos de banco de dados suportados.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Enumeration of supported database types.
  /// </summary>
  {$ENDIF}
  TDatabaseTypes = (Null, ADS, Firebird, MySQL, SQLite, PG);

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// O Enumerado dod operadores de comparação são usados em condições que comparam
  /// uma expressão a outro valor ou expressão.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// The Enumerated dod comparison operators are used in conditions that compare
  /// an expression to another value or expression.
  /// </summary>
  {$ENDIF}
  TComparisonOperator = (Null, LessThan, Equal, GreaterThan, Different, DiferentPG, Like, LikePG, LessThanOREqual, GreaterThanOREqual);

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Enumeração das operações de CRUD suportadas.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Enumeration of supported CRUD operations.
  /// </summary>
  {$ENDIF}
  TCRUDOperation = (Null, Create, Read, Update, Delete);

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Enumeration of ordinances supported.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Enumeration of supported CRUD operations.
  /// </summary>
  {$ENDIF}
  TOrderBy = (Ascending, Descending);

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Tipos de operadores lógicos utilizados em expressões condicionais.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Types of logical operators used in conditional expressions.
  /// </summary>
  {$ENDIF}
  TLogicalOperator = (NULL, _AND, _OR, _AND_NOT, _OR_NOT);

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Modos de utilização do banco de dados SQLite que pode ser
  /// criado, ou Leitura, ou Leitura e escrita.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Modes of use of the SQLite database which can be either
  /// created, or Read, or Read and write.
  /// </summary>
  {$ENDIF}
  TOpenMode = (CreateUTF8, CreateUTF16, ReadWrite, ReadOnly);

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Modos de controle do banco de dados.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Database control modes.
  /// </summary>
  {$ENDIF}
  TLokingMode = (Exclusive, Normal);

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Tipos de criptografia utilizados para proteger os arquivos SQLite.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Encryption types used to protect SQLite files.
  /// </summary>
  {$ENDIF}
  TEncryptSQLite = (No, aes_128, aes_192, aes_256, aes_ctr_128, aes_ctr_256,
                    aes_ecb_128, aes_ecb_192, aes_ecb_256);


{$SCOPEDENUMS OFF}

implementation

end.

