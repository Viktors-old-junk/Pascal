Program VMK1;
uses Crt;
var
D, e     : Char;
x, y, z  : real;
s        : Boolean;
begin
s := false;
x := 0;
y := 0;
x := 0;
repeat
clrscr;
writeln;
writeln('ÚÄÄÄÄÄÄÄÄ¿ÚÄÄÄ¿ÚÄÄÄ¿');
writeln('³ /      ³³ * ³³ - ³ VKS Present:');
writeln('ÀÄÄÄÄÄÄÄÄÙÀÄÄÄÙÀÄÄÄÙ     PC Š «ìªã«ïâ®à VMK');
writeln('ÚÄÄÄ¿ÚÄÄÄ¿ÚÄÄÄ¿ÚÄÄÄ¿');
writeln('³ 7 ³³ 8 ³³ 9 ³³   ³ Version 1.0');
writeln('ÀÄÄÄÙÀÄÄÄÙÀÄÄÄÙ³ + ³     Œ®áª¢  1998');
writeln('ÚÄÄÄ¿ÚÄÄÄ¿ÚÄÄÄ¿³   ³');
writeln('³ 4 ³³ 5 ³³ 6 ³³   ³');
writeln('ÀÄÄÄÙÀÄÄÄÙÀÄÄÄÙÀÄÄÄÙ');
writeln('ÚÄÄÄ¿ÚÄÄÄ¿ÚÄÄÄ¿ÚÄÄÄ¿');
writeln('³ 1 ³³ 2 ³³ 3 ³³   ³');
writeln('ÀÄÄÄÙÀÄÄÄÙÀÄÄÄÙ³ = ³');
writeln('ÚÄÄÄÄÄÄÄÄ¿ÚÄÄÄ¿³   ³');
writeln('³ 0      ³³ . ³³   ³');
writeln('ÀÄÄÄÄÄÄÄÄÙÀÄÄÄÙÀÄÄÄÙ');
write ('X = ');
readln(X);
write('„¥©áâ¢¨¥ = ');
readln(D);
write ('Y = ');
readln(Y);
case D of
'+': z := x + y;
'-': z := x - y;
'*': z := x * y;
'/': z := x / y;
else
s := true;
end;
if not s then
writeln('â¢¥â = ',z);
e := readkey;
if e = #27 then exit;
until s;
end.

