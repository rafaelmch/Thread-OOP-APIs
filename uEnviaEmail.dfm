object frmEnviaEmail: TfrmEnviaEmail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gmail - Fale com Rafael Hassegawa'
  ClientHeight = 471
  ClientWidth = 408
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 408
    Height = 413
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 66
      Top = 168
      Width = 29
      Height = 13
      Caption = 'Para:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 49
      Top = 195
      Width = 49
      Height = 13
      Caption = 'Assunto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 52
      Top = 107
      Width = 46
      Height = 13
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 58
      Top = 134
      Width = 38
      Height = 13
      Caption = 'Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 13
      Width = 328
      Height = 13
      Caption = 'Aten'#231#227'o! Para conseguir enviar e-mails atrav'#233's dp GMAIL,'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 30
      Width = 108
      Height = 13
      Caption = 'acesse a conta em:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 48
      Width = 371
      Height = 13
      Caption = ' Settings > Accounts and Import > Other Google Account settings'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 66
      Width = 290
      Height = 13
      Caption = 'Habilite a op'#231#227'o enable access for less secure apps.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object edUsuario: TEdit
      Left = 102
      Top = 104
      Width = 223
      Height = 21
      TabOrder = 0
    end
    object edSenha: TEdit
      Left = 102
      Top = 131
      Width = 223
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object edPara: TEdit
      Left = 102
      Top = 165
      Width = 223
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edAssunto: TEdit
      Left = 102
      Top = 192
      Width = 223
      Height = 21
      TabOrder = 3
    end
    object memoCorpoEmail: TMemo
      Left = 11
      Top = 227
      Width = 380
      Height = 165
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 413
    Width = 408
    Height = 58
    Align = alBottom
    TabOrder = 1
    object btnEviar: TBitBtn
      Left = 235
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Enviar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnEviarClick
    end
    object brnFechar: TBitBtn
      Left = 316
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = brnFecharClick
    end
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 128
    Top = 176
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 184
    Top = 176
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 176
    Top = 232
  end
end
