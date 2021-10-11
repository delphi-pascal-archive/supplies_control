unit UntConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Grids, DBGrids, DB, DBTables;

type
  TFrmConsulta = class(TForm)
    TblCad_Prod: TTable;
    DtSrcCad_Prod: TDataSource;
    DBGrdCad_Prod: TDBGrid;
    MainMenu1: TMainMenu;
    PorNome1: TMenuItem;
    PorCdigo1: TMenuItem;
    EdtConsulta: TEdit;
    LblConsulta: TLabel;
    Sair1: TMenuItem;
    TblCad_ProdCod_Prod: TIntegerField;
    TblCad_ProdProd: TStringField;
    TblCad_ProdQtd: TIntegerField;
    TblCad_ProdUlt_Lanc: TDateField;
    procedure PorNome1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PorCdigo1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtConsultaChange(Sender: TObject);
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    aux: integer;
  end;

var
  FrmConsulta: TFrmConsulta;

implementation

uses UntCadastro, UntVendas, UntEnt_Prod;

{$R *.dfm}

procedure TFrmConsulta.PorNome1Click(Sender: TObject);
begin
  LblConsulta.Caption:='Produto';
  EdtConsulta.Clear;
  EdtConsulta.SetFocus;
end;

procedure TFrmConsulta.FormActivate(Sender: TObject);
begin
  TblCad_Prod.Open;
  LblConsulta.Caption:='Produto';
  EdtConsulta.Clear;
  EdtConsulta.SetFocus;
end;

procedure TFrmConsulta.PorCdigo1Click(Sender: TObject);
begin
  LblConsulta.Caption:='Código';
  EdtConsulta.Clear;
  EdtConsulta.SetFocus;
end;

procedure TFrmConsulta.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if LblConsulta.Caption='Produto' then
  begin
    if FrmConsulta.Tag=2 then
    begin
      FrmCadastro.TblCad_Prod.IndexName:='produto';
      FrmCadastro.TblCad_Prod.FindNearest([EdtConsulta.Text]);
      FrmCadastro.TblCad_Prod.Locate('Prod',EdtConsulta.Text,[]);
    end;
    if FrmConsulta.Tag=3 then
    begin
      FrmVendas.TblCad_Prod.IndexName:='produto';
      FrmVendas.TblCad_Prod.FindNearest([EdtConsulta.Text]);
      FrmVendas.TblCad_Prod.Locate('Prod',EdtConsulta.Text,[]);
      FrmVendas.EdtProduto.Text:=FrmVendas.TblCad_ProdProd.Value;
      FrmVendas.EdtQtd.SetFocus;
    end;
    if FrmConsulta.Tag=4 then
    begin
      FrmEnt_Prod.TblCad_Prod.IndexName:='produto';
      FrmEnt_Prod.TblCad_Prod.FindNearest([EdtConsulta.Text]);
      FrmEnt_Prod.TblCad_Prod.Locate('Prod',EdtConsulta.Text,[]);
      FrmEnt_Prod.EdtProd.Text:=FrmEnt_Prod.TblCad_ProdProd.Value;
      FrmEnt_Prod.EdtQtd.SetFocus;
    end;
  end;
  if LblConsulta.Caption='Código' then
  begin
    if FrmConsulta.Tag=2 then
    begin
      FrmCadastro.TblCad_Prod.IndexName:='codigo';
      aux:=StrToInt(EdtConsulta.Text);
      FrmCadastro.TblCad_Prod.FindNearest([aux]);
      FrmCadastro.TblCad_Prod.Locate('Cod_Prod',aux,[]);
    end;
    if FrmConsulta.Tag=3 then
    begin
      FrmVendas.TblCad_Prod.IndexName:='codigo';
      aux:=StrToInt(EdtConsulta.Text);
      FrmVendas.TblCad_Prod.FindNearest([aux]);
      FrmVendas.TblCad_Prod.Locate('Cod_Prod',aux,[]);
      FrmVendas.EdtProduto.Text:=FrmVendas.TblCad_ProdProd.Value;
      FrmVendas.EdtQtd.SetFocus;
    end;
    if FrmConsulta.Tag=4 then
    begin
      FrmEnt_Prod.TblCad_Prod.IndexName:='codigo';
      aux:=StrToInt(EdtConsulta.Text);
      FrmEnt_Prod.TblCad_Prod.FindNearest([aux]);
      FrmEnt_Prod.TblCad_Prod.Locate('Cod_Prod',aux,[]);
      FrmEnt_Prod.EdtProd.Text:=FrmEnt_Prod.TblCad_ProdProd.Value;
      FrmEnt_Prod.EdtQtd.SetFocus;
    end;
  end;
  TblCad_Prod.Close;
end;

procedure TFrmConsulta.EdtConsultaChange(Sender: TObject);
begin
  if LblConsulta.Caption='Produto' then
  begin
    TblCad_Prod.IndexName:='produto';
    TblCad_Prod.FindNearest([EdtConsulta.Text]);
  end
  else
  begin
    if EdtConsulta.Text='' then
      EdtConsulta.Clear
    else
    begin
      TblCad_Prod.IndexName:='codigo';
      aux:=StrToInt(EdtConsulta.Text);
      TblCad_Prod.FindNearest([aux]);
    end;
  end;
end;

procedure TFrmConsulta.EdtConsultaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (FrmConsulta.Tag=1) then
  begin
    EdtConsulta.Clear;
  end;
  if (key=#13) and ((FrmConsulta.Tag=2) or (FrmConsulta.Tag=3) or (FrmConsulta.Tag=4)) then
  begin
    Close;
  end;
end;

procedure TFrmConsulta.FormCreate(Sender: TObject);
begin
 TblCad_Prod.DatabaseName:=ExtractFilePath(Application.ExeName)+'Banco\';
end;

end.
