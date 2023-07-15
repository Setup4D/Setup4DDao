{*******************************************************}
{                                                       }
{           DAO runtime library in pascal               }
{                      DAO RECORDS                      }
{                                                       }
{                                                       }
{             Copyright(c) 2010-2023                    }
{      Setup4D Consulting & Development,  Inc.          }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit Setup4D.DAO.Records;

interface

uses
  Setup4D.DAO.Types;
type
  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Estrutura de dados que representa uma condição de valor para a cláusula WHERE.
  /// </summary>
  /// <remarks>
  /// A estrutura contém os seguintes campos:
  /// - Value: O valor da condição
  /// - Condition: A condição da cláusula WHERE
  /// - Operator: Operador logical da cláusula WHERE
  /// </remarks>
  {$ELSE}
  /// <summary>
  /// Data structure that represents a value Comparison for the WHERE clause.
  /// </summary>
  /// <remarks>
  /// The structure contains the following fields:
  /// - Value: The value of the Comparison
  /// - Comparison: The Comparison of the WHERE clause
  /// - Operator: Logical operator of the WHERE clause
  /// </remarks>
  {$ENDIF}
  TValueCondition = record
    Value: Variant;
    Comparison: TComparisonOperator;
    Operator: TLogicalOperator;
  end;
implementation

end.
