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

  //Configura SQLite
  FDAOSetup.ConnectionParam.DatabaseName := '.\..\..\..\Comum\assets\DB\Setup4DDAOExemplo.dat';
  FDAOSetup.ConnectionParam.OpenModeSQLite :=  TOpenModeSQLite.ReadWrite;
  FDAOSetup.ConnectionParam.LockingMode :=  TLokingMode.Normal;
  FDAOSetup.ConnectionParam.EncryptSQLite :=  TEncryptSQLite.No;
  FDAOSetup.ConnectionParam.Password := EmptyStr;

{ //Configurar o ADS
  FDAOSetup.ConnectionParam.DatabaseName := ExtractFilePath(ParamStr(0));
}

{  //Configure Firebird
  FDAOSetup.ConnectionParam.DatabaseName := '.\..\..\..\Comum\assets\DB\SETUP4DDAOEXEMPLO.FDB';
  FDAOSetup.ConnectionParam.UserName := 'SYSDBA';
  FDAOSetup.ConnectionParam.Password := 'masterkey';
  FDAOSetup.ConnectionParam.Protocol := TProtocol.Local;
  FDAOSetup.ConnectionParam.Host := EmptyStr;
  FDAOSetup.ConnectionParam.Port := 0;
  FDAOSetup.ConnectionParam.CharacterSetFB := TCharacterSetFB.ISO8859_1;
  FDAOSetup.ConnectionParam.OpenModeFB := TOpenModeFB.Open;   }

{  //Configure MySQL
  FDAOSetup.ConnectionParam.Host := HOST;
  FDAOSetup.ConnectionParam.Port := PORT;
  FDAOSetup.ConnectionParam.DatabaseName := BANCO DE DADOS;
  FDAOSetup.ConnectionParam.UserName := USUARIO;
  FDAOSetup.ConnectionParam.Password := SENHA;
}


finalization
  FDAOSetup.ReleaseInstance;

end.
