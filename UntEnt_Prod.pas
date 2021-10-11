unit UntEnt_Prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, DBTables, Buttons;

type
  TFrmEnt_Prod = class(TForm)
    TblCad_Prod: TTable;
    EdtProd: TEdit;
    EdtQtd: TEdit;
    LblProd: TLabel;
    LblQtd: TLabel;
    TblCad_ProdCod_Prod: TIntegerField;
    TblCad_ProdProd: TStringField;
    TblCad_ProdQtd: TIntegerField;
    SpdBtnEntrada: TSpeedButton;
    DtSrcCad_Prod: TDataSource;
    DBGrdCad_Prod: TDBGrid;
    SpdBtnCadastro: TSpeedButton;
    SpdBtnConsulta: TSpeedButton;
    procedure EdtProdChange(Sender: TObject);
    procedure SpdBtnEntradaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpdBtnCadastroClick(Sender: TObject);
    procedure SpdBtnConsultaClick(Sender: TObject);
    procedure EdtProdKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEnt_Prod: TFrmEnt_Prod;

implementation

uses UntCadastro, UntConsulta;

{$R *.dfm}

procedure TFrmEnt_Prod.EdtProdChange(Sender: TObject);
begin
  TblCad_Prod.IndexName:='produto';
  TblCad_Prod.FindNearest([EdtProd.Text]);
end;

procedure TFrmEnt_Prod.SpdBtnEntradaClick(Sender: TObject);
begin
  TblCad_Prod.IndexName:='produto';
  TblCad_Prod.FindNearest([EdtProd.Text]);
  if MessageDlg('Deseja inserir '+EdtQtd.Text+' '+EdtProd.Text,mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    TblCad_Prod.Edit;
    TblCad_ProdQtd.Value:=TblCad_ProdQtd.Value+(StrToInt(EdtQtd.Text));
    TblCad_Prod.Post;
  end
  else
    Abort;
  EdtProd.Clear;
  EdtQtd.Clear;
  EdtProd.SetFocus;
end;

procedure TFrmEnt_Prod.FormActivate(Sender: TObject);
begin
  TblCad_Prod.Open;
  EdtProd.SetFocus;
end;

procedure TFrmEnt_Prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TblCad_Prod.Close;
end;

procedure TFrmEnt_Prod.SpdBtnCadastroClick(Sender: TObject);
begin
  FrmCadastro.Tag:=2;
  FrmCadastro.ShowModal;
end;

procedure TFrmEnt_Prod.SpdBtnConsultaClick(Sender: TObject);
begin
  FrmConsulta.Tag:=4;
  FrmConsulta.ShowModal;
end;

procedure TFrmEnt_Prod.EdtProdKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    EdtQtd.SetFocus;
end;

procedure TFrmEnt_Prod.FormCreate(Sender: TObject);
begin
 TblCad_Prod.DatabaseName:=ExtractFilePath(Application.ExeName)+'Banco\';
end;

end.
