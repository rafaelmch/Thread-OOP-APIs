unit login;

{
Rafael Hassegawa - Teste prático Desbravador
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  IniFiles,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    PanelWorkArea: TPanel;
    Panel1: TPanel;
    btnConfirma: TButton;
    btnCancelar: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    txtLogin: TEdit;
    txtSenha: TEdit;
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtLoginExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure txtSenhaExit(Sender: TObject);
  private
    { Private declarations }
    FFormActive: TForm;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  Main,
  uDados;

procedure TfrmLogin.btnConfirmaClick(Sender: TObject);
var
  ls_sql : String;
begin
  if (trim(txtLogin.Text) = 'A') and (trim(txtSenha.Text) = 'A') then
  begin
    frmMain.ShowModal();
    frmLogin.Hide();
    frmLogin.Close();
  end else begin
     ShowMessage('Atenção! Login/Senha errados! Digite novamente');
     txtLogin.Text := '';
     txtSenha.Text := '';
     try
        txtLogin.SetFocus;
     except

     end;
  end;
end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmLogin := nil;
  Action := caFree;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //pular para o próximo campo com o ENTER
  if Key = VK_RETURN then
     perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //pular campo com o ENTER
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  try
    txtLogin.SetFocus;
  except

  end;
end;

procedure TfrmLogin.txtLoginExit(Sender: TObject);
begin
  txtLogin.Text := UPPERCASE(txtLogin.Text);
end;

procedure TfrmLogin.txtSenhaExit(Sender: TObject);
begin
  txtSenha.Text := UPPERCASE(txtSenha.Text)
end;

end.;
