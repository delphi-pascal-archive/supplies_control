object FrmConsulta: TFrmConsulta
  Left = 222
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta de Mercadorias'
  ClientHeight = 331
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object LblConsulta: TLabel
    Left = 156
    Top = 2
    Width = 96
    Height = 20
    Caption = 'LblConsulta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrdCad_Prod: TDBGrid
    Left = 10
    Top = 60
    Width = 394
    Height = 266
    DataSource = DtSrcCad_Prod
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Cod_Prod'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prod'
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end>
  end
  object EdtConsulta: TEdit
    Left = 79
    Top = 27
    Width = 257
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnChange = EdtConsultaChange
    OnKeyPress = EdtConsultaKeyPress
  end
  object TblCad_Prod: TTable
    TableName = 'Cadastro.db'
    Left = 2
    Top = 14
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
  object DtSrcCad_Prod: TDataSource
    DataSet = TblCad_Prod
    Left = 32
    Top = 14
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 14
    object PorNome1: TMenuItem
      Caption = 'Por &Produto'
      OnClick = PorNome1Click
    end
    object PorCdigo1: TMenuItem
      Caption = 'Por &Codigo'
      OnClick = PorCdigo1Click
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
      OnClick = Sair1Click
    end
  end
end
