{*******************************************************}
{                                                       }
{           DAO runtime library in pascal               }
{               Entity system message                   }
{                                                       }
{                                                       }
{             Copyright(c) 2010-2023                    }
{      Setup4D Consulting & Development,  Inc.          }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit Setup4D.DAO.Entity.System.Message;

interface

type
  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Classe que representa as mensagens de sistema utilizadas pelo DAO.
  /// </summary>
  /// <remarks>
  /// Esta classe contém propriedades que armazenam as mensagens de sistema utilizadas pelo DAO.
  /// As mensagens podem ser personalizadas e utilizadas para fornecer informações e feedback ao usuário.
  /// </remarks>
  {$ELSE}
  /// <summary>
  /// Class that represents the system messages used by the DAO.
  /// </summary>
  /// <remarks>
  /// This class contains properties that store the system messages used by the DAO.
  /// The messages can be customized and used to provide information and feedback to the user.
  /// </remarks>
  {$ENDIF}
  TSetup4DDAOEntitySystemMessage = class
  private
    FConnectionError: string;
    FDatabaseUndefined: string;
    FDatabaseNotImplemented: string;
    FNoRecord: string;
    FRequiredField: string;
    FNoRecordReported: string;
    FNoField: string;
    FNoSelect: string;
    FOnlySelect: string;
    FQueryError: string;
  public
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mensagem de erro de conexão com o banco de dados.
    /// </summary>
    /// <value>A mensagem de erro de conexão com o banco de dados.</value>
    {$ELSE}
    /// <summary>
    /// Connection error message.
    /// </summary>
    /// <value>The connection error message.</value>
    {$ENDIF}
    property ConnectionError: string read FConnectionError write FConnectionError;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mensagem de erro da QUERY do banco de dados.
    /// </summary>
    /// <value>A mensagem de erro da query do banco de dados.</value>
    {$ELSE}
    /// <summary>
    /// Query error message.
    /// </summary>
    /// <value>The Query error message.</value>
    {$ENDIF}
    property QueryError: string read FQueryError write FQueryError;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mensagem de banco de dados não definido.
    /// </summary>
    /// <value>A mensagem de banco de dados não definido.</value>
    {$ELSE}
    /// <summary>
    /// Undefined database message.
    /// </summary>
    /// <value>The undefined database message.</value>
    {$ENDIF}
    property DatabaseUndefined: string read FDatabaseUndefined write FDatabaseUndefined;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mensagem de banco de dados não implementado.
    /// </summary>
    /// <value>A mensagem de banco de dados não implementado.</value>
    {$ELSE}
    /// <summary>
    /// Database not implemented message.
    /// </summary>
    /// <value>The database not implemented message.</value>
    {$ENDIF}
    property DatabaseNotImplemented: string read FDatabaseNotImplemented write FDatabaseNotImplemented;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mensagem de nenhum registro encontrado.
    /// </summary>
    /// <value>A mensagem de nenhum registro encontrado.</value>
    {$ELSE}
    /// <summary>
    /// No record found message.
    /// </summary>
    /// <value>The no record found message.</value>
    {$ENDIF}
    property NoRecord: string read FNoRecord write FNoRecord;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mensagem de campo obrigatório.
    /// </summary>
    /// <value>A mensagem de campo obrigatório.</value>
    {$ELSE}
    /// <summary>
    /// Required field message.
    /// </summary>
    /// <value>The required field message.</value>
    {$ENDIF}
    property RequiredField: string read FRequiredField write FRequiredField;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mensagem de nenhum registro informado.
    /// </summary>
    /// <value>A mensagem de nenhum registro informado.</value>
    {$ELSE}
    /// <summary>
    /// No record reported message.
    /// </summary>
    /// <value>The no record reported message.</value>
    {$ENDIF}
    property NoRecordReported: string read FNoRecordReported write FNoRecordReported;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mensagem de campo inexistente.
    /// </summary>
    /// <value>A mensagem de campo inexistente.</value>
    {$ELSE}
    /// <summary>
    /// No field message.
    /// </summary>
    /// <value>The no field message.</value>
    {$ENDIF}
    property NoField: string read FNoField write FNoField;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mensagem para quando não é um SELECT.
    /// </summary>
    /// <remarks>
    /// Quando o comando não represneta um select.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Message for when it is not a SELECT.
    /// </summary>
    /// <remarks>
    /// When the command does not represent a select.
    /// </remarks>
    {$ENDIF}
    property NoSelect: string read FNoSelect write FNoSelect;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mensagem para quando é um SELECT.
    /// </summary>
    /// <remarks>
    /// Quando o comando represneta um select.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Message for when it is a SELECT.
    /// </summary>
    /// <remarks>
    /// When the command represents a select.
    /// </remarks>
    {$ENDIF}
    property OnlySelect: string read FOnlySelect write FOnlySelect;

    

  end;
implementation

end.

