unit dataInfo2;

interface

Type

Class1 = class
  Public
     Valor_1 :Integer;
     Valor_2 :Integer;
     Valor_3 :Integer;
     Function Totalizar() : Integer;
End;

Class2 = class
  Public
     Values : array of Class1;
     procedure SetValue(Valores : Class1);
     Function Totalizar() : Integer;
End;

implementation

Function Class2.Totalizar() : Integer;
Var
  Indice : Integer;
begin

  Result := 0;

  for Indice := 0 to Length(Values) - 1 do
  Begin
     Result := Result + Values[Indice].Valor_1 - Values[Indice].Valor_2 + Values[Indice].Valor_3;
  End;

end;

procedure Class2.SetValue(Valores : Class1);
begin

try
  SetLength(Values, Length(Values) + 1);
  Values[Length(Values)-1] := Valores;
Except
End;

end;


Function Class1.Totalizar() : Integer;
Var
  Valores : Class2;
begin

  Valores := Class2.Create();
  Valor_1 := 2;
  Valor_2 := 3;
  Valor_3 := 4;
  Valores.SetValue(Self);
  Valor_1 := 5;
  Valor_2 := 6;
  Valor_3 := 7;
  Valores.SetValue(Self);
  Valor_1 := 8;
  Valor_2 := 9;
  Valor_3 := 10;
  Valores.SetValue(Self);
  Valores := Class2.Create();
  Valor_1 := 11;
  Valor_2 := 12;
  Valor_3 := 13;
  Valores.SetValue(Self);


  Result := Valores.Totalizar();

end;

end.
