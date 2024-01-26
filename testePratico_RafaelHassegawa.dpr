program testePratico_RafaelHassegawa;

{
Rafael Hassegawa - Teste prático WK
rafaelmch@gmail.com
(31)99886-6863
}

uses
  Vcl.Forms,
  Windows,
  Dialogs,
  SysUtils,
  Main in 'Main.pas' {frmMain},
  login in 'login.pas' {frmLogin},
  uDados in 'uDados.pas' {frmDados: TDataModule},
  uEnviaEmail in 'uEnviaEmail.pas' {frmEnviaEmail},
  uCadPessoa in 'uCadPessoa.pas' {frmCadPessoa},
  uPessoa in 'uPessoa.pas' {frmPessoa},
  classPessoa in 'classPessoa.pas',
  classEndereco in 'classEndereco.pas',
  classEnderecoIntegracao in 'classEnderecoIntegracao.pas',
  uImportacaoEmLote in 'uImportacaoEmLote.pas' {frmImportacaoLote},
  uFuncoes in 'uFuncoes.pas',
  dataInfo1 in 'dataInfo1.pas',
  dataInfo2 in 'dataInfo2.pas';

{$R *.res}

Var
HprevHist : HWND;

//verificar se existe outra cópia do aplicativo aberta
function verificarCopiaAberta() : Boolean;
var
 rtn : Cardinal;
begin
  result := False;
  CreateMutex(nil, False, PWideChar(ExtractFileName(Application.ExeName)));
  rtn := GetLastError;
  if rtn = ERROR_ALREADY_EXISTS then
   result := True;
end;

begin
  //não permitir executar duas cópias do aplicativo ao mesmo tempo
  if verificarCopiaAberta() = true then
  begin
    ShowMessage('Atenção! Outra cópia do aplicativo está aberta! Feche-a para prosseguir!');
    Application.Terminate;
  end
  else
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDados, frmDados);
  Application.CreateForm(TfrmEnviaEmail, frmEnviaEmail);
  Application.CreateForm(TfrmCadPessoa, frmCadPessoa);
  Application.CreateForm(TfrmPessoa, frmPessoa);
  Application.CreateForm(TfrmImportacaoLote, frmImportacaoLote);
  Application.Run;
  end;
end.
