program hm3;
var
a1,b1,x1,x2,X,fa,f1a,fb :real;
INTER :INTEGER;
const
a = 1000;
b = 10;
c = 1;
d = 10;
begin
a1 := -32000;
b1 := 32000;
INTER := 0;
repeat
INTER := INTER + 1;
fa := a*a1*a1*a1+b*a1*a1+c*a1+d;
fb := a*b1*b1*b1+b*b1*b1+c*b1+d;
f1a := 3*a*a1*a1+2*b*a1+c;
if fb - fa <> 0 then A1 := a1 - (((b1-a1)*fa)/(fb-fa));
B1 := a1 - (fa/f1a);
until (A1 <= B1+0.0009) AND (A1 >= B1-0.0009);
WRITELN('Найден X = ',A1:5:5,', Колличество циклов = ',inter);
READLN;
end.