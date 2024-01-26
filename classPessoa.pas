unit classPessoa;

{
Rafael Hassegawa - Teste prático Desbravador
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses uPessoa,
  uCadPessoa,
  uDados,
  System.SysUtils,
  uFuncoes;

type TPessoa = class

  private

  public

  idPessoa : Integer;
  flNatureza : Integer;
  dsDocumento : String;
  nmPrimeiro : String;
  nmSegundo : String;
  dtRegistro : TDate;
  dsCep : String;

  function Salvar : boolean;
  function Atualizar : boolean;
  function Deletar(idPessoa : string) : boolean;
  procedure ExecutarQuery(query : string);
  Procedure Executar();
end;

implementation

function TPessoa.Salvar() : boolean;
var
  ls_sql : String;
begin
  ls_sql := 'insert into pessoa (idpessoa, flnatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) ' +
    'VALUES ("' + IntToStr(idPessoa) +'", "' +
    IntToStr(flNatureza) + '", "' +
    dsDocumento + '", "' +
    nmprimeiro + '", "' +
    nmsegundo + '", "' +
    formataDataMySql(DateToStr(dtregistro)) +'")';

  try
    ExecutarQuery(ls_sql);
    result := false;
  except
    result := true;
  end;
end;

function TPessoa.Atualizar;
var
  ls_sql : String;
begin
  ls_sql := 'UPDATE pessoa ' +
    'SET flnatureza = ' + IntToStr(flNatureza) + ', ' +
    'dsdocumento = "' + dsDocumento + '", ' +
    'nmprimeiro = "' + nmprimeiro + '", ' +
    'nmsegundo = "' + nmsegundo + '", ' +
    'dtregistro = "' + formataDataMySql(DateToStr(dtregistro)) + '"' +
    'where idpessoa = ' + IntToStr(idPessoa);

  try
    ExecutarQuery(ls_sql);
    result := false;
  except
    result := true;
  end;
end;

function TPessoa.Deletar(idPessoa : string) : boolean;
var
  ls_sql : string;
begin
  ls_sql := 'delete from pessoa where idpessoa = ' + idPessoa;

  try
    ExecutarQuery(ls_sql);
    result := false;
  except
    result := true;
  end;
end;

procedure TPessoa.ExecutarQuery(query : string);
begin
  with FrmDados.qGeral do
  begin
    Close;
    Sql.Clear;
    Sql.Add(query);
    try
      Execute;
    except

    end;
  end;
end;

Procedure TPessoa.Executar();
begin

  FrmDados.qGeral.SQL.Text := 'Select * From Clientes Where CodCli = :P_VALUE';

  FrmDados.qGeral.ParamByName('P_VALUE').AsInteger := 1;
  FrmDados.qGeral.Params[0].AsInteger := 1;
  FrmDados.qGeral.SQL.Text := StringReplace(FrmDados.qGeral.SQL.Text, ':P_VALUE', '1', [rfReplaceAll, rfIgnoreCase]);

end;




end.
