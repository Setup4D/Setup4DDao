{*******************************************************}
{                                                       }
{           DAO runtime library in pascal               }
{                 Session for DAO                       }
{                                                       }
{                                                       }
{             Copyright(c) 2010-2023                    }
{      Setup4D Consulting & Development,  Inc.          }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit Setup4D.DAO.Session;

interface

uses
  Setup4D.DAO.Entity.System.Message,
  Setup4D.DAO.Entity.Connection.Param;

type
  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Classe que representa a sessão do DAO.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Class that represents the DAO session.
  /// </summary>
  {$ENDIF}
  TSetup4DDAOSession = class
  private
    FSystemMessage: TSetup4DDAOEntitySystemMessage;
    FConnectionParam: TSetup4DDAOEntityConnectionParam;
  public
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna a instância da sessão do DAO.
    /// </summary>
    /// <returns>
    /// A instância da sessão do DAO.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Returns the instance of the DAO session.
    /// </summary>
    /// <returns>
    /// The instance of the DAO session.
    /// </returns>
    {$ENDIF}
    class function GetInstance: TSetup4DDAOSession;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Libera a instância da sessão do DAO.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Releases the instance of the DAO session.
    /// </summary>
    {$ENDIF}
    class procedure ReleaseInstance;

    property SystemMessage: TSetup4DDAOEntitySystemMessage read FSystemMessage write FSystemMessage;
    property ConnectionParam: TSetup4DDAOEntityConnectionParam read FConnectionParam write FConnectionParam;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

var
  FInstance: TSetup4DDAOSession;

constructor TSetup4DDAOSession.Create;
begin
  FSystemMessage := TSetup4DDAOEntitySystemMessage.Create;

  {$IFDEF HAS_PORTUGUES}
  FSystemMessage.ConnectionError := 'Não foi fornecido o nome do banco de dados.';
  FSystemMessage.QueryError := 'Não foi fornecido uma QUERY do banco de dados.';
  FSystemMessage.DatabaseUndefined := 'Nenhum banco de dados foi definido.';
  FSystemMessage.DatabaseNotImplemented := 'O banco de dados ainda não foi implementado no DAO.';
  FSystemMessage.NoRecord := 'Nenhum registro foi encontrado.';
  FSystemMessage.RequiredField := 'O campo %s é obrigatório.';
  FSystemMessage.NoRecordReported := 'Nenhum registro foi fornecido.';
  FSystemMessage.NoField := 'Falta o %s no registro.';
  FSystemMessage.NoSelect := 'Não é possível executar o comando SELECT.';
  FSystemMessage.OnlySelect := 'Esta opção permite apenas a abertura do comando SELECT.';
  {$ELSE}
  FSystemMessage.ConnectionError := 'The name of the database was not given.';
  FSystemMessage.QueryError := 'A QUERY from the database has not been provided.';
  FSystemMessage.DatabaseUndefined := 'No database has been defined.';
  FSystemMessage.DatabaseNotImplemented := 'The database has not yet been implemented in the DAO.';
  FSystemMessage.NoRecord := 'No record was found.';
  FSystemMessage.RequiredField := 'The %s field is required.';
  FSystemMessage.NoRecordReported := 'No record was provided.';
  FSystemMessage.NoField := 'The %s is missing in the registry.';
  FSystemMessage.NoSelect := 'You cannot execute the SELECT command.';
  FSystemMessage.OnlySelect := 'This option allows only the SELECT command to be opened.';
  {$ENDIF}

  FConnectionParam := TSetup4DDAOEntityConnectionParam.Create;
end;

destructor TSetup4DDAOSession.Destroy;
begin
  FConnectionParam.Free;
  FSystemMessage.Free;
  inherited;
end;

class function TSetup4DDAOSession.GetInstance: TSetup4DDAOSession;
begin
  if not Assigned(FInstance) then
    FInstance := TSetup4DDAOSession.Create;

  Result := FInstance;
end;

class procedure TSetup4DDAOSession.ReleaseInstance;
begin
  if Assigned(FInstance) then
    FInstance.Free;
end;

end.
