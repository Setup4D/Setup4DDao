program Setup4D_Sample_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  Setup4DDAO.Sample.View.Main in 'View\Setup4DDAO.Sample.View.Main.pas' {PageMain},
  Setup4DDAO.Sample.Comum.Cliente in '..\Comum\Setup4DDAO.Sample.Comum.Cliente.pas',
  Setup4DDAO.Sample.Comum.Inicialization in '..\Comum\Setup4DDAO.Sample.Comum.Inicialization.pas',
  Setup4DDAO.Sample.Comum.Librarys in '..\Comum\Setup4DDAO.Sample.Comum.Librarys.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPageMain, PageMain);
  Application.Run;
end.
