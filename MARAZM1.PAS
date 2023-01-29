Program Marazm1;
var
k :longint;
a,b,c,s,x :real;
const
e = 1.E-6;
begin
Write('Please, enter value "X" - ');
Readln(X);
a := sqr(sqr(x/3));
b := 0;
c := 0;
s := 0;
k := 1;
repeat
b := (2*k-1)*2*k;
c := (-1*a)/b;
s := s + c;
inc(k);
{Writeln(b:2:6,', ',c,', ',s:2:6,', ',k);}
until abs(c) < e;
Writeln('Answer - ',s:0:6);
Readln;
end.