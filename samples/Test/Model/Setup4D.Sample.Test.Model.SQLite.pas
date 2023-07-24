unit Setup4D.Sample.Test.Model.SQLite;

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
  TTestSQLite = class
  private
    FDAO: ISetup4DDAO<TCliente>;
    FDAOCustom: ISetup4DDAOCustom<TCliente>;
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
    procedure Vacuum;

    [Test]
    procedure DisabledTransection;
  end;

implementation

{ TTestSQLite }

procedure TTestSQLite.Configuration;
begin
  FDAOSetup.ConnectionParam.DatabaseName := '.\..\..\..\Comum\assets\DB\Setup4DDAOExemplo.dat';
  FDAOSetup.ConnectionParam.OpenModeSQLite :=  TOpenModeSQLite.ReadWrite;
  FDAOSetup.ConnectionParam.LockingMode :=  TLokingMode.Normal;
  FDAOSetup.ConnectionParam.EncryptSQLite :=  TEncryptSQLite.No;
  FDAOSetup.ConnectionParam.Password := EmptyStr;
end;


procedure TTestSQLite.CustomFind;
begin
  FDAOCustom
      .ClearSQL
        .SQL('SELECT * FROM CLIENTES')
          .Open;

  Assert.IsTrue(FDAOCustom.DataSet.RecordCount > 0, 'Erro no DAOCustom: Nenhum registro localizado.')
end;

procedure TTestSQLite.CustomFindGroupBy;
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

procedure TTestSQLite.CustomFindOrderBy;
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

procedure TTestSQLite.CustomFindWhere;
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

procedure TTestSQLite.CustomFindWhereConditional;
begin
  Assert.WillRaise(procedure
                      begin
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
                              .Where('ID', 99999999, TComparisonOperator.LessThan)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado Menor que 99999999.');

                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('ID', 99999999, TComparisonOperator.LessThanOREqual)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado Menor ou Igual que 99999999.');

                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('ID', 0, TComparisonOperator.GreaterThan)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado Maior que 0');

                        FDAOCustom
                            .ClearSQL
                              .SQL('SELECT * FROM CLIENTES')
                            .ClearWhere
                              .Where('ID', 0, TComparisonOperator.GreaterThanOREqual)
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
                              .Where('nome', 'TesTe', TComparisonOperator.DifferentPG)
                                .Open;

                        Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado diferente de TesTe no SQLite');

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

procedure TTestSQLite.DeleteRegister;
var
  LID: Int64;
begin
  FDAOCustom
    .ClearSQL
      .SQL('SELECT * FROM CLIENTES')
    .ClearWhere
      .Where('Nome', '999-Teste-999')
        .Open;

  LID := FDAOCustom.DataSet.FieldByName('ID').AsInteger;

  Assert.IsTrue(LID > 0, 'DAOCustom: Nenhum ID Localizado');

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

procedure TTestSQLite.DeleteRegisterRTTi;
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

procedure TTestSQLite.DisabledTransection;
begin
  FDAO.DatabaseTransactionDisabled;
  InsertRegisterRTTi;
  EditRegisterRTTi;
  DeleteRegisterRTTi;
  InsertRegister;
  EditRegister;
  DeleteRegister;
end;

procedure TTestSQLite.EditRegister;
var
  LID : Int64;
begin
  FDAOCustom
    .ClearSQL
      .SQL('SELECT * FROM CLIENTES')
    .ClearWhere
      .Where('Nome', '999-Teste')
        .Open;

  LID := FDAOCustom.DataSet.FieldByName('ID').AsInteger;

  Assert.IsTrue(LID > 0, 'DAOCustom: Nenhum ID Localizado');

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

procedure TTestSQLite.EditRegisterRTTi;
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

procedure TTestSQLite.Find;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('Nome', '999-TeSte-999');
                      end,
                      nil,
                      'Nenhum registro localizado');
end;

procedure TTestSQLite.FindDifferent;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('nome', 'TesTe', TComparisonOperator.Different);
                      end,
                      nil,
                      'Nenhum registro diferente foi localizado');

end;

procedure TTestSQLite.FindDifferentPG;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('nome', 'TesTe', TComparisonOperator.DifferentPG);
                      end,
                      nil,
                      'Nenhum registro diferente do SQLite foi localizado');

end;

procedure TTestSQLite.FindGreaterThan;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('ID', 0, TComparisonOperator.GreaterThan);
                      end,
                      nil,
                      'Nenhum registro localizado maior que o ID 0');
end;

procedure TTestSQLite.FindGreaterThanOrEqual;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('ID', 0, TComparisonOperator.GreaterThan);
                      end,
                      nil,
                      'Nenhum registro localizado maior ou igual que o ID 0');
end;

procedure TTestSQLite.FindID;
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

procedure TTestSQLite.FindLessThan;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('ID', 99999999, TComparisonOperator.LessThan);
                      end,
                      nil,
                      'Nenhum registro localizado menor que o ID 99999999');


end;

procedure TTestSQLite.FindLessThanOrEqual;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('ID', 9999999, TComparisonOperator.LessThanOREqual);
                      end,
                      nil,
                      'Nenhum registro localizado menor ou igual que o ID 9999999');
end;

procedure TTestSQLite.FindLike;
begin
  Assert.WillNotRaise(procedure
                      begin
                        FDAO.Find('nome', '%teStE%', TComparisonOperator.Like);
                      end,
                      nil,
                      'Nenhum registro que contenha dados foi localizado');
end;

procedure TTestSQLite.FindLikePG;
begin
  Assert.WillRaise(procedure
                      begin
                        FDAO.Find('nome', 'teste', TComparisonOperator.LikePG);
                      end,
                      nil,
                      'Nenhum registro contenha dados no SQLite foi localizado');



end;

procedure TTestSQLite.InsertRegister;
begin
  FDAOCustom
    .ClearSQL
      .SQL('INSERT INTO clientes')
      .SQL(' (nome, email, ocultar) ')
      .SQL('VALUES')
      .SQL(' (''999-Teste'', ''999-teste@email'', ''F3'')')
        .Execute
    .ClearSQL
      .SQL('SELECT * FROM CLIENTES')
    .ClearWhere
      .Where('Nome', '999-Teste')
        .Open;

  Assert.IsFalse(FDAOCustom.DataSet.IsEmpty, 'Erro no DAOCustom: Nenhum registro localizado.');
end;

procedure TTestSQLite.InsertRegisterRTTi;
begin
  FDAO.GetClassData.ID := 9999999;
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

procedure TTestSQLite.NoRegistration;
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

procedure TTestSQLite.Start;
begin
  FDAO := TSetup4DDAO<TCliente>.New.SQLiteDatabase;
  FDAOCustom := TSetup4DDAO<TCliente>.New.SQLiteDatabase.Custom;
  FDAOSetup := TSetup4DDAOSession.GetInstance;
end;

procedure TTestSQLite.Terminate;
begin

end;

procedure TTestSQLite.Vacuum;
begin
  Assert.WillNotRaise(procedure
                   begin
                      Configuration;

                      FDAOCustom
                          .ClearSQL
                            .SQL('VACUUM')
                              .Execute;
                   end,
                   nil,
                   'Erro ao executar o VACUUM.');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestSQLite);
end.
