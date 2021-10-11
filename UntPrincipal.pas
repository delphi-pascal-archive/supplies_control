unit UntPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, XPMan, jpeg;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    XPManifest1: TXPManifest;
    StsBrPrincipal: TStatusBar;
    TmrPrincipal: TTimer;
    Cadastrar1: TMenuItem;
    Consultar1: TMenuItem;
    Controlar1: TMenuItem;
    Relatrio1: TMenuItem;
    Sair1: TMenuItem;
    Sada1: TMenuItem;
    Sobre1: TMenuItem;
    imgPrincipal: TImage;
    procedure TmrPrincipalTimer(Sender: TObject);
    procedure Cadastrar1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Controlar1Click(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses UntCadastro, UntVendas, UntEnt_Prod, UntConsulta, UntSobre,
  UntRelatorio;

{$R *.dfm}

procedure TFrmPrincipal.TmrPrincipalTimer(Sender: TObject);
begin
  StsBrPrincipal.Panels[0].Text:=DateToStr(Date)+'   '+TimeToStr(Time);
  StsBrPrincipal.Panels[1].Text:='ADS';
end;

procedure TFrmPrincipal.Cadastrar1Click(Sender: TObject);
begin
  FrmCadastro.Tag:=1;
  FrmCadastro.ShowModal;  
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.Controlar1Click(Sender: TObject);
begin
   FrmEnt_Prod.ShowModal;
end;

procedure TFrmPrincipal.Sada1Click(Sender: TObject);
begin
  FrmVendas.ShowModal;
end;

procedure TFrmPrincipal.Consultar1Click(Sender: TObject);
begin
  FrmConsulta.Tag:=1;
  FrmConsulta.ShowModal;
end;

procedure TFrmPrincipal.Sobre1Click(Sender: TObject);
begin
  AbtBxSobre.ShowModal;
end;

procedure TFrmPrincipal.Relatrio1Click(Sender: TObject);
begin
   FrmRelatorio.TblCad_Prod.Open;
   FrmRelatorio.QuickRep1.Preview;
end;

end.
