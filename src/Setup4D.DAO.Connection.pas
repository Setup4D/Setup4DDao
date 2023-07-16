unit Setup4D.DAO.Connection;

interface
uses
  Setup4D.DAO.Types,
  Setup4D.DAO.Interf,
  Setup4D.DAO.Session,

{$IFDEF FRAMEWORK_VCL}
  FireDAC.VCLUI.Wait,
{$ENDIF}
{$IFDEF FRAMEWORK_FMX}
  FireDAC.FMXUI.Wait,
{$ENDIF}
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.Phys,
  FireDAC.Comp.UI,
  FireDAC.UI.Intf,
  FireDAC.Phys.PG,
  FireDAC.Stan.Def,
  FireDAC.Phys.ADS,
  FireDAC.Stan.Intf,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.Phys.PGDef,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.ADSDef,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Stan.Option,
  FireDAC.Stan.ResStrs,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.PGWrapper,
  FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.ADSWrapper,
  FireDAC.Stan.StorageBin,
  FireDAC.Phys.MySQLWrapper,
  FireDAC.Phys.SQLiteWrapper,



  System.SysUtils;

type
  TSetup4DDAOConnection<T: Class> = class(TInterfacedObject, ISetup4DDAOConnection<T>)
  private
    FConnection: TFDConnection;
    FDriverPG: TFDPhysPgDriverLink;
    FDriverSQLite: TFDPhysSQLiteDriverLink;
    FDriverADS: TFDPhysADSDriverLink;

    FCursor: TFDGUIxWaitCursor;

  protected

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o tipo de banco de dados a ser utilizado na conexão do DAO.
    /// </summary>
    /// <param name="AValue">
    /// O tipo de banco de dados.
    /// </param>
    /// <returns>
    /// A instância do objeto de conexão do DAO.
    /// </returns>
    /// <remarks>
    /// Este método permite definir o tipo de banco de dados a ser utilizado na conexão do DAO,
    /// fornecendo uma forma de configurar a conexão de acordo com o banco de dados específico.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Sets the type of database to be used in the DAO connection.
    /// </summary>
    /// <param name="AValue">The type of database.</param>
    /// <returns>The instance of the DAO connection object.</returns>
    /// <remarks>
    /// This method allows setting the type of database to be used in the DAO connection,
    /// providing a way to configure the connection according to the specific database.
    /// </remarks>
    {$ENDIF}
    function SetDataBase(const AValue: TDatabaseTypes): ISetup4DDAOConnection<T>;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto de conexão associado ao DAO.
    /// </summary>
    /// <returns>
    /// O objeto de conexão associado ao DAO.
    /// </returns>
    /// <remarks>
    /// Este método retorna o objeto de conexão associado ao DAO,
    /// que pode ser usado para realizar operações e transações no banco de dados.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Retrieves the connection object associated with the DAO.
    /// </summary>
    /// <returns>The connection object associated with the DAO.</returns>
    /// <remarks>
    /// This method returns the connection object associated with the DAO,
    /// which can be used to perform database operations and transactions.
    /// </remarks>
    {$ENDIF}
    function GetConnection: TFDConnection;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto de consulta associado ao DAO.
    /// </summary>
    /// <returns>
    /// O objeto de consulta associado ao DAO.
    /// </returns>
    /// <remarks>
    /// Este método retorna o objeto de consulta associado ao DAO,
    /// que pode ser usado para executar consultas no banco de dados e obter dados.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Retrieves the query object associated with the DAO.
    /// </summary>
    /// <returns>The query object associated with the DAO.</returns>
    /// <remarks>
    /// This method returns the query object associated with the DAO,
    /// which can be used to execute database queries and retrieve data.
    /// </remarks>
    {$ENDIF}
    function GetQuery: TFDQuery;

    Constructor Create;
  public
    Destructor Destroy; override;
    class function New: ISetup4DDAOConnection<T>;
  end;

implementation

uses
  Setup4D.DAO.Helpers,
  Setup4D.DAO.Useful;

{ TSetup4DDAOConnection<T> }

function TSetup4DDAOConnection<T>.SetDataBase(
  Const AValue: TDatabaseTypes): ISetup4DDAOConnection<T>;
begin
  Result := Self;

  if AValue = TDatabaseTypes.Null then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.DatabaseUndefined);

  FConnection := TFDConnection.Create(nil);
  FCursor := TFDGUIxWaitCursor.Create(FConnection);

  FConnection.FetchOptions.Mode := TFDFetchMode.fmAll;
  FConnection.LoginPrompt := False;


  FConnection.Params.Clear;
  FConnection.DriverName := AValue.ToString;

  case AValue of
    TDatabaseTypes.Firebird,
    TDatabaseTypes.MySQL: raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.DatabaseNotImplemented);

    TDatabaseTypes.PG:
    begin
      FDriverPG := TFDPhysPgDriverLink.Create(FConnection);

      // Configurar as propriedades da conexão com o PostgreSQL
      FConnection.Params.Add(Format('Database=%s', [TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName]));

      FConnection.Params.Add(Format('Server=%s', [TSetup4DDAOSession.GetInstance.ConnectionParam.Host]));
      FConnection.Params.Add(Format('Port=%d', [TSetup4DDAOSession.GetInstance.ConnectionParam.Port]));
      FConnection.Params.Add(Format('User_Name=%s', [TSetup4DDAOSession.GetInstance.ConnectionParam.UserName]));
      FConnection.Params.Add(Format('Password=%s', [TSetup4DDAOSession.GetInstance.ConnectionParam.Password]));

    end;

    TDatabaseTypes.SQLite:
    begin
      {TODO -oRicardo  -cEncypt Banco de dados : Configurar a encriptação do banco de dados SQLite}
      FDriverSQLite := TFDPhysSQLiteDriverLink.Create(FConnection);

      FConnection.Params.Add(Format('Database=%s', [TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName]));
      FConnection.Params.Add(Format('OpenMode=%s', [TSetup4DDAOSession.GetInstance.ConnectionParam.OpenMode.ToString]));
      FConnection.Params.Add(Format('LockingMode=%s', [TSetup4DDAOSession.GetInstance.ConnectionParam.LockingMode.ToString]));

      if TSetup4DDAOSession.GetInstance.ConnectionParam.EncryptSQLite = TEncryptSQLite.No then
        Exit;

      FConnection.Params.Add(Format('Encrypt=%s', [TSetup4DDAOSession.GetInstance.ConnectionParam.EncryptSQLite.ToString]));
      FConnection.Params.Add(Format('Password=%s', [TSetup4DDAOSession.GetInstance.ConnectionParam.Password]));
    end;

    TDatabaseTypes.ADS:
    begin
      if TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName.Length > 0 then
      begin
        if not (Copy(TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName,
                 TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName.Length, 1) = '\') then
          TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName := Format('%s\',
            [TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName]);
      end;

      FDriverADS := TFDPhysADSDriverLink.Create(FConnection);
      FDriverADS.DefaultPath := TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName;
      FDriverADS.ShowDeleted := False;
      {$IFDEF WIN32}
      FDriverADS.VendorLib := Format('%sACE32.DLL', [TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName]);
      {$ENDIF}
      {$IFDEF WIN64}
      FDriverADS.VendorLib := Format('%sACE64.DLL', [TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName]);
      {$ENDIF}

      FConnection.Params.Add(Format('Database=%s', [TSetup4DDAOSession.GetInstance.ConnectionParam.DatabaseName]));
      FConnection.Params.Add('Protocol=TCPIP');
      FConnection.Params.Add('ServerTypes=Local');
      FConnection.Params.Add('CharacterSet=Ansi');
      FConnection.Params.Add('TableType=CDX');
      FConnection.Params.Add('Locking=Compatible');
    end;
  end;
end;

constructor TSetup4DDAOConnection<T>.Create;
begin

end;

destructor TSetup4DDAOConnection<T>.Destroy;
begin
  FConnection.Connected := False;
  FConnection.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  inherited;
end;

function TSetup4DDAOConnection<T>.GetConnection: TFDConnection;
begin
  if not Assigned(FConnection) then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.ConnectionError);

  Result := FConnection;
end;

function TSetup4DDAOConnection<T>.GetQuery: TFDQuery;
begin
  if not Assigned(FConnection) then
    raise Exception.Create(TSetup4DDAOSession.GetInstance.SystemMessage.ConnectionError);

  Result := TFDQuery.Create(Nil);
  Result.Connection := FConnection;
end;

class function TSetup4DDAOConnection<T>.New: ISetup4DDAOConnection<T>;
begin
  Result:= Self.Create;
end;

end.
