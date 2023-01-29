program fghg;
uses crt;
var
x,y :real;
begin
textcolor(5);
textbackground(3);
clrscr;
Writeln('Задача');
Writeln('Найти Y по условию:');
writeln('Y = 1/2√x если Х>=1');
writeln('Y = 1/3√x если 0<Х<1');
writeln('Y = 1/4√x если Х<=0');
writeln;
writeln('Введите Х');
readln(x);
if x>=1 then y:=1/2*sqrt(x);
if (x>0) and (x<1) then y:=1/3*sqrt(x);
if x=0 then y:=1/4*sqrt(x);
if x<0 then writeln('Ошибка!!! Отрицательное число!');

writeln('Ответ = ',y);
readln;
end.
