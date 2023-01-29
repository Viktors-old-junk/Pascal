Program ggg;
uses crt;
var
number, marka,sloman,types :array[1..50] of string;
k,i,j,x,l :integer;
zaiavka :string;
begin
clrscr;
write('Сколько машин ? ');
readln(k);

clrscr;
x := 1;
for i := 1 to k do
begin
if l = x then x := x + 1;
Writeln('Машина ',i);
write(' номер - ');
readln(number[i]);
write(' марка - ');
readln(marka[i]);
write(' поломка - ');
readln(sloman[i]);

l := 0;
for j := 1 to x do
if (sloman[i] = types[j]) then j := x else l := l+1;

if l = x then types[x] := sloman[i];
end;


for i := 1 to x do
begin
write('Поломка - ',types[i]);
if length(types[i]) = 0 then write('отсутствует');
writeln;
for j := 1 to k do
if types[i] = sloman[j] then writeln(' Номер - ',number[j],' Марка - ',marka[j]);
end;

readln;
end.