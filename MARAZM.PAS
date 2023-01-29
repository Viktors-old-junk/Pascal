Program aaa;
uses crt;
var
  x,y,z :real;
  halfsum :real;
begin
  Writeln('Введите три не равных действительных числа.');
  Write('X = ');
  Readln(x);
  Write('Y = ');
  Readln(y);
  Write('Z = ');
  Readln(z);
  Writeln('Вы ввели X = ',x:0:2,', Y = ',y:0:2,', Z = ',z:0:2);
	If x+y+z < 1 then
  begin
    Writeln('Сумма введенных значений меньше, чем 1.');
    If (x < y) and (x < z) then x := (y+z)/2 else
    begin
      If (y < x) and (y < z) then y := (x+z)/2 else
        If (z < x) and (z < y) then z := (x+y)/2;
    end;
  end
  else
  begin
    Writeln('Сумма введенных значений больше или равна 1.');
    If x < y then x := (y+z)/2 else
      If y < x then y := (x+z)/2;
  end;
  Writeln('Ответ X = ',x:0:2,', Y = ',y:0:2,', Z = ',z:0:2);
  readln;
end.
