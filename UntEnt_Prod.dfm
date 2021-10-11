object FrmEnt_Prod: TFrmEnt_Prod
  Left = 212
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Entrada de Produtos'
  ClientHeight = 266
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object LblProd: TLabel
    Left = 133
    Top = 6
    Width = 64
    Height = 20
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblQtd: TLabel
    Left = 335
    Top = 6
    Width = 30
    Height = 20
    Caption = 'Qtd'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpdBtnEntrada: TSpeedButton
    Left = 18
    Top = 64
    Width = 159
    Height = 31
    Caption = '&Entrada de Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpdBtnEntradaClick
  end
  object SpdBtnCadastro: TSpeedButton
    Left = 260
    Top = 64
    Width = 134
    Height = 31
    Caption = 'Cadastrar &Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpdBtnCadastroClick
  end
  object SpdBtnConsulta: TSpeedButton
    Left = 183
    Top = 64
    Width = 71
    Height = 31
    Caption = '&Consulta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpdBtnConsultaClick
  end
  object EdtProd: TEdit
    Left = 24
    Top = 30
    Width = 284
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnChange = EdtProdChange
    OnKeyPress = EdtProdKeyPress
  end
  object EdtQtd: TEdit
    Left = 315
    Top = 30
    Width = 70
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object DBGrdCad_Prod: TDBGrid
    Left = 10
    Top = 108
    Width = 394
    Height = 148
    DataSource = DtSrcCad_Prod
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Cod_Prod'
        Title.Alignment = taCenter
        Title.Caption = 'Cod Produto'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prod'
        Title.Alignment = taCenter
        Title.Caption = 'Produtos'
        Width = 163
        Visible = True
      end>
  end
  object TblCad_Prod: TTable
    DatabaseName = 'C:\Controle\Banco'
    TableName = 'Cadastro.db'
    Left = 32
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
  end
  object DtSrcCad_Prod: TDataSource
    DataSet = TblCad_Prod
    Left = 64
  end
end
