unit Setup4DDAO.Sample.Comum.Librarys;

interface
uses
{$IFDEF FRAMEWORK_VCL}
  Vcl.StdCtrls,
{$ENDIF}
{$IFDEF FRAMEWORK_FMX}
  FMX.Memo,
  FMX.StdCtrls,
{$ENDIF}
  Setup4DDAO.Sample.Comum.Cliente,

  Setup4D.DAO,
  Setup4D.DAO.Interf,

  System.SysUtils;
type
  TComumLibrarys = class
    public
      class procedure PopularMemo(AMemo: TMemo; AValue: ISetup4DDAO<TCliente>); overload;
      class procedure PopularMemo(AMemo: TMemo; AValue: ISetup4DDAO<TClientes>); overload;
      class procedure PopularMemo(AMemo: TMemo; AValue: TCliente); overload;
      class procedure PopularMemo(AMemo: TMemo; AValue: TClientes); overload;
      class procedure Persistir(AMemo: TMemo;
        AValue: {$IFDEF FRAMEWORK_VCL}TButton{$ENDIF}{$IFDEF FRAMEWORK_FMX}TSpeedButton{$ENDIF};
        AID, ANome, AEmail, AOcultar: string; AItem : Integer; AAutoInc: Boolean); overload;
      class procedure Persistir(AMemo: TMemo;
        AValue: {$IFDEF FRAMEWORK_VCL}TButton{$ENDIF}{$IFDEF FRAMEWORK_FMX}TSpeedButton{$ENDIF};
        AID, ANome, AEmail, AOcultar: string; AItem : Integer); overload;
  end;

implementation

{ TComumLibrarys }

class procedure TComumLibrarys.Persistir(AMemo: TMemo;
        AValue: {$IFDEF FRAMEWORK_VCL}TButton{$ENDIF}{$IFDEF FRAMEWORK_FMX}TSpeedButton{$ENDIF};
        AID, ANome, AEmail, AOcultar: string; AItem : Integer);
var
  LDAO: ISetup4DDAO<TCliente>;
begin
  try
    case AItem of
      0: LDAO := TSetup4DDAO<TCliente>.New.PGDatabase;
      1: LDAO := TSetup4DDAO<TCliente>.New.SQLiteDatabase;
      2: LDAO := TSetup4DDAO<TCliente>.New.ADSDatabase;
      3: LDAO := TSetup4DDAO<TCliente>.New.FBDatabase;
      4: LDAO := TSetup4DDAO<TCliente>.New.MySQLDatabase;
    else
      raise Exception.Create('Banco de dados não especificado...');
    end;


    LDAO.GetClassData.ID := StrToIntDef(AID, 0);
    LDAO.GetClassData.Nome := ANome;
    LDAO.GetClassData.Email := AEmail;
    LDAO.GetClassData.Ocultar := AOcultar;

    case TButton(AValue).Tag of
     1: LDAO.Insert;
     2: LDAO.Update;
     3: LDAO.Delete;
    end;
    AMemo.Lines.Add('Procedimento concluido com sucesso.');
  except
    on E: Exception do
      AMemo.Lines.Add('Erro ao executar o procedimento. Erro: ' + E.Message)
  end;
end;

class procedure TComumLibrarys.Persistir(AMemo: TMemo;
        AValue: {$IFDEF FRAMEWORK_VCL}TButton{$ENDIF}{$IFDEF FRAMEWORK_FMX}TSpeedButton{$ENDIF};
        AID, ANome, AEmail, AOcultar: string; AItem : Integer; AAutoInc: Boolean);
var
  LDAO: ISetup4DDAO<TClientes>;
begin
  if AAutoInc then
  begin
    TComumLibrarys.Persistir(AMemo, AValue, AID, ANome, AEmail, AOcultar, AItem);
    Exit;
  end;

  try
    case AItem of
      0: LDAO := TSetup4DDAO<TClientes>.New.PGDatabase;
      1: LDAO := TSetup4DDAO<TClientes>.New.SQLiteDatabase;
      2: LDAO := TSetup4DDAO<TClientes>.New.ADSDatabase;
      3: LDAO := TSetup4DDAO<TClientes>.New.FBDatabase;
      4: LDAO := TSetup4DDAO<TClientes>.New.MySQLDatabase;
    else
      raise Exception.Create('Banco de dados não especificado...');
    end;


    LDAO.GetClassData.ID := AID;
    LDAO.GetClassData.Nome := ANome;
    LDAO.GetClassData.Email := AEmail;
    LDAO.GetClassData.Ocultar := AOcultar;

    case TButton(AValue).Tag of
     1: LDAO.Insert;
     2: LDAO.Update;
     3: LDAO.Delete;
    end;
    AMemo.Lines.Add('Procedimento concluido com sucesso.');
  except
    on E: Exception do
      AMemo.Lines.Add('Erro ao executar o procedimento. Erro: ' + E.Message)
  end;
end;

class procedure TComumLibrarys.PopularMemo(AMemo: TMemo;
  AValue: ISetup4DDAO<TCliente>);
begin
  AMemo.Lines.Add('ID: ' + AValue.GetClassData.ID.ToString);
  AMemo.Lines.Add('Nome: ' + AValue.GetClassData.Nome);
  AMemo.Lines.Add('Email: ' + AValue.GetClassData.Email);
  AMemo.Lines.Add('Ocultar : ' + AValue.GetClassData.OCultar);

end;

class procedure TComumLibrarys.PopularMemo(AMemo: TMemo;
  AValue: ISetup4DDAO<TClientes>);
begin
  AMemo.Lines.Add('ID: ' + AValue.GetClassData.ID);
  AMemo.Lines.Add('Nome: ' + AValue.GetClassData.Nome);
  AMemo.Lines.Add('Email: ' + AValue.GetClassData.Email);
  AMemo.Lines.Add('Ocultar : ' + AValue.GetClassData.OCultar);

end;

class procedure TComumLibrarys.PopularMemo(AMemo: TMemo; AValue: TCliente);
begin
  AMemo.Lines.Add('ID: ' + AValue.ID.ToString);
  AMemo.Lines.Add('Nome: ' + AValue.Nome);
  AMemo.Lines.Add('Email: ' + AValue.Email);
  AMemo.Lines.Add('Ocultar : ' + AValue.OCultar);

end;

class procedure TComumLibrarys.PopularMemo(AMemo: TMemo; AValue: TClientes);
begin
  AMemo.Lines.Add('ID: ' + AValue.ID);
  AMemo.Lines.Add('Nome: ' + AValue.Nome);
  AMemo.Lines.Add('Email: ' + AValue.Email);
  AMemo.Lines.Add('Ocultar : ' + AValue.OCultar);

end;

end.
