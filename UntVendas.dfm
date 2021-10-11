object FrmVendas: TFrmVendas
  Left = 332
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Vendas Diarias'
  ClientHeight = 474
  ClientWidth = 572
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
  object LblQtd: TLabel
    Left = 395
    Top = 10
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
  object LblProduto: TLabel
    Left = 212
    Top = 10
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
  object SpdBtnSaida: TSpeedButton
    Left = 292
    Top = 69
    Width = 113
    Height = 27
    Caption = 'Efetuar &Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpdBtnSaidaClick
  end
  object Label1: TLabel
    Left = 10
    Top = 101
    Width = 149
    Height = 16
    Caption = 'Produtos em Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblRot2: TLabel
    Left = 11
    Top = 279
    Width = 133
    Height = 16
    Caption = 'Produtos Vendidos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpdBtnConsulta: TSpeedButton
    Left = 174
    Top = 69
    Width = 113
    Height = 27
    Caption = '&Consulta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpdBtnConsultaClick
  end
  object DBGrdCad_Prod: TDBGrid
    Left = 9
    Top = 122
    Width = 553
    Height = 148
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'Cod_Prod'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Prod'
        Title.Alignment = taCenter
        Title.Caption = 'Produtos'
        Width = 315
        Visible = True
      end>
  end
  object EdtQtd: TEdit
    Left = 380
    Top = 30
    Width = 61
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object EdtProduto: TEdit
    Left = 117
    Top = 30
    Width = 257
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    OnChange = EdtProdutoChange
  end
  object DBGrdVendas: TDBGrid
    Left = 10
    Top = 302
    Width = 552
    Height = 163
    DataSource = DtSrcVendas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Cod_Venda'
        Title.Alignment = taCenter
        Title.Caption = 'Cod Vendas'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd_Vendida'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd'
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Prod_Vendido'
        Title.Alignment = taCenter
        Title.Caption = 'Produtos'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data_Venda'
        Title.Alignment = taCenter
        Title.Caption = 'Data Venda'
        Width = 67
        Visible = True
      end>
  end
  object TblCad_Prod: TTable
    TableName = 'Cadastro.db'
    Left = 26
    Top = 16
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
    Left = 58
    Top = 16
  end
  object TblVendas: TTable
    TableName = 'Vendas.DB'
    Left = 362
    Top = 16
    object TblVendasCod_Venda: TIntegerField
      FieldName = 'Cod_Venda'
    end
    object TblVendasCod_Prod: TIntegerField
      FieldName = 'Cod_Prod'
    end
    object TblVendasProd_Vendido: TStringField
      FieldName = 'Prod_Vendido'
      Size = 50
    end
    object TblVendasQtd_Vendida: TIntegerField
      FieldName = 'Qtd_Vendida'
    end
    object TblVendasData_Venda: TDateField
      FieldName = 'Data_Venda'
    end
  end
  object DtSrcVendas: TDataSource
    DataSet = TblVendas
    Left = 394
    Top = 16
  end
end
