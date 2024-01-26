object frmCadPessoa: TfrmCadPessoa
  Left = 2
  Top = 2
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 532
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 903
    Height = 491
    Align = alClient
    TabOrder = 0
    object dbGridClientes: TDBGrid
      Left = 24
      Top = 16
      Width = 857
      Height = 449
      Color = clWhite
      DataSource = frmDados.dsqPessoa
      DrawingStyle = gdsClassic
      FixedColor = clInfoBk
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = dbGridClientesTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'idpessoa'
          Title.Caption = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'flnatureza'
          Title.Caption = 'Natureza'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dsdocumento'
          Title.Caption = 'Documento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmprimeiro'
          Title.Caption = 'Nome'
          Width = 186
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmsegundo'
          Title.Caption = 'Sobrenome'
          Width = 186
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtregistro'
          Title.Caption = 'Dt Cadastro'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 491
    Width = 903
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    object btnSair: TButton
      Left = 826
      Top = 2
      Width = 75
      Height = 37
      Align = alRight
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSairClick
    end
    object btnExcluir: TButton
      Left = 751
      Top = 2
      Width = 75
      Height = 37
      Align = alRight
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnAlterar: TButton
      Left = 676
      Top = 2
      Width = 75
      Height = 37
      Align = alRight
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnInserir: TButton
      Left = 601
      Top = 2
      Width = 75
      Height = 37
      Align = alRight
      Caption = 'Inserir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnInserirClick
    end
  end
end
