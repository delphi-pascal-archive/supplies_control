unit UntVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, Buttons;

type
  TFrmVendas = class(TForm)
    TblCad_Prod: TTable;
    TblCad_ProdCod_Prod: TIntegerField;
    TblCad_ProdProd: TStringField;
    TblCad_ProdQtd: TIntegerField;
    DtSrcCad_Prod: TDataSource;
    DBGrdCad_Prod: TDBGrid;
    LblQtd: TLabel;
    EdtQtd: TEdit;
    LblProduto: TLabel;
    EdtProduto: TEdit;
    SpdBtnSaida: TSpeedButton;
    TblVendas: TTable;
    TblVendasCod_Venda: TIntegerField;
    TblVendasCod_Prod: TIntegerField;
    TblVendasProd_Vendido: TStringField;
    TblVendasQtd_Vendida: TIntegerField;
    TblVendasData_Venda: TDateField;
    DtSrcVendas: TDataSource;
    DBGrdVendas: TDBGrid;
    Label1: TLabel;
    LblRot2: TLabel;
    SpdBtnConsulta: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpdBtnConsultaClick(Sender: TObject);
    procedure EdtProdutoChange(Sender: TObject);
    procedure SpdBtnSaidaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    i: integer;//Variável utilizada para implementar código
               //automático à tabela de Cadastro de Produtos.
    x: integer;//Variavel utilizada para implementar código
               //automático à tabela de Vendas.
  end;

var
  FrmVendas: TFrmVendas;

implementation

uses UntConsulta;

{$R *.dfm}

procedure TFrmVendas.FormActivate(Sender: TObject);
begin
  TblCad_Prod.Open;
  TblVendas.Open;
  TblCad_Prod.Last;
  i:=TblCad_ProdCod_Prod.Value;
  TblVendas.Last;
  x:=TblVendasCod_Venda.Value;
  EdtQtd.SetFocus;
end;

procedure TFrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TblCad_Prod.Close;
  TblVendas.Close;
end;

procedure TFrmVendas.SpdBtnConsultaClick(Sender: TObject);
begin
    FrmConsulta.Tag:=3;
    FrmConsulta.ShowModal;
end;

procedure TFrmVendas.EdtProdutoChange(Sender: TObject);
begin
    TblCad_Prod.IndexName:='produto';
    TblCad_Prod.FindNearest([EdtProduto.Text]);
end;

procedure TFrmVendas.SpdBtnSaidaClick(Sender: TObject);
begin
    TblCad_Prod.IndexName:='produto';
    TblCad_Prod.FindNearest([EdtProduto.Text]);
    TblCad_Prod.Edit;
    TblCad_ProdQtd.Value:=TblCad_ProdQtd.Value-(StrToInt(EdtQtd.Text));
    TblVendas.Insert;
    TblVendasCod_Venda.Value:=x+1;
    x:=x+1;
    TblVendasCod_Prod.Value:=TblCad_ProdCod_Prod.Value;
    TblVendasProd_Vendido.Value:=TblCad_ProdProd.Value;
    TblVendasQtd_Vendida.Value:=StrToInt(EdtQtd.Text);
    TblVendasData_Venda.Value:=Date;
    TblCad_Prod.Post;
    TblVendas.Post;
    EdtQtd.Clear;
    EdtProduto.Clear;
    EdtProduto.SetFocus;
end;

procedure TFrmVendas.FormCreate(Sender: TObject);
begin
 TblCad_Prod.DatabaseName:=ExtractFilePath(Application.ExeName)+'Banco\';
 TblVendas.DatabaseName:=ExtractFilePath(Application.ExeName)+'Banco\';
end;

end.
