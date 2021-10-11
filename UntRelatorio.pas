unit UntRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, QRExport;

type
  TFrmRelatorio = class(TForm)
    TblCad_Prod: TTable;
    TblCad_ProdCod_Prod: TIntegerField;
    TblCad_ProdProd: TStringField;
    TblCad_ProdQtd: TIntegerField;
    TblCad_ProdUlt_Lanc: TDateField;
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorio: TFrmRelatorio;

implementation

{$R *.dfm}

procedure TFrmRelatorio.FormCreate(Sender: TObject);
begin
 TblCad_Prod.DatabaseName:=ExtractFilePath(Application.ExeName)+'Banco\';
end;

end.
