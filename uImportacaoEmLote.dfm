object frmImportacaoLote: TfrmImportacaoLote
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Importa'#231#227'o de Pessoas em Lote'
  ClientHeight = 108
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object panemImportacaoEmLote: TPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 64
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 123
    object Label1: TLabel
      Left = 26
      Top = 24
      Width = 51
      Height = 16
      Caption = 'Arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edArquivo: TEdit
      Left = 90
      Top = 21
      Width = 375
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnAbrir: TButton
      Left = 486
      Top = 19
      Width = 75
      Height = 26
      Caption = 'Abrir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAbrirClick
    end
  end
  object panelBotoes: TPanel
    Left = 0
    Top = 64
    Width = 604
    Height = 44
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 123
    object btnFechar: TButton
      Left = 496
      Top = 1
      Width = 107
      Height = 42
      Align = alRight
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object btnProcessar: TButton
      Left = 389
      Top = 1
      Width = 107
      Height = 42
      Align = alRight
      Caption = 'Processar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnProcessarClick
    end
  end
  object openDialog: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Arquivos texto|*.txt'
    Title = 'Abrir arquivo importa'#231#227'o'
    Left = 24
    Top = 64
  end
end
