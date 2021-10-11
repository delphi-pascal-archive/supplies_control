object FrmCadastro: TFrmCadastro
  Left = 489
  Top = 184
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos'
  ClientHeight = 412
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MnCadastro
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 15
    Top = 0
    Width = 101
    Height = 20
    Caption = 'Cod Produto'
    FocusControl = DBEdtCod_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblProd: TLabel
    Left = 153
    Top = 49
    Width = 64
    Height = 20
    Caption = 'Produto'
    FocusControl = DBEdtProd
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 389
    Top = 49
    Width = 30
    Height = 20
    Caption = 'Qtd'
    FocusControl = DBEdtQtd
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 465
    Top = 49
    Width = 40
    Height = 20
    Caption = 'Data'
    FocusControl = DBEdtUlt_Lanc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdtCod_Prod: TDBEdit
    Left = 9
    Top = 21
    Width = 119
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    DataField = 'Cod_Prod'
    DataSource = DtSrcCad_Prod
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdtProd: TDBEdit
    Left = 10
    Top = 70
    Width = 362
    Height = 21
    CharCase = ecUpperCase
    DataField = 'Prod'
    DataSource = DtSrcCad_Prod
    TabOrder = 0
  end
  object DBEdtQtd: TDBEdit
    Left = 378
    Top = 69
    Width = 53
    Height = 21
    CharCase = ecUpperCase
    DataField = 'Qtd'
    DataSource = DtSrcCad_Prod
    TabOrder = 1
  end
  object DBGrdCad_Prod: TDBGrid
    Left = 10
    Top = 105
    Width = 543
    Height = 296
    DataSource = DtSrcCad_Prod
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
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
        Title.Caption = 'Codigo'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prod'
        Title.Alignment = taCenter
        Title.Caption = 'Produtos'
        Width = 248
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ult_Lanc'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Width = 68
        Visible = True
      end>
  end
  object DBEdtUlt_Lanc: TDBEdit
    Left = 437
    Top = 69
    Width = 98
    Height = 21
    CharCase = ecUpperCase
    DataField = 'Ult_Lanc'
    DataSource = DtSrcCad_Prod
    TabOrder = 2
  end
  object TblCad_Prod: TTable
    BeforePost = TblCad_ProdBeforePost
    TableName = 'Cadastro.db'
    Left = 135
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
    Left = 167
  end
  object MnCadastro: TMainMenu
    Left = 200
    object MnNovo: TMenuItem
      Caption = '&Novo'
      OnClick = MnNovoClick
    end
    object MnCancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = MnCancelarClick
    end
    object MnSalvar: TMenuItem
      Caption = '&Salvar'
      OnClick = MnSalvarClick
    end
    object MnExcluir: TMenuItem
      Caption = '&Excluir'
      OnClick = MnExcluirClick
    end
    object MnConsultar: TMenuItem
      Caption = 'Consul&tar'
      OnClick = MnConsultarClick
    end
    object MnAnterior: TMenuItem
      Caption = '&Anterior'
      OnClick = MnAnteriorClick
    end
    object MnProximo: TMenuItem
      Caption = '&Proximo'
      OnClick = MnProximoClick
    end
    object MnSair: TMenuItem
      Caption = 'Sai&r'
      OnClick = MnSairClick
    end
  end
  object TblAuxCad_Prod: TTable
    TableName = 'Cadastro.db'
    Left = 232
    object TblAuxCad_ProdCod_Prod: TIntegerField
      FieldName = 'Cod_Prod'
    end
    object TblAuxCad_ProdProd: TStringField
      FieldName = 'Prod'
      Size = 50
    end
    object TblAuxCad_ProdQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object TblAuxCad_ProdUlt_Lanc: TDateField
      FieldName = 'Ult_Lanc'
    end
  end
end
