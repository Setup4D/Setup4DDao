unit Setup4D.Sample.Test.Model.ADS;

interface

uses
  DUnitX.TestFramework,

  System.SysUtils,

  Data.DB,

  Setup4D.DAO,
  Setup4D.DAO.Types,
  Setup4D.DAO.Interf,
  Setup4D.DAO.Session,
  Setup4DDAO.Sample.Comum.Cliente;

type
  [TestFixture]
  TTestADS = class
  private
    FDAO: ISetup4DDAO<TClientes>;
    FDAOCustom: ISetup4DDAOCustom<TClientes>;
    FDAOSetup : TSetup4DDAOSession;
    procedure Configuration;

  public
    [Setup]
    procedure Start;

    [TearDown]
    procedure Terminate;

    [Test]
    procedure NoRegistration;

    [Test]
    procedure InsertRegisterRTTi;

    [Test]
    procedure EditRegisterRTTi;

    [Test]
    procedure Find;

    [Test]
    procedure FindID;

    [Test]
    procedure FindLessThan;

    [Test]
    procedure FindGreaterThan;

    [Test]
    procedure FindDifferent;

    [Test]
    procedure FindDifferentPG;

    [Test]
    procedure FindLike;

    [Test]
    procedure FindLikePG;

    [Test]
    procedure FindLessThanOrEqual;

    [Test]
    procedure FindGreaterThanOrEqual;

    [Test]
    procedure CustomFind;

    [Test]
    procedure CustomFindWhere;

    [Test]
    procedure CustomFindWhereConditional;

    [Test]
    procedure CustomFindGroupBy;

    [Test]
    procedure CustomFindOrderBy;

    [Test]
    procedure DeleteRegisterRTTi;

    [Test]
    procedure InsertRegister;

    [Test]
    procedure EditRegister;

    [Test]
    procedure DeleteRegister;

    [Test]
    procedure DisabledTransection;
  end;

implementation

{ TTestADS }

procedure TTestADS.Configuration;
begin
  FDAOSetup.ConnectionParam.DatabaseName := '.\..\..\..\Comum\assets\DB\';
end;


procedure TTestADS.CustomFind;
begin
  FDAOCustom
      .ClearSQL
        .SQL('SELECT * FROM CLIENTES')
          .Open;

  Assert.IsTrue(FDAOCustom.DataSet.RecordCount > 0, 'Erro no DAOCustom: Nenhum registro localizado.')
end;

procedure TTestADS.CustomFindGroupBy;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT ID, Nome FROM CLIENTES')
                            .ClearWhere
                              .Where('Nome', '999-Teste-999')
                            .ClearGroupBy
                              .GroupBy('ID')
                              .GroupBy('Nome')
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado.')

                      end,
                      nil,
                      'Erro no DAOCustom: Não foi possivel realizar a pesquisa.'
                      );

end;

procedure TTestADS.CustomFindOrderBy;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT ID, Nome FROM CLIENTES')
                            .ClearWhere
                              .Where('Nome', '999-Teste-999')
                            .ClearGroupBy
                              .GroupBy('ID')
                              .GroupBy('Nome')
                            .ClearOrderBy
                              .OrderBy('Nome')
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado.')

                      end,
                      nil,
                      'Erro no DAOCustom: Não foi possivel realizar a pesquisa.'
                      );

end;

procedure TTestADS.CustomFindWhere;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('Nome', '999-Teste-999')
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado.')

                      end,
                      nil,
                      'Erro no DAOCustom: Não foi possivel realizar a pesquisa.'
                      );
end;

procedure TTestADS.CustomFindWhereConditional;
begin
  Assert.WillRaise(procedure
                      begin
                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('nome', 'TesTe', TComparisonOperator.DifferentPG)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado diferente de TesTe no ADS');

                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('nome', 'Teste', TComparisonOperator.LikePG)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado difente de Teste');
                      end,
                      nil,
                      'Nenhum registro que contenha dados foi localizado');

  Assert.WillNotRaise(procedure
                      begin
                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('ID', '99999999', TComparisonOperator.LessThan)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado Menor que 99999999.');

                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('ID', '99999999', TComparisonOperator.LessThanOREqual)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado Menor ou Igual que 99999999.');

                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('ID', '0', TComparisonOperator.GreaterThan)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado Maior que 0');

                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('ID', '0', TComparisonOperator.GreaterThanOREqual)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado Maior ou Igual a 0');

                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('nome', 'TesTe', TComparisonOperator.Different)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado diferente de TesTe');

                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('nome', '%Teste%', TComparisonOperator.Like)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro com Teste');
                      end,
                      nil,
                      'Erro no DAOCustom: Não foi possivel realizar a pesquisa.'
                      );

end;

procedure TTestADS.DeleteRegister;
var
  LID: string;
begin
  FDAOCustom
    .ClearSQL
      .SQL('SELECT * FROM CLIENTES')
    .ClearWhere
      .Where('Nome', '999-Teste-999')
        .Open;

  LID := FDAOCustom.DataSet.FieldByName('ID').AsString;

  Assert.IsFalse(LID.Trim.IsEmpty, 'DAOCustom: Nenhum ID Localizado');

  FDAOCustom
    .ClearSQL
      .SQL('DELETE FROM clientes')
    .ClearWhere
      .Where('ID', LID)
        .Execute
    .ClearSQL
      .SQL('SELECT * FROM CLIENTES')
    .ClearWhere
      .Where('Nome', '999-Teste-999')
        .Open;

  Assert.IsTrue(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: O registro ainda existe no banco de dados.');

end;

procedure TTestADS.DeleteRegisterRTTi;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('Nome', '999-Teste-999');
                      end,
                      nil,
                      'Nenhum registro localizado para capturar o ID.');

  FDAO.Delete;

  Assert.WillRaise(procedure
                      begin
                        FDAO.Find('Nome', '999-Teste-999');
                      end,
                      nil,
                      'Registro localizado');
end;

procedure TTestADS.DisabledTransection;
begin
  FDAO.DatabaseTransactionDisabled;
  InsertRegisterRTTi;
  EditRegisterRTTi;
  DeleteRegisterRTTi;
  InsertRegister;
  EditRegister;
  DeleteRegister;

end;

procedure TTestADS.EditRegister;
var
  LID : string;
begin
  FDAOCustom
    .ClearSQL
      .SQL('SELECT * FROM CLIENTES')
    .ClearWhere
      .Where('Nome', '999-Teste')
        .Open;

  LID := FDAOCustom.DataSet.FieldByName('ID').AsString;

  Assert.IsFalse(LID.Trim.IsEmpty, 'DAOCustom: Nenhum ID Localizado');

  FDAOCustom
    .ClearSQL
      .SQL('UPDATE clientes SET')
      .SQL(' nome = ''999-Teste-999''')
    .ClearWhere
      .Where('ID', LID)
        .Execute
    .ClearSQL
      .SQL('SELECT * FROM CLIENTES')
    .ClearWhere
      .Where('Nome', '999-Teste-999')
        .Open;

  Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado.');

end;

procedure TTestADS.EditRegisterRTTi;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('Nome', '999-Teste');
                      end,
                      nil,
                      'Nenhum registro localizado para capturar o ID.');

  FDAO.GetClassData.Nome := '999-Teste-999';
  FDAO.GetClassData.Email:= '999-teste@email';
  FDAO.GetClassData.Ocultar:= 'F3';

  FDAO.Update;

  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('Nome', '999-Teste-999');
                      end,
                      nil,
                      'Nenhum registro localizado');
end;

procedure TTestADS.Find;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('Nome', '999-TeSte-999');
                      end,
                      nil,
                      'Nenhum registro localizado');
end;

procedure TTestADS.FindDifferent;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('nome', 'TesTe', TComparisonOperator.Different);
                      end,
                      nil,
                      'Nenhum registro diferente foi localizado');

end;

procedure TTestADS.FindDifferentPG;
begin
  Assert.WillRaise(procedure
                      begin
                        FDAO.Find('nome', 'TesTe', TComparisonOperator.DifferentPG);
                      end,
                      nil,
                      'Nenhum registro diferente do ADS foi localizado');

end;

procedure TTestADS.FindGreaterThan;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('ID', '0', TComparisonOperator.GreaterThan);
                      end,
                      nil,
                      'Nenhum registro localizado maior que o ID 0');
end;

procedure TTestADS.FindGreaterThanOrEqual;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('ID', '0', TComparisonOperator.GreaterThan);
                      end,
                      nil,
                      'Nenhum registro localizado maior ou igual que o ID 0');
end;

procedure TTestADS.FindID;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('Nome', '999-Teste-999');
                      end,
                      nil,
                      'Nenhum registro localizado para capturar o ID.');

  FDAO.FindID(FDAO.GetClassData.ID);

  Assert.IsNotEmpty(FDAO.GetClassData.Nome, 'Nome não retornado');
  Assert.IsNotEmpty(FDAO.GetClassData.Email, 'Email não retornado');
end;

procedure TTestADS.FindLessThan;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('ID', '99999999', TComparisonOperator.LessThan);
                      end,
                      nil,
                      'Nenhum registro localizado menor que o ID 99999999');


end;

procedure TTestADS.FindLessThanOrEqual;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('ID', '9999999', TComparisonOperator.LessThanOREqual);
                      end,
                      nil,
                      'Nenhum registro localizado menor ou igual que o ID 9999999');
end;

procedure TTestADS.FindLike;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('nome', '%teStE%', TComparisonOperator.Like);
                      end,
                      nil,
                      'Nenhum registro que contenha dados foi localizado');

end;

procedure TTestADS.FindLikePG;
begin
  Assert.WillRaise(procedure
                      begin
                        FDAO.Find('nome', 'teste', TComparisonOperator.LikePG);
                      end,
                      nil,
                      'Nenhum registro contenha dados no ADS foi localizado');



end;

procedure TTestADS.InsertRegister;
begin
  FDAOCustom
    .ClearSQL
      .SQL('INSERT INTO clientes')
      .SQL(' (id, nome, email, ocultar) ')
      .SQL('VALUES')
      .SQL(' (''9999999'', ''999-Teste'', ''999-teste@email'', ''F3'')')
        .Execute
    .ClearSQL
      .SQL('SELECT * FROM CLIENTES')
    .ClearWhere
      .Where('Nome', '999-Teste')
        .Open;

  Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado.');
end;

procedure TTestADS.InsertRegisterRTTi;
begin
  FDAO.GetClassData.ID := '9999999';
  FDAO.GetClassData.Nome := '999-Teste';
  FDAO.GetClassData.Email:= '999-teste@email';
  FDAO.GetClassData.Ocultar:= 'F3';

  FDAO.Insert;

  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('Nome', '999-Teste');
                      end,
                      nil,
                      'Nenhum registro localizado');

end;

procedure TTestADS.NoRegistration;
begin
  Configuration;

  Assert.WillRaise(procedure
                   begin
                      Configuration;

                      FDAO.FindID(-1);

                   end,
                   nil,
                   'Erro no tratamento de erro para verificar se não tem registro.');

end;

procedure TTestADS.Start;
begin
  FDAO := TSetup4DDAO<TClientes>.New.ADSDatabase;
  FDAOCustom := TSetup4DDAO<TClientes>.New.ADSDatabase.Custom;
  FDAOSetup := TSetup4DDAOSession.GetInstance;
end;

procedure TTestADS.Terminate;
begin

end;

initialization
  TDUnitX.RegisterTestFixture(TTestADS);
end.
