unit dataInfo1;

interface

Type
  Class1 = class

  Public
     Function GetValue() : Integer;
     Function Soma(n : Integer) : Integer;
     Function Triplo() : Integer;
End;

implementation

function Class1.GetValue(): Integer;
begin
 Result := Soma(4);
end;

function Class1.Soma(n: Integer): Integer;
var
  valor : Integer;
begin
  if (n=0) or (n=1) then
    Valor := n
  else
  begin
    Valor := Soma(n-1);
    Valor := Valor + Soma(n-2);
    Valor := Valor + 1;
    //Soma := Soma(n-1) + Soma(n-2) + 1;

//    Soma:= Soma(3) + Soma(n-2) + 1;
//    Soma:= Soma(2) + Soma(n-2) + 1;
//    Soma:= Soma(1) + Soma(n-2) + 1;
//    Soma:= Soma(0) + Soma(n-2) + 1;
//    Soma:= Soma(0) + Soma(2) + 1;
//    Soma:= Soma(0) + Soma(1) + 1;
//    Soma:= Soma(0) + Soma(0) + 1;
  end;

  Soma := valor;
end;

Function Class1.Triplo: Integer;
var
  count : Integer;
  arrayOfIntegers : TArray<Integer>;
begin
  Result := 0;

  arrayOfIntegers := TArray<Integer>.Create(3,9,27);

  for count := 0 to 2 do
  begin
    Result := Result + arrayOfIntegers[count];
  end;

end;

end.
