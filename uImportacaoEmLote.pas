unit uImportacaoEmLote;

{
Rafael Hassegawa - Teste prático Desbravador
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmImportacaoLote = class(TForm)
    panemImportacaoEmLote: TPanel;
    panelBotoes: TPanel;
    btnFechar: TButton;
    Label1: TLabel;
    edArquivo: TEdit;
    btnAbrir: TButton;
    openDialog: TOpenDialog;
    btnProcessar: TButton;
    procedure btnProcessarClick(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportacaoLote: TfrmImportacaoLote;

implementation

uses
  classPessoa,
  classEndereco,
  uFuncoes,
  uDados;
{$R *.dfm}

procedure TfrmImportacaoLote.btnAbrirClick(Sender: TObject);
begin
  if openDialog.Execute = true then
  begin
    edArquivo.Text := openDialog.FileName;
  end;
end;

procedure TfrmImportacaoLote.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportacaoLote.btnProcessarClick(Sender: TObject);
var
  Arquivo : TStringList;
  ls_linha, ls_insert : string;
  count : integer;
  Pessoa : TPessoa;
  Endereco : TEndereco;
  erro : boolean;
begin
  //processar arquivo
  Arquivo := TStringList.Create;
  try
    Arquivo.LoadFromFile(edArquivo.Text);

    if Arquivo.Count > 50000 then
    begin
      ShowMessage('Atenção! Arquivos devem ter no máximo 50000 registros!');
      Exit;
    end;

    erro := false;

    for count := 0 to Arquivo.Count - 1 do
    begin
      ls_linha := Arquivo[count];

      try
        Pessoa := TPessoa.Create();
        Endereco := TEndereco.Create();

        //id pessoa
        Pessoa.idPessoa := RetornaIndicePessoa();

        //natureza
        Pessoa.flNatureza := StrToInt(Copy(ls_linha,1,1));

        //documento
        Pessoa.dsDocumento := trim(Copy(ls_linha,3,20));

        //nome
        Pessoa.nmPrimeiro := trim(Copy(ls_linha,24,100));

        //sobrenome
        Pessoa.nmSegundo := trim(Copy(ls_linha,125,100));

        //dt registro
        Pessoa.dtRegistro := Date;

        //id endereço
        Endereco.idEndereco := RetornaIndiceEndereco;

        //cep
        Endereco.dsCep := Copy(ls_linha,226,9);

        Endereco.idEndereco := RetornaIndiceEndereco;

        try
          Pessoa.Salvar;
          Endereco.Salvar(IntToStr(Pessoa.idPessoa));
        except
          erro := true;
        end;

      finally
        Pessoa.Free;
        Endereco.Free;
      end;

    end;

    if erro = false then
      ShowMessage('Arquivo importado com sucesso!')
    else
      ShowMessage('Arquivo importado com erros! Verifique!');

  finally
    Arquivo.Free;
  end;
end;

procedure TfrmImportacaoLote.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //pular campo com o ENTER
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
