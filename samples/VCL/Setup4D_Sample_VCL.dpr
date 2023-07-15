program Setup4D_Sample_VCL;

uses
  Vcl.Forms,
  Setup4DDAO.Sample.View.Main in 'View\Setup4DDAO.Sample.View.Main.pas' {PageMain},
  Vcl.Themes,
  Vcl.Styles,
  Setup4DDAO.Sample.Comum.Inicialization in '..\Comum\Setup4DDAO.Sample.Comum.Inicialization.pas',
  Setup4DDAO.Sample.Comum.Librarys in '..\Comum\Setup4DDAO.Sample.Comum.Librarys.pas',
  Setup4DDAO.Sample.Comum.Cliente in '..\Comum\Setup4DDAO.Sample.Comum.Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TPageMain, PageMain);
  Application.Run;
end.
