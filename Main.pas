unit Main;

{
Rafael Hassegawa - Teste prático Desbravador
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  ShellApi,
  IniFiles,
  WinSock,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.Actions,
  Vcl.ActnList,
  System.ImageList,
  Vcl.ImgList,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.IB, FireDAC.Phys.IBDef, Vcl.Imaging.pngimage,
  REST.Types, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope,
  System.JSON;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    timerData: TTimer;
    Panel4: TPanel;
    imgTestePratico: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    btnCadPessoa: TButton;
    btnEncontreODev: TButton;
    btnImportacaoEmLote: TButton;
    btnFaleEmailDev: TButton;
    PanelWorkArea: TPanel;
    panelInfo: TPanel;
    lblDataHora: TLabel;
    panelDev: TPanel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    MemTableCEP: TFDMemTable;
    procedure ActionCadClienteExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure timerDataTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEncontreODevClick(Sender: TObject);
    procedure btnFaleEmailDevClick(Sender: TObject);
    procedure btnCadPessoaClick(Sender: TObject);
    procedure btnImportacaoEmLoteClick(Sender: TObject);
  private
    { Private declarations }
    FFormActive: TForm;
    procedure LoadForm(AClass: TFormClass);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uCadPessoa,
  uDados,
  uEnviaEmail,
  classEnderecoIntegracao,
  uImportacaoEmLote;

procedure TfrmMain.ActionCadClienteExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmCadPessoa, frmCadPessoa);
  frmCadPessoa.ShowModal;
  Application.Terminate;
end;

procedure TfrmMain.btnCadPessoaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadPessoa,FrmCadPessoa);
  FrmCadPessoa.ShowModal;
  Application.Terminate;
end;

procedure TfrmMain.btnEncontreODevClick(Sender: TObject);
begin
  //informações DEV - Rafael Hassegawa
  ShellExecute(Handle,'open',PCHAR('https://www.linkedin.com/in/rafael-hassegawa-5462a943/'), PChar(''), PChar(''), SW_SHOWNORMAL);
end;

procedure TfrmMain.btnFaleEmailDevClick(Sender: TObject);
begin
  //envio de e-mail para o DEV
  Application.CreateForm(TfrmEnviaEmail,frmEnviaEmail);
  frmEnviaEmail.ShowModal;
end;

procedure TfrmMain.btnImportacaoEmLoteClick(Sender: TObject);
begin
  //abrir cadastro em lote
  Application.CreateForm(TfrmImportacaoLote,frmImportacaoLote);
  frmImportacaoLote.ShowModal;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  //exibir data e hora
  lblDataHora.Caption := TimeToStr(time);

  //integrar endereços
  //thread para atualização endereços
  TThread.CreateAnonymousThread(
  procedure
  var
    ls_sql, ls_Cep : String;
    EnderecoIntegracao : TEnderecoIntegracao;
    jsonEndereco : TJsonObject;
  begin
    ls_sql := 'select * from endereco';

    with frmDados.qEndereco do
    begin
      Close;
      Sql.Clear;
      Sql.Add(ls_sql);
      Open;
    end;

    if FrmDados.qEndereco.RecordCount > 0 then
    begin
      frmDados.qEndereco.First;
      while not FrmDados.qEndereco.Eof do
      begin
        ls_sql := 'select * from endereco_integracao where idendereco = ' + FrmDados.qEndereco.FieldByName('idendereco').AsString;

        with FrmDados.qGeral do
        begin
          Close;
          Sql.Clear;
          Sql.Add(ls_sql);
          Open
        end;

        if FrmDados.QGeral.RecordCount = 0 then
        begin
          ls_Cep := FrmDados.qEndereco.FieldByName('dscep').AsString;
          RESTRequest1.Resource := ls_Cep + '/json';
          RESTRequest1.Execute;

          if RESTResponse1.StatusCode = 200 then
          begin
              EnderecoIntegracao := TEnderecoIntegracao.Create;

              with MemTableCEP do
              begin
                EnderecoIntegracao.dsuf := FieldByName('uf').AsString;
                EnderecoIntegracao.nmcidade := FieldByName('localidade').AsString;
                EnderecoIntegracao.nmbairro := FieldByName('bairro').AsString;
                EnderecoIntegracao.nmlogradouro := FieldByName('logradouro').AsString;
                EnderecoIntegracao.dscomplemento := FieldByName('complemento').AsString;
              end;

              ls_sql := 'insert into endereco_integracao (idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento) ' +
                'VALUES ("' + FrmDados.qEndereco.FieldByName('idendereco').AsString +'", "' +
                EnderecoIntegracao.dsuf + '", "' +
                EnderecoIntegracao.nmcidade + '", "' +
                EnderecoIntegracao.nmbairro + '", "' +
                EnderecoIntegracao.nmlogradouro + '", "' +
                EnderecoIntegracao.dscomplemento +'")';

              with FrmDados.qGeral do
              begin
                Close;
                Sql.Clear;
                Sql.Add(ls_sql);
                Execute;
              end;

              try

              finally
                EnderecoIntegracao.Free;
              end;
          end;
        end;

        FrmDados.qEndereco.Next;
      end;
    end;
  end).Start;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain := nil;
  Action := caFree;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
     perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmMain.LoadForm(AClass: TFormClass);
begin
  if Assigned(Self.FFormActive) then
  begin
    Self.FFormActive.Close;
    Self.FFormActive.Free;
    Self.FFormActive := nil;
  end;

  Self.FFormActive             := AClass.Create(nil);
  Self.FFormActive.Parent      := Self.PanelWorkArea;
  Self.FFormActive.BorderStyle := TFormBorderStyle.bsNone;

  Self.FFormActive.Top   := 0;
  Self.FFormActive.Left  := 0;
  Self.FFormActive.Align := TAlign.alClient;

  Self.FFormActive.Show;
end;

procedure TfrmMain.timerDataTimer(Sender: TObject);
begin
  //exibir dia + data e hora
  lblDataHora.Caption := UpperCase(FormatDateTime('dddd', Date)) + ', ' + FormatDateTime('dd', Date) +
    ' de ' + FormatDateTime('mmmm', Date) + ' de ' + FormatDateTime('yyyy', Date) + ' ' +
    TimeToStr(time);

end;

end.
