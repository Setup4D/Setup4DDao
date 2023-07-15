{*******************************************************}
{                                                       }
{           DAO runtime library in pascal               }
{               Entity connection param                 }
{                                                       }
{                                                       }
{             Copyright(c) 2010-2023                    }
{      Setup4D Consulting & Development,  Inc.          }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit Setup4D.DAO.Entity.Connection.Param;

interface

uses
  Setup4D.DAO.Types;
type
  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Classe que representa os parâmetros de conexão utilizados pelo DAO.
  /// </summary>
  /// <remarks>
  /// Esta classe contém propriedades que armazenam os parâmetros de conexão utilizados pelo DAO.
  /// Os parâmetros podem ser definidos para estabelecer a conexão com a fonte de dados.
  /// </remarks>
  {$ELSE}
  /// <summary>
  /// Class that represents the connection parameters used by the DAO.
  /// </summary>
  /// <remarks>
  /// This class contains properties that store the connection parameters used by the DAO.
  /// The parameters can be set to establish the connection with the data source.
  /// </remarks>
  {$ENDIF}
  TSetup4DDAOEntityConnectionParam = class
  private
    FHost: string;
    FPort: Integer;
    FDatabaseName: string;
    FUserName: string;
    FPassword: string;
    FOpenMode: TOpenMode;
    FLockingMode: TLokingMode;
    FEncryptSQLite: TEncryptSQLite;
  public
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Nome do host utilizado para a conexão.
    /// </summary>
    /// <value>O nome do host utilizado para a conexão.</value>
    {$ELSE}
    /// <summary>
    /// Host name used for the connection.
    /// </summary>
    /// <value>The host name used for the connection.</value>
    {$ENDIF}
    property Host: string read FHost write FHost;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Porta utilizada para a conexão.
    /// </summary>
    /// <value>A porta utilizada para a conexão.</value>
    {$ELSE}
    /// <summary>
    /// Port used for the connection.
    /// </summary>
    /// <value>The port used for the connection.</value>
    {$ENDIF}
    property Port: Integer read FPort write FPort;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Nome do banco de dados utilizado para a conexão.
    /// </summary>
    /// <value>O nome do banco de dados utilizado para a conexão.</value>
    {$ELSE}
    /// <summary>
    /// Database name used for the connection.
    /// </summary>
    /// <value>The database name used for the connection.</value>
    {$ENDIF}
    property DatabaseName: string read FDatabaseName write FDatabaseName;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Nome de usuário utilizado para a conexão.
    /// </summary>
    /// <value>O nome de usuário utilizado para a conexão.</value>
    {$ELSE}
    /// <summary>
    /// User name used for the connection.
    /// </summary>
    /// <value>The user name used for the connection.</value>
    {$ENDIF}
    property UserName: string read FUserName write FUserName;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Senha utilizada para a conexão.
    /// </summary>
    /// <value>A senha utilizada para a conexão.</value>
    {$ELSE}
    /// <summary>
    /// Password used for the connection.
    /// </summary>
    /// <value>The password used for the connection.</value>
    {$ENDIF}
    property Password: string read FPassword write FPassword;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Modo de abertura do arquivo SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// SQLite file open mode.
    /// </summary>
    {$ENDIF}
    property OpenMode: TOpenMode read FOpenMode write FOpenMode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Modo de bloqueio do arquivo SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// SQLite file locking mode.
    /// </summary>
    {$ENDIF}
    property LockingMode: TLokingMode read FLockingMode write FLockingMode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Tipo de criptografia do arquivo SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// SQLite file encryption type.
    /// </summary>
    {$ENDIF}
    property EncryptSQLite: TEncryptSQLite read FEncryptSQLite write FEncryptSQLite;
  end;
implementation

end.
