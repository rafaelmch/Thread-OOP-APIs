unit uPessoa;

{
Rafael Hassegawa - Teste prático Desbravador
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TfrmPessoa = class(TForm)
    Panel2: TPanel;
    btnSair: TButton;
    panelCapaPedido: TPanel;
    edID: TEdit;
    Label1: TLabel;
    btnSalvar: TBitBtn;
    edData: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNatureza: TEdit;
    Label4: TLabel;
    edDocumento: TEdit;
    edtNome: TEdit;
    Label5: TLabel;
    edSobrenome: TEdit;
    Label6: TLabel;
    meCEP: TMaskEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    pl_alteraProduto : boolean;
    procedure bloquearCampos();
    function Totalizar() : Integer;
  public
    { Public declarations }
    tipoCad : string;
  end;

var
  frmPessoa: TfrmPessoa;

implementation

{$R *.dfm}

uses
  Main,
  uDados,
  login,
  classPessoa,
  classEndereco,
  uFuncoes,
  dataInfo1, dataInfo2;

procedure TfrmPessoa.btnSalvarClick(Sender: TObject);
var
  Pessoa : TPessoa;
  Endereco : TEndereco;
  ls_sql : String;
  Questao5 : Class1;
begin
  //3
//  Questao5 := Class1.Create;
//  Questao5.Totalizar();
//  exit;
//
//  //1
//  Totalizar();
//  Exit;

  if length(meCEP.Text) <> 9 then
  begin
    ShowMessage('Atenção! Informe o CEP');
    meCEP.SetFocus;
    Exit;
  end;

  //instanciar objeto
  Pessoa := TPessoa.Create;
  Pessoa.Executar();
  Exit;


  Endereco := TEndereco.Create;

  try
    Pessoa.idPessoa := StrToInt(edID.Text);
    Pessoa.flNatureza := StrToInt(edNatureza.Text);
    Pessoa.dsDocumento := edDocumento.Text;
    Pessoa.nmPrimeiro := edtNome.Text;
    Pessoa.nmSegundo := edSobrenome.Text;
    Pessoa.dtRegistro := StrToDate(edData.Text);
    Endereco.dsCep := meCEP.Text;

    if tipoCad = 'inclusao' then //inserção
    begin
      Endereco.idEndereco := RetornaIndiceEndereco;
      if (Pessoa.Salvar = true) or (Endereco.Salvar(IntToStr(Pessoa.idPessoa)) = true) then
      begin
        ShowMessage('Erro ao salvar pessoa!');
      end
      else
      begin
        ShowMessage('Pessoa salva com sucesso!!');
      end;
    end
    else if tipoCad = 'alteracao' then //alteração
    begin
      if (Pessoa.Atualizar = true) or (Endereco.Atualizar(edID.Text) = true) then
      begin
        ShowMessage('Erro ao atualizar pessoa!');
      end
      else
      begin
        ShowMessage('Pessoa atualizada com sucesso!!');
      end;
    end;
  finally
    Pessoa.Free;
    Endereco.Free;
  end;

  //salvar informações da pessoa
  bloquearCampos();
  btnSalvar.Enabled := false;
end;

procedure TfrmPessoa.btnSairClick(Sender: TObject);
begin
  frmPessoa := nil;
  frmDados.qPessoa.Close;
  frmDados.qEndereco.Close;
  Close;
end;

procedure TfrmPessoa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //pular campo com o ENTER
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmPessoa.FormShow(Sender: TObject);
var
  ls_sql : string;
begin
  try
    edNatureza.SetFocus;
  except

  end;

  if tipoCad = 'inclusao' then
  begin
    edID.Text := IntToStr(RetornaIndicePessoa);
  end;

  //data atual
  edData.Text := FormatDateTime('dd/mm/yyyy',Date);
  pl_alteraProduto := false;
end;

procedure TfrmPessoa.bloquearCampos();
var
  i : integer;
begin
  For i:= 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
      (Components[i] as TEdit).Enabled:= False;

    if Components[i] is TMaskEdit then
      (Components[i] as TMaskEdit).Enabled:= False;
  end;

end;

Function TfrmPessoa.Totalizar() : Integer;
var
  i : Integer;
  count : Integer;
begin
//1° Analise o método abaixo. Supondo que a “query” presente no método
//Abaixo retorne 10 registros, e que para cada registro o valor da coluna “VALUE” é 1. Então qual será o valor retornado por este método?
  i := 1;
  Result := 0;

  //while not Query1.Eof do
  for count := 1 to 10 do
  begin
    Result := Result + i;
  end;

  ShowMessage(IntToStr(Result));
end;


end.
