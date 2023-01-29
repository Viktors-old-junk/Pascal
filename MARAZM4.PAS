  Program Marazm4;
    type TMas=array[1..10,1..10] of integer;
    var Mas:TMas;
          n:byte;
          i,j,b:integer;
  procedure OutMatrix;
  begin
    for i := 1 to n do
    begin
    for j := 1 to n do
    begin
    Write(mas[i,j]:5);
    end;
    writeln;
    end;
    writeln;
  end;
  begin
    writeln('Вводим порядок матрицы [1..10]');
    readln(n);
    Writeln('Введите элементы массива...');
    for i := 1 to n do
    for j := 1 to n do
    readln(mas[i,j]);
    OutMatrix;
    for i := 1 to n do
    for j := 1 to i do
    begin
    b := mas[j,i];
    mas[j,i] := mas[i,j];
    mas[i,j] := b;
    end;
    OutMatrix;
    readln;
  end.