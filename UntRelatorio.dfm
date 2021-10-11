object FrmRelatorio: TFrmRelatorio
  Left = 192
  Top = 114
  Width = 696
  Height = 480
  Caption = 'Relatorio de Estoque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 13
  object TblCad_Prod: TTable
    DatabaseName = 'C:\Controle\Banco'
    TableName = 'Cadastro.db'
    Left = 280
    Top = 8
    object TblCad_ProdCod_Prod: TIntegerField
      FieldName = 'Cod_Prod'
    end
    object TblCad_ProdProd: TStringField
      FieldName = 'Prod'
      Size = 50
    end
    object TblCad_ProdQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object TblCad_ProdUlt_Lanc: TDateField
      FieldName = 'Ult_Lanc'
    end
  end
end
