unit UntCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, Mask, DBCtrls, DBTables, Buttons,
  Mxstore, MXDB, Menus;

type
  TFrmCadastro = class(TForm)
    TblCad_Prod: TTable;
    TblCad_ProdCod_Prod: TIntegerField;
    TblCad_ProdProd: TStringField;
    TblCad_ProdQtd: TIntegerField;
    Label1: TLabel;
    DBEdtCod_Prod: TDBEdit;
    DtSrcCad_Prod: TDataSource;
    LblProd: TLabel;
    DBEdtProd: TDBEdit;
    Label3: TLabel;
    DBEdtQtd: TDBEdit;
    DBGrdCad_Prod: TDBGrid;
    TblCad_ProdUlt_Lanc: TDateField;
    Label2: TLabel;
    DBEdtUlt_Lanc: TDBEdit;
    MnCadastro: TMainMenu;
    MnNovo: TMenuItem;
    MnCancelar: TMenuItem;
    MnSalvar: TMenuItem;
    MnAnterior: TMenuItem;
    MnProximo: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    MnConsultar: TMenuItem;
    TblAuxCad_Prod: TTable;
    TblAuxCad_ProdCod_Prod: TIntegerField;
    TblAuxCad_ProdProd: TStringField;
    TblAuxCad_ProdQtd: TIntegerField;
    TblAuxCad_ProdUlt_Lanc: TDateField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MnNovoClick(Sender: TObject);
    procedure MnCancelarClick(Sender: TObject);
    procedure MnSalvarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure MnConsultarClick(Sender: TObject);
    procedure preenche_campos;
    procedure MnAnteriorClick(Sender: TObject);
    procedure MnProximoClick(Sender: TObject);
    procedure TblCad_ProdBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    a: integer;
  end;

var
  FrmCadastro: TFrmCadastro;

implementation

uses UntConsulta, UntEnt_Prod;

{$R *.dfm}

procedure TFrmCadastro.FormActivate(Sender: TObject);
begin
  TblCad_Prod.Open;
  TblAuxCad_Prod.Open;
  TblCad_Prod.Last;
  TblCad_Prod.Last;
  a:=TblCad_ProdCod_Prod.Value;
  preenche_campos;
  if TblCad_Prod.IsEmpty then
  begin
    TblCad_Prod.Insert;
    TblCad_ProdCod_Prod.Value:=a+1;
    a:=a+1;
    DBEdtUlt_Lanc.Text:=DateToStr(Date);
    TblCad_ProdUlt_Lanc.Value:=Date;
    MnNovo.Enabled:=False;
    MnCancelar.Enabled:=True;
    MnSalvar.Enabled:=True;
    MnExcluir.Enabled:=False;
    MnConsultar.Enabled:=False;
    MnAnterior.Enabled:=False;
    MnProximo.Enabled:=False;
    MnSair.Enabled:=False;
  end
  else
  begin
    MnNovo.Enabled:=True;
    MnCancelar.Enabled:=False;
    MnSalvar.Enabled:=False;
    MnAnterior.Enabled:=True;
    MnProximo.Enabled:=True;
    MnExcluir.Enabled:=True;
    MnSair.Enabled:=True;
  end;
end;

procedure TFrmCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FrmCadastro.Tag=1 then
  begin
    TblCad_Prod.Close;
    TblAuxCad_Prod.Close;
  end;
  if FrmCadastro.Tag=2 then
  begin
    FrmEnt_Prod.TblCad_Prod.Refresh;
    FrmEnt_Prod.TblCad_Prod.Locate('Prod',TblCad_ProdProd.Value,[]);
    FrmEnt_Prod.EdtProd.Text:=FrmEnt_Prod.TblCad_ProdProd.Value;
    FrmEnt_Prod.EdtQtd.SetFocus;
  end;
end;

procedure TFrmCadastro.MnNovoClick(Sender: TObject);
begin
  TblCad_Prod.Insert;
  TblCad_ProdCod_Prod.Value:=a+1;
  a:=a+1;
  DBEdtUlt_Lanc.Text:=DateToStr(Date);
  TblCad_ProdUlt_Lanc.Value:=Date;
  MnNovo.Enabled:=False;
  MnCancelar.Enabled:=True;
  MnSalvar.Enabled:=True;
  MnExcluir.Enabled:=False;
  MnConsultar.Enabled:=False;
  MnAnterior.Enabled:=False;
  MnProximo.Enabled:=False;
  MnSair.Enabled:=False;
end;

procedure TFrmCadastro.MnCancelarClick(Sender: TObject);
begin
  TblCad_Prod.Cancel;
  MnNovo.Enabled:=Enabled;
  MnCancelar.Enabled:=False;
  MnSalvar.Enabled:=False;
  MnExcluir.Enabled:=True;
  MnConsultar.Enabled:=True;
  MnAnterior.Enabled:=True;
  MnProximo.Enabled:=True;
  MnSair.Enabled:=True;
  a:=a-1;
end;

procedure TFrmCadastro.MnSalvarClick(Sender: TObject);
begin
  if (DBEdtProd.Text='') or (DBEdtQtd.Text='') then
  begin
    MessageDlg('Campo não preenchido',mtWarning,[mbOK],0);
    Abort;
  end
  else
  begin
    TblCad_Prod.Post;
    MnNovo.Enabled:=True;
    MnCancelar.Enabled:=False;
    MnSalvar.Enabled:=False;
    MnExcluir.Enabled:=True;
    MnConsultar.Enabled:=True;
    MnAnterior.Enabled:=True;
    MnProximo.Enabled:=True;
    MnSair.Enabled:=True;
  end;
end;

procedure TFrmCadastro.MnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você deseja excluir esse registro?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    TblCad_Prod.Delete;
    MnNovo.Enabled:=True;
    MnCancelar.Enabled:=False;
    MnSalvar.Enabled:=False;
    MnExcluir.Enabled:=True;
    MnConsultar.Enabled:=True;
    MnAnterior.Enabled:=True;
    MnProximo.Enabled:=True;
    MnSair.Enabled:=True;
  end;

end;

procedure TFrmCadastro.MnSairClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    Close;
  end;
end;

procedure TFrmCadastro.MnConsultarClick(Sender: TObject);
begin
  FrmConsulta.Tag:=2;
  FrmConsulta.ShowModal;
end;

procedure TFrmCadastro.preenche_campos;
begin
  DBEdtCod_Prod.Text:=TblCad_ProdCod_Prod.AsString;
  DBEdtProd.Text:=TblCad_ProdProd.Value;
  DBEdtQtd.Text:=TblCad_ProdQtd.AsString;
  DBEdtUlt_Lanc.Text:=TblCad_ProdUlt_Lanc.AsString;
end;

procedure TFrmCadastro.MnAnteriorClick(Sender: TObject);
begin
  TblCad_Prod.Prior;
  preenche_campos;
  MnNovo.Enabled:=True;
  MnCancelar.Enabled:=False;
  MnSalvar.Enabled:=False;
  MnExcluir.Enabled:=True;
  MnConsultar.Enabled:=True;
  MnAnterior.Enabled:=True;
  MnProximo.Enabled:=True;
  MnSair.Enabled:=True;
end;

procedure TFrmCadastro.MnProximoClick(Sender: TObject);
begin
  TblCad_Prod.Next;
  preenche_campos;
  MnNovo.Enabled:=True;
  MnCancelar.Enabled:=False;
  MnSalvar.Enabled:=False;
  MnExcluir.Enabled:=True;
  MnConsultar.Enabled:=True;
  MnAnterior.Enabled:=True;
  MnProximo.Enabled:=True;
  MnSair.Enabled:=True;
end;

procedure TFrmCadastro.TblCad_ProdBeforePost(DataSet: TDataSet);
begin
  if TblAuxCad_Prod.Locate('Prod',DBEdtProd.Text,[]) then
  begin
    MessageDlg('Produto com o mesmo nome já cadastrado!',mtWarning,[mbOK],0);
    Abort;
  end;
end;

procedure TFrmCadastro.FormCreate(Sender: TObject);
begin
 TblCad_Prod.DatabaseName:=ExtractFilePath(Application.ExeName)+'Banco\';
 TblAuxCad_Prod.DatabaseName:=ExtractFilePath(Application.ExeName)+'Banco\';
end;

end.
