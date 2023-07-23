unit Setup4DDAO.Sample.View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.Classes,
  System.SysUtils,
  System.Variants,

  Vcl.Mask,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TPageMain = class(TForm)
    gbPercistir: TGroupBox;
    edtPersistID: TLabeledEdit;
    edtPersistNome: TLabeledEdit;
    edtPersistOcultar: TLabeledEdit;
    edtPersistEmail: TLabeledEdit;
    btinserir: TButton;
    btMudar: TButton;
    btApagar: TButton;
    btClearList: TButton;
    Memo: TMemo;
    edtFiltroOperador: TLabeledEdit;
    cbxOperador: TComboBox;
    btFiltroOperador: TButton;
    btFiltrar: TButton;
    edtFiltro: TLabeledEdit;
    edtID: TLabeledEdit;
    btPesquisarID: TButton;
    lblOperador: TLabel;
    PageControl: TPageControl;
    tsRTTi: TTabSheet;
    tsCustom: TTabSheet;
    MemoCustom: TMemo;
    edtSelect: TLabeledEdit;
    edtWhereKey: TLabeledEdit;
    cbxWhere: TComboBox;
    edtWhereValue: TLabeledEdit;
    edtGroupBy: TLabeledEdit;
    edtOrderBy: TLabeledEdit;
    cbxOrder: TComboBox;
    edtJOIN: TLabeledEdit;
    lblOrderBy: TLabel;
    lblWhereCodition: TLabel;
    pnlBotao: TPanel;
    btOpen: TButton;
    btExecutar: TButton;
    cbxOperadorLogico: TComboBox;
    lblOperadorLogico: TLabel;
    cbxBancoDados: TComboBox;
    procedure btClearListClick(Sender: TObject);
    procedure btPesquisarIDClick(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure btFiltroOperadorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btinserirClick(Sender: TObject);
    procedure edtSelectExit(Sender: TObject);
    procedure edtSelectEnter(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure btExecutarClick(Sender: TObject);
    procedure cbxBancoDadosSelect(Sender: TObject);
  private
    procedure HabilitarBotao;
    procedure DesabilitarBotao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageMain: TPageMain;

implementation
uses
  Setup4D.DAO,
  Setup4D.DAO.Types,
  Setup4D.DAO.Useful,
  Setup4D.DAO.Interf,
  Setup4DDAO.Sample.Comum.Cliente,
  Setup4DDAO.Sample.Comum.Librarys,
  Setup4DDAO.Sample.Comum.Inicialization;

{$R *.dfm}

procedure TPageMain.btClearListClick(Sender: TObject);
begin
  Memo.Lines.Clear;
end;

procedure TPageMain.btExecutarClick(Sender: TObject);
begin
  MemoCustom.Lines.Clear;
  try
    case cbxBancoDados.ItemIndex of
      0 :
      begin
        TSetup4DDAO<TCliente>
          .New
            .PGDatabase
              .Custom
                .ClearSQL
                .SQL(edtSelect.Text)
                .ClearWhere
                .Where(edtWhereKey.Text, edtWhereValue.Text)
              .Execute;

      end;

      1 :
      begin
        TSetup4DDAO<TCliente>
          .New
            .SQLiteDatabase
              .Custom
                .ClearSQL
                .SQL(edtSelect.Text)
                .ClearWhere
                .Where(edtWhereKey.Text, edtWhereValue.Text)
              .Execute;

      end;

      2 :
      begin
        TSetup4DDAO<TCliente>
          .New
            .ADSDatabase
              .Custom
                .ClearSQL
                .SQL(edtSelect.Text)
                .ClearWhere
                .Where(edtWhereKey.Text, edtWhereValue.Text)
              .Execute;

      end;

      3 :
      begin
        TSetup4DDAO<TCliente>
          .New
            .FBDatabase
              .Custom
                .ClearSQL
                .SQL(edtSelect.Text)
                .ClearWhere
                .Where(edtWhereKey.Text, edtWhereValue.Text)
              .Execute;

      end;

      4 :
      begin
        TSetup4DDAO<TCliente>
          .New
            .MySQLDatabase
              .Custom
                .ClearSQL
                .SQL(edtSelect.Text)
                .ClearWhere
                .Where(edtWhereKey.Text, edtWhereValue.Text)
              .Execute;

      end;
    else
      raise Exception.Create('Banco de dados não definido');
    end;

    MemoCustom.Lines.Add('..:: Procedimento executado ::..')
  except
    on E: Exception do
      ShowMessage(E.Message)
  end;
end;

procedure TPageMain.btFiltrarClick(Sender: TObject);
var
  LDAO: ISetup4DDAO<TCliente>;
  LDAOs: ISetup4DDAO<TClientes>;
begin
  try
    if cbxBancoDados.ItemIndex = 2 then
    begin
      LDAOs := TSetup4DDAO<TClientes>
                  .New
                    .ADSDatabase
                    .NoValidateWithException
                      .Find('Nome', edtFiltro.Text);

      TComumLibrarys.PopularMemo(Memo, LDAOs);

      Exit;
    end;

    LDAO := TSetup4DDAO<TCliente>.New;

    case cbxBancoDados.ItemIndex of
     0 : LDAO.PGDatabase;
     1 : LDAO.SQLiteDatabase;
     2 : LDAO.ADSDatabase;
     3 : LDAO.FBDatabase;
     4 : LDAO.MySQLDatabase;
    else
      raise Exception.Create('Banco de dados não definido');
    end;

    LDAO.NoValidateWithException.Find('Nome', edtFiltro.Text);

    TComumLibrarys.PopularMemo(Memo, LDAO);
  except
    on E: Exception do
      ShowMessage(E.Message)
  end;

end;

procedure TPageMain.btFiltroOperadorClick(Sender: TObject);
var
  LDAO: ISetup4DDAO<TCliente>;
  LComparison: TComparisonOperator;
  LCliente : TCliente;
  LClientes : TClientes;
  LDAOs: ISetup4DDAO<TClientes>;
begin
  try
    LComparison := TSetup4DDAOEnumeratedTypes<TComparisonOperator>.StringToEnum
      (cbxOperador.Items[cbxOperador.ItemIndex]);


    if cbxBancoDados.ItemIndex = 2 then
    begin
      LDAOs := TSetup4DDAO<TClientes>
                  .New
                    .ADSDatabase
                      .Find('Nome',edtFiltroOperador.Text, LComparison);

      for LClientes in LDAOs.GetClassList do
        TComumLibrarys.PopularMemo(Memo, LClientes);

      Exit;
    end;

    LDAO := TSetup4DDAO<TCliente>.New;

    case cbxBancoDados.ItemIndex of
     0 : LDAO.PGDatabase;
     1 : LDAO.SQLiteDatabase;
     2 : LDAO.ADSDatabase;
     3 : LDAO.FBDatabase;
     4 : LDAO.MySQLDatabase;
    else
      raise Exception.Create('Banco de dados não definido');
    end;

    LDAO.Find('Nome',edtFiltroOperador.Text, LComparison);

    for LCliente in LDAO.GetClassList do
      TComumLibrarys.PopularMemo(Memo, LCliente);
  except
    on E: Exception do
      ShowMessage(E.Message)
  end;

end;

procedure TPageMain.btinserirClick(Sender: TObject);
begin
  TComumLibrarys.Persistir(
    Memo,
    TButton(Sender),
    edtPersistID.Text,
    edtPersistNome.Text,
    edtPersistEmail.Text,
    edtPersistOcultar.Text,
    cbxBancoDados.ItemIndex,
    (not (cbxBancoDados.ItemIndex = 2)));
end;

procedure TPageMain.btOpenClick(Sender: TObject);
var
  LDAO: ISetup4DDAOCustom<TCliente>;
  LComparison: TComparisonOperator;
  LOperator: TLogicalOperator;
  LOrder: TOrderBy;
begin
  MemoCustom.Lines.Clear;

  try
    case cbxBancoDados.ItemIndex of
     0 : LDAO := TSetup4DDAO<TCliente>.New.PGDatabase.Custom;
     1 : LDAO := TSetup4DDAO<TCliente>.New.SQLiteDatabase.Custom;
     2 : LDAO := TSetup4DDAO<TCliente>.New.ADSDatabase.Custom;
     3 : LDAO := TSetup4DDAO<TCliente>.New.FBDatabase.Custom;
     4 : LDAO := TSetup4DDAO<TCliente>.New.MySQLDatabase.Custom;
    else
      raise Exception.Create('Banco de dados não definido');
    end;

    LDAO
      .ClearSQL
      .SQL(edtSelect.Text);

    //Filtrar sem utilizar o operador e codição
    if ((cbxOperadorLogico.ItemIndex = 0) and (cbxWhere.ItemIndex = 0)) then
    begin
      if  ((not edtWhereKey.EditText.Trim.IsEmpty) and (not edtWhereValue.EditText.Trim.IsEmpty)) then
      begin
        LDAO
          .ClearWhere
          .Where(edtWhereKey.Text, edtWhereValue.Text);
      end;
    end;

    //Filtrar sem utilizar o operador e com codição
    if ((cbxOperadorLogico.ItemIndex = 0) and (cbxWhere.ItemIndex > 0)) then
    begin
      if ((not edtWhereKey.EditText.Trim.IsEmpty) and (not edtWhereValue.EditText.Trim.IsEmpty)) then
      begin
        LComparison := TSetup4DDAOEnumeratedTypes<TComparisonOperator>.StringToEnum
          (cbxWhere.Items[cbxWhere.ItemIndex]);

        LDAO
          .ClearWhere
          .Where(edtWhereKey.Text, edtWhereValue.Text, LComparison);
      end;
    end;

    //Filtrar com operador e codição
    if ((cbxOperadorLogico.ItemIndex > 0) and (cbxWhere.ItemIndex > 0)) then
    begin
      if ((not edtWhereKey.EditText.Trim.IsEmpty) and (not edtWhereValue.EditText.Trim.IsEmpty)) then
      begin
        LComparison := TSetup4DDAOEnumeratedTypes<TComparisonOperator>.StringToEnum
          (cbxWhere.Items[cbxWhere.ItemIndex]);

        LOperator := TSetup4DDAOEnumeratedTypes<TLogicalOperator>.StringToEnum
          (cbxOperadorLogico.Items[cbxOperadorLogico.ItemIndex]);

        LDAO
          .ClearWhere
          .Where(edtWhereKey.Text, edtWhereValue.Text, LComparison, LOperator);
      end;
    end;

    //Group BY
    if not edtGroupBy.EditText.Trim.IsEmpty then
    begin
      LDAO
        .ClearGroupBy
        .GroupBy(edtGroupBy.Text);
    end;

    //Order BY
    if not edtOrderBy.EditText.Trim.IsEmpty then
    begin
      LOrder := TSetup4DDAOEnumeratedTypes<TOrderBy>.StringToEnum
        (cbxOrder.Items[cbxOrder.ItemIndex]);

      LDAO
        .ClearOrderBy
        .TypeOrderBy(LOrder)
        .OrderBy(edtOrderBy.Text);
    end;

    //JOIN
    if not edtJOIN.EditText.Trim.IsEmpty then
    begin
      LDAO
        .ClearJoin
        .Join(edtJOIN.Text);
    end;

    LDAO
      .Open;

    MemoCustom.Lines.Add(LDAO.AsJSONJSONArrayString);
  except
    on E: Exception do
      ShowMessage(E.Message)
  end;
end;

procedure TPageMain.btPesquisarIDClick(Sender: TObject);
var
  LDAO: ISetup4DDAO<TCliente>;
  LDAOs: ISetup4DDAO<TClientes>;
begin
  try
    if cbxBancoDados.ItemIndex = 2 then
    begin
      LDAOs := TSetup4DDAO<TClientes>
                  .New
                    .ADSDatabase
                      .FindID(edtID.Text);

      TComumLibrarys.PopularMemo(Memo, LDAOs);

      Exit;
    end;

    LDAO := TSetup4DDAO<TCliente>.New;

    case cbxBancoDados.ItemIndex of
     0 : LDAO.PGDatabase;
     1 : LDAO.SQLiteDatabase;
     2 : LDAO.ADSDatabase;
     3 : LDAO.FBDatabase;
     4 : LDAO.MySQLDatabase;
    else
      raise Exception.Create('Banco de dados não definido');
    end;

    LDAO.FindID(StrToInt64Def(edtID.Text, 0));

    TComumLibrarys.PopularMemo(Memo, LDAO);
  except
    on E: Exception do
      ShowMessage(E.Message)
  end;

end;

procedure TPageMain.cbxBancoDadosSelect(Sender: TObject);
begin
  case TComboBox(Sender).ItemIndex of
    0:
    begin
      raise Exception.Create('Defina os dados do servidor PG');
      { //Configurar o Postgree
        FDAOSetup.ConnectionParam.Host := HOST;
        FDAOSetup.ConnectionParam.Port := PORT;
        FDAOSetup.ConnectionParam.DatabaseName := BANCO DE DADOS;
        FDAOSetup.ConnectionParam.UserName := USUARIO;
        FDAOSetup.ConnectionParam.Password := SENHA;
      }
    end;

    1:
    begin
      FDAOSetup.ConnectionParam.DatabaseName := '.\..\..\..\Comum\assets\DB\Setup4DDAOExemplo.dat';
      FDAOSetup.ConnectionParam.OpenModeSQLite :=  TOpenModeSQLite.ReadWrite;
      FDAOSetup.ConnectionParam.LockingMode :=  TLokingMode.Normal;
      FDAOSetup.ConnectionParam.EncryptSQLite :=  TEncryptSQLite.No;
      FDAOSetup.ConnectionParam.Password := EmptyStr;
    end;

    2:
    begin
      FDAOSetup.ConnectionParam.DatabaseName := '.\..\..\..\Comum\assets\DB\';
    end;

    3:
    begin
      FDAOSetup.ConnectionParam.DatabaseName := '.\..\..\..\Comum\assets\DB\SETUP4DDAOEXEMPLO.FDB';
      FDAOSetup.ConnectionParam.UserName := 'SYSDBA';
      FDAOSetup.ConnectionParam.Password := 'masterkey';
      FDAOSetup.ConnectionParam.Protocol := TProtocol.Local;
      FDAOSetup.ConnectionParam.Host := EmptyStr;
      FDAOSetup.ConnectionParam.Port := 0;
      FDAOSetup.ConnectionParam.CharacterSetFB := TCharacterSetFB.ISO8859_1;
      FDAOSetup.ConnectionParam.OpenModeFB := TOpenModeFB.Open;
    end;

    4:
    begin
      raise Exception.Create('Defina os dados do servidor MySQL');
      { //Configurar o Postgree
        FDAOSetup.ConnectionParam.Host := HOST;
        FDAOSetup.ConnectionParam.Port := PORT;
        FDAOSetup.ConnectionParam.DatabaseName := BANCO DE DADOS;
        FDAOSetup.ConnectionParam.UserName := USUARIO;
        FDAOSetup.ConnectionParam.Password := SENHA;
      }
    end;

  else
    raise Exception.Create('Banco de dados não previsto.');
  end;
end;

procedure TPageMain.edtSelectEnter(Sender: TObject);
begin
  DesabilitarBotao;
end;

procedure TPageMain.edtSelectExit(Sender: TObject);
begin
  HabilitarBotao;
end;

procedure TPageMain.HabilitarBotao;
begin
  btExecutar.Visible := not TSetup4DDAOUseful.WordExistsInString(edtSelect.Text, 'SELECT');
  btOpen.Visible := TSetup4DDAOUseful.WordExistsInString(edtSelect.Text, 'SELECT');
end;

procedure TPageMain.DesabilitarBotao;
begin
  btExecutar.Visible := False;
  btOpen.Visible := False;
end;

procedure TPageMain.FormCreate(Sender: TObject);
begin
  TSetup4DDAOEnumeratedTypes<TComparisonOperator>.EnumToList(cbxOperador.Items);
  cbxOperador.ItemIndex := 1;

  TSetup4DDAOEnumeratedTypes<TComparisonOperator>.EnumToList(cbxWhere.Items);
  cbxWhere.ItemIndex := 2;

  TSetup4DDAOEnumeratedTypes<TOrderBy>.EnumToList(cbxOrder.Items);
  cbxOrder.ItemIndex := 0;

  TSetup4DDAOEnumeratedTypes<TLogicalOperator>.EnumToList(cbxOperadorLogico.Items);
  cbxOperadorLogico.ItemIndex := 1;

  cbxBancoDados.ItemIndex := 1;

  HabilitarBotao;
  PageControl.ActivePage:= tsRTTi;

  HabilitarBotao;

end;

end.
