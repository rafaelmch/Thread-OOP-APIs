unit uFuncoes;

{
Rafael Hassegawa - Teste prático Desbravador
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses uDados;

function RetornaIndicePessoa() : Integer;
function RetornaIndiceEndereco() : Integer;
function formataDataMySql(data : string) : string;
Function Virgula(valor:string):string;

implementation

function RetornaIndicePessoa() : Integer;
var
  ls_sql : string;
begin
  ls_sql := 'select MAX(idPessoa) from pessoa';

  with frmDados.qGeral do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    Open;
  end;

  if frmDados.qGeral.RecordCount > 0 then
    RetornaIndicePessoa := FrmDados.qGeral.Fields[0].AsInteger + 1
  else
    RetornaIndicePessoa := 1;
end;

function RetornaIndiceEndereco() : Integer;
var
  ls_sql : string;
begin
  ls_sql := 'select MAX(idendereco) from endereco';

  with frmDados.qGeral do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    Open;
  end;

  if frmDados.qGeral.RecordCount > 0 then
    RetornaIndiceEndereco := FrmDados.qGeral.Fields[0].AsInteger + 1
  else
    RetornaIndiceEndereco := 1;
end;

function formataDataMySql(data : string) : string;
var
  ls_dia, ls_mes, ls_ano:string;
begin
  //ano-dia-mes
  ls_dia := copy(data,1,2);
  ls_mes := copy(data,4,2);
  ls_ano := copy(data,7,4);
  formataDataMySql := concat(ls_ano + '-' + ls_mes + '-' + ls_dia);
end;

Function Virgula(valor:string):string;
var
i, wMaximo : integer;
wValor_, wLetra:string;
begin
  wMaximo:=Length(valor);
  for i:= 1 to wMaximo do
  begin
    wLetra:=copy(valor,i,1);
    if wLetra = ',' then
      wLetra:='.';

    wValor_:=concat(wValor_+wLetra);
  end;
  result:=wValor_;
end;

end.
