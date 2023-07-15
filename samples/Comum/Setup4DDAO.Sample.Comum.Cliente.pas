unit Setup4DDAO.Sample.Comum.Cliente;

interface

uses
  Setup4D.DAO.Attribute;

type
  [TTable('Clientes')]
  TCliente = class
  private
    FID: Integer;
    FNome: string;
    FEmail: string;
    FOcultar: string;
  public
    [TField('ID'), TAutoInc, TPrimaryKey]
    property ID: Integer read FID write FID;
    [TField('NOME')]
    [TRequiredField]
    property Nome: string read FNome write FNome;
    [TField('EMAIL')]
    property Email: string read FEmail write FEmail;
    [TField('OCULTAR')]
    [TIgnoreInSelect]
    property Ocultar: string read FOcultar write FOcultar;
  end;

implementation

end.
