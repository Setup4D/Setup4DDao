unit Setup4DDAO.Sample.Comum.Inicialization;

interface

uses
  Setup4D.DAO.Session;

var
  FDAOSetup : TSetup4DDAOSession;

implementation

Initialization
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  FDAOSetup:= TSetup4DDAOSession.GetInstance;
{ //Configurar o Postgree
  FDAOSetup.ConnectionParam.Host := HOST;
  FDAOSetup.ConnectionParam.Port := PORT;
  FDAOSetup.ConnectionParam.DatabaseName := BANCO DE DADOS;
  FDAOSetup.ConnectionParam.UserName := USUARIO;
  FDAOSetup.ConnectionParam.Password := SENHA;
}
finalization
  FDAOSetup.ReleaseInstance;

end.
