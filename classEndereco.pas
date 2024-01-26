unit classEndereco;

{
Rafael Hassegawa - Teste prático Desbravador
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses uPessoa,
  uCadPessoa,
  uDados,
  System.SysUtils;

type TEndereco = class

  private

  public

  idEndereco : Integer;
  idPessoa : Integer;
  dsCep : String;

  function Salvar(idPessoa : string) : boolean;
  function Atualizar(idPessoa : string) : boolean;
  procedure ExecutarQuery(query : string);
end;

implementation

function TEndereco.Salvar(idPessoa : string) : boolean;
var
  ls_sql : string;
begin
  ls_sql := 'insert into endereco (idendereco, idpessoa, dscep) ' +
    'VALUES ("' + IntToStr(idEndereco) +'", "' +
    idPessoa + '", "' +
    dsCep +'")';

  try
    ExecutarQuery(ls_sql);
    result := false;
  except
    result := true;
  end;
end;

function TEndereco.Atualizar(idPessoa : string) : boolean;
var
  ls_sql : string;
begin
  ls_sql := 'UPDATE endereco ' +
    'SET dscep = "' + dsCep + '" ' +
    'where idpessoa = ' + idPessoa;

  try
    ExecutarQuery(ls_sql);
    result := false;
  except
    result := true;
  end;

end;

procedure TEndereco.ExecutarQuery(query : string);
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

end.
