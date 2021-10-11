program Controle;

uses
  Forms,
  UntPrincipal in 'UntPrincipal.pas' {FrmPrincipal},
  UntCadastro in 'UntCadastro.pas' {FrmCadastro},
  UntVendas in 'UntVendas.pas' {FrmVendas},
  UntEnt_Prod in 'UntEnt_Prod.pas' {FrmEnt_Prod},
  UntConsulta in 'UntConsulta.pas' {FrmConsulta},
  UntSobre in 'UntSobre.pas' {AbtBxSobre},
  UntRelatorio in 'UntRelatorio.pas' {FrmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCadastro, FrmCadastro);
  Application.CreateForm(TFrmVendas, FrmVendas);
  Application.CreateForm(TFrmEnt_Prod, FrmEnt_Prod);
  Application.CreateForm(TFrmConsulta, FrmConsulta);
  Application.CreateForm(TAbtBxSobre, AbtBxSobre);
  Application.CreateForm(TFrmRelatorio, FrmRelatorio);
  Application.CreateForm(TFrmRelatorio, FrmRelatorio);
  Application.Run;
end.
