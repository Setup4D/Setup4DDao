{ Table Exemplo
  CREATE TABLE clientes (
  id serial4 NOT NULL,
  nome varchar(100) NOT NULL,
  email varchar(100) NULL,
  ocultar varchar(2) NULL,
  CONSTRAINT clientes_pkey PRIMARY KEY (id)
  );
}
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
  Setup4DDAO.Sample.Comum.Librarys;

{$R *.dfm}

procedure TPageMain.btClearListClick(Sender: TObject);
begin
  Memo.Lines.Clear;
end;

procedure TPageMain.btExecutarClick(Sender: TObject);
begin
  MemoCustom.Lines.Clear;
  try
    TSetup4DDAO<TCliente>
      .New.PGDatabase
        .Custom
          .ClearSQL
          .SQL(edtSelect.Text)
          .ClearWhere
          .Where(edtWhereKey.Text, edtWhereValue.Text)
        .Execute;

    MemoCustom.Lines.Add('..:: Procedimento executado ::..')
  except
    on E: Exception do
      ShowMessage(E.Message)
  end;
end;

procedure TPageMain.btFiltrarClick(Sender: TObject);
var
  LDAO: ISetup4DDAO<TCliente>;
begin
  try
    LDAO := TSetup4DDAO<TCliente>.New.PGDatabase.NoValidateWithException.Find
      ('Nome', edtFiltro.Text);
    TComumLibrarys.PopularMemo(Memo, LDAO);
  except
    on E: Exception do
      ShowMessage(E.Message)
  end;

end;

procedure TPageMain.btFiltroOperadorClick(Sender: TObject);
var
  LDAO: ISetup4DDAO<TCliente>;
  LComparision: TComparisonOperator;
  LCliente : TCliente;
begin
  try
    LComparision := TSetup4DDAOEnumeratedTypes<TComparisonOperator>.StringToEnum
      (cbxOperador.Items[cbxOperador.ItemIndex]);
    LDAO := TSetup4DDAO<TCliente>.New.PGDatabase.Find('Nome',
      edtFiltroOperador.Text, LComparision);

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
    edtPersistOcultar.Text);
end;

procedure TPageMain.btOpenClick(Sender: TObject);
var
  LDAO: ISetup4DDAOCustom<TCliente>;
  LComparision: TComparisonOperator;
  LComparison: TComparisonOperator;
  LOperator: TLogicalOperator;
  LOrder: TOrderBy;
begin
  MemoCustom.Lines.Clear;

  try
    LDAO := TSetup4DDAO<TCliente>.New.PGDatabase.Custom;

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
begin
  try
    LDAO := TSetup4DDAO<TCliente>.New.PGDatabase.FindID
      (StrToInt64Def(edtID.Text, 0));
    TComumLibrarys.PopularMemo(Memo, LDAO);
  except
    on E: Exception do
      ShowMessage(E.Message)
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

  HabilitarBotao;
  PageControl.ActivePage:= tsRTTi;
HabilitarBotao;

end;

end.
