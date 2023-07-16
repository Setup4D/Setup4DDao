unit Setup4DDAO.Sample.Comum.Inicialization;

interface

uses
  Setup4D.DAO.Session;

var
  FDAOSetup : TSetup4DDAOSession;

implementation

uses
  Setup4D.DAO.Types,
  System.SysUtils;

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

  FDAOSetup.ConnectionParam.DatabaseName := '.\..\..\..\Comum\assets\DB\Setup4DDAOExemplo.dat';
  FDAOSetup.ConnectionParam.OpenMode :=  TOpenMode.ReadWrite;
  FDAOSetup.ConnectionParam.LockingMode :=  TLokingMode.Normal;
  FDAOSetup.ConnectionParam.EncryptSQLite :=  TEncryptSQLite.No;
  FDAOSetup.ConnectionParam.Password := EmptyStr;

{ //Configurar o ADS
  FDAOSetup.ConnectionParam.DatabaseName := ExtractFilePath(ParamStr(0));
}


finalization
  FDAOSetup.ReleaseInstance;

end.
