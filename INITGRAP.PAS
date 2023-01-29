Program vano;
uses crt;
var
matr :array[1..100] of real;
x,otrelem,prinelem,ras :integer;
begin
clrscr;
writeln('Введите колличество элементов массива массива');
readln(ras);

for x:=1 to ras do
begin
write('X[',x,'] = ');
readln(matr[x]);
end;

for x:=1 to ras do
begin
write(matr[x]:15:2);
if matr[x]<0 then otrelem := otrelem+1;
if (matr[x]>=1) and (matr[x]<=2) then prinelem:=prinelem+1;
if (matr[x]>=0) and ((matr[x]<1) or (matr[x]>2)) then matr[x] := 1;
writeln(matr[x]:15:2);
end;

writeln('Число отрицательных членов = ',otrelem);
writeln('Число членов пренадлежащих отрезку [1..2] = ',prinelem);
readln;
end.

