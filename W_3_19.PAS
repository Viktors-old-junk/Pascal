Program ggg;
uses crt;
var
number, marka,sloman,types :array[1..50] of string;
k,i,j,x,l :integer;
zaiavka :string;
begin
clrscr;
write('????쪮 ??設 ? ');
readln(k);

clrscr;
x := 1;
for i := 1 to k do
begin
if l = x then x := x + 1;
Writeln('??設? ',i);
write(' ????? - ');
readln(number[i]);
write(' ??ઠ - ');
readln(marka[i]);
write(' ??????? - ');
readln(sloman[i]);

l := 0;
for j := 1 to x do
if (sloman[i] = types[j]) then j := x else l := l+1;

if l = x then types[x] := sloman[i];
end;


for i := 1 to x do
begin
write('??????? - ',types[i]);
if length(types[i]) = 0 then write('???????????');
writeln;
for j := 1 to k do
if types[i] = sloman[j] then writeln(' ????? - ',number[j],' ??ઠ - ',marka[j]);
end;

readln;
end.