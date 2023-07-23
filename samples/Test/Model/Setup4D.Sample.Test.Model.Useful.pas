unit Setup4D.Sample.Test.Model.Useful;


interface
uses
  DUnitX.TestFramework,

  Setup4D.DAO.Types,
  Setup4D.DAO.Useful;

type
  [TestFixture]
  TTestUseful = class
  private
  public
    [Setup]
    procedure Start;

    [TearDown]
    procedure Terminate;

    [Test]
    [TestCase('CaseRemoverCharSpecial', '@#@Delphi,Delphi')]
    [TestCase('CaseRemoverCharSpecialReturnEqual', 'Delphi,Delphi')]
    [TestCase('CaseRemoverCharSpecialReturnEmpty', '@##$,')]
    procedure RemoveCharSpecial(AValue: string; AResult: string);

    [Test]
    [TestCase('CaseRemoverExtractFirst01', ' Capitao Marvel ,Capitao')]
    [TestCase('CaseRemoverExtractFirst02', '  Capitao Marvel ,Capitao')]
    [TestCase('CaseRemoverExtractFirst03', ' Capitao   Marvel ,Capitao')]
    [TestCase('CaseRemoverExtractFirst04', 'Capitao Marvel ,Capitao')]
    [TestCase('CaseRemoverExtractFirst05', 'Capitao   Marvel ,Capitao')]
    [TestCase('CaseRemoverExtractFirst06', 'CapitaoMarvel  ,CapitaoMarvel  ')]
    [TestCase('CaseRemoverExtractFirst07', '  CapitaoMarvel,  CapitaoMarvel')]
    [TestCase('CaseRemoverExtractFirst08', ' CapitaoMarvel , CapitaoMarvel ')]
    [TestCase('CaseRemoverExtractFirst09', '  CapitaoMarvel  ,  CapitaoMarvel  ')]
    [TestCase('CaseRemoverExtractFirst10', 'CapitaoMarvel,CapitaoMarvel')]
    procedure ExtractFirst(AValue: string; AResult: string);

    [Test]
    [TestCase('CaseWordExists', ' Capitao Marvel ,Capitao')]
    procedure WordExists(AValue: string; AKey: string);

    [Test]
    procedure EnumString;

    [Test]
    procedure EnumList;

    [Test]
    procedure StringEnum;

  end;
implementation

uses
  System.Classes;

procedure TTestUseful.EnumList;
var
  LList : TStringList;
begin
  LList := TStringList.Create;
  try
    TSetup4DDAOEnumeratedTypes<TDatabaseTypes>.EnumToList(LList);

    Assert.IsTrue(LList.Count > 0, 'Nenhum item adiconado a lista na conversão')

  finally
    LList.Free;
  end;
end;

procedure TTestUseful.EnumString;
begin
  Assert.AreEqual(
    TSetup4DDAOEnumeratedTypes<TDatabaseTypes>.EnumToString(TDatabaseTypes.SQLite),
    'SQLite');
end;

procedure TTestUseful.ExtractFirst(AValue: string; AResult: string);
var
  LResult: string;
begin
  LResult := TSetup4DDAOUseful.ExtractFirstWord(AValue);
  Assert.AreEqual(LResult, AResult);
end;

procedure TTestUseful.RemoveCharSpecial(AValue: string; AResult: string);
var
  LResult: string;
begin
  LResult := TSetup4DDAOUseful.RemoveNonAlphaNumericFromStart(AValue);
  Assert.AreEqual(LResult, AResult);
end;

procedure TTestUseful.Start;
begin
end;

procedure TTestUseful.StringEnum;
begin
  Assert.AreEqual(
    TSetup4DDAOEnumeratedTypes<TDatabaseTypes>.StringToEnum('SQLite'),
    TDatabaseTypes.SQLite);
end;

procedure TTestUseful.Terminate;
begin
end;

procedure TTestUseful.WordExists(AValue, AKey: string);
begin
  Assert.IsTrue(TSetup4DDAOUseful.WordExistsInString(AValue, AKey), 'Chave não existe na string.');

end;

initialization
  TDUnitX.RegisterTestFixture(TTestUseful);
end.
