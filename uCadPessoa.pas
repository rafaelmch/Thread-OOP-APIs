unit uCadPessoa;

{
Rafael Hassegawa - Teste prático Desbravador
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Types, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Grids, Vcl.DBGrids ;

type
  TfrmCadPessoa = class(TForm)
    Panel3: TPanel;
    dbGridClientes: TDBGrid;
    Panel1: TPanel;
    btnSair: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    btnInserir: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbGridClientesTitleClick(Column: TColumn);
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarPessoas();
  public
    { Public declarations }
  end;

var
  frmCadPessoa: TfrmCadPessoa;

implementation

{$R *.dfm}

uses
  Main,
  uDados,
  login,
  uPessoa,
  classPessoa;

procedure TfrmCadPessoa.btnAlterarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPessoa,frmPessoa);
  with frmPessoa do
  begin
    edId.Text := frmDados.qPessoa.FieldByName('idpessoa').AsString;
    edNatureza.Text := frmDados.qPessoa.FieldByName('flnatureza').AsString;
    edDocumento.Text := frmDados.qPessoa.FieldByName('dsdocumento').AsString;
    edData.Text := frmDados.qPessoa.FieldByName('dtregistro').AsString;
    edtNome.Text := frmDados.qPessoa.FieldByName('nmprimeiro').AsString;
    edSobreNome.Text := frmDados.qPessoa.FieldByName('nmsegundo').AsString;

    with FrmDados.qEndereco do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from endereco where idpessoa = ' + FrmDados.qPessoa.FieldByName('idpessoa').AsString);
      Open;
    end;
    meCep.Text := frmDados.qEndereco.FieldByName('dscep').AsString;
  end;
  FrmPessoa.tipoCad := 'alteracao';
  frmPessoa.ShowModal;
  CarregarPessoas();
end;

procedure TfrmCadPessoa.btnExcluirClick(Sender: TObject);
var
  ls_sql : String;
  Pessoa : TPessoa;
begin
  Pessoa := TPessoa.Create;
  if Pessoa.Deletar(frmDados.qPessoa.FieldByName('idpessoa').AsString) = True then
    ShowMessage('Erro ao excluir pessoa!')
  else
    ShowMessage('Pessoa excluída com sucesso!');

  CarregarPessoas();
end;

procedure TfrmCadPessoa.btnInserirClick(Sender: TObject);
var
  ls_cep : String;
begin
  //abrir tela de cadastro
  Application.CreateForm(TFrmPessoa,FrmPessoa);
  FrmPessoa.tipoCad := 'inclusao';
  FrmPessoa.ShowModal;
  CarregarPessoas();
end;

procedure TfrmCadPessoa.btnSairClick(Sender: TObject);
begin
  frmCadPessoa := nil;
  Close;
end;

procedure TfrmCadPessoa.dbGridClientesTitleClick(Column: TColumn);
begin
  //ordenar grid de acordo com a coluna clicada
  frmDados.qPessoa.IndexFieldNames := Column.FieldName;
end;

procedure TfrmCadPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmDados.qPessoa.Close;
  frmCadPessoa := nil;
  Action := caFree;
end;

procedure TfrmCadPessoa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmCadPessoa.FormShow(Sender: TObject);
begin
  CarregarPessoas();
end;

procedure TfrmCadPessoa.CarregarPessoas();
var
  ls_sql : String;
begin
  ls_sql := 'select * ' +
    'from pessoa ' +
    'order by nmprimeiro ASC';

  with frmDados.qPessoa do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    Open;
  end;
end;

end.

