unit uEnviaEmail;

{
Rafael Hassegawa - Teste prático Desbravador
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage;

type
  TfrmEnviaEmail = class(TForm)
    Panel1: TPanel;
    edUsuario: TEdit;
    edSenha: TEdit;
    edPara: TEdit;
    edAssunto: TEdit;
    memoCorpoEmail: TMemo;
    Panel2: TPanel;
    btnEviar: TBitBtn;
    brnFechar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnEviarClick(Sender: TObject);
    procedure brnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnviaEmail: TfrmEnviaEmail;
  usuario, senha, para, assunto, texto : String;

implementation

{$R *.dfm}

procedure gmail(usuario, senha, para, assunto, texto : String);
var
  data : TIDMessage;
  SMTP : TIdSMTP;
  SSL : TIdSSLIOHandlerSocketOpenSSL;
begin

  SMTP := TIdSMTP.Create(nil);
  data := TIdMessage.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);


  SSL.SSLOptions.Method := sslvTLSv1;
  SSL.SSLOptions.Mode := sslmUnassigned;
  SSL.SSLOptions.VerifyMode := [];
  SSL.SSLOptions.VerifyDepth := 0;

  data.From.Address := usuario;
  data.Recipients.EMailAddresses := para;
  data.Subject := assunto;
  data.Body.Text := texto;

  SMTP.IOHandler := SSL;
  SMTP.Host := 'smtp.gmail.com';
  SMTP.Port := 587;
  SMTP.Username := usuario;
  SMTP.Password := senha;
  SMTP.UseTLS := utUseExplicitTLS;

  SMTP.Connect;
  SMTP.Send(data);
  SMTP.Disconnect;

  SMTP.Free;
  data.Free;
  SSL.Free;

end;

procedure TfrmEnviaEmail.brnFecharClick(Sender: TObject);
begin
  frmEnviaEmail.Close;
end;

procedure TfrmEnviaEmail.btnEviarClick(Sender: TObject);
begin
  //enviar email
  usuario := edUsuario.Text;
  senha := edSenha.Text;
  para := edPara.Text;
  assunto := edAssunto.Text;
  texto := memoCorpoEmail.Text;

  try
    gmail(usuario, senha, para, assunto, texto);
    ShowMessage('E-mail enviado com sucesso!');
  except
    ShowMessage('Erro ao enviar e-mail! Tente novamente!' + #13 +
      'Verifique as configurações do seu Gmail em ' + #13 +
      'Settings > Accounts and Import > Other Google Account settings ' + #13 +
      'Habilite ENABLE ACCESS FOR LESS SECURE APPS.');
  end;
end;

procedure TfrmEnviaEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmEnviaEmail := nil;
  Action := caFree;
end;

procedure TfrmEnviaEmail.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //pular campo com o ENTER
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmEnviaEmail.FormShow(Sender: TObject);
begin
  //abrir a tela com o meu e-mail
  edPara.Text := 'rafaelmch@gmail.com';
end;

end.
