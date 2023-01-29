program Hord_Cos;
{Метод хорд и косательных}
var
gran1,gran2,fun1,proisfun,fun2 :real;
i :INTEGER;
const
a = 1000;
b = 10;
c = 1;
d = 10;
begin
gran1 := -32000;
gran2 := 32000;
i := 0;
repeat
i := i + 1;
fun1 := a*gran1*gran1*gran1+b*gran1*gran1+c*gran1+d;
fun2 := a*gran2*gran2*gran2+b*gran2*gran2+c*gran2+d;
proisfun := 3*a*gran1*gran1+2*b*gran1+c;
if fun2 - fun1 <> 0 then gran1 := gran1 - (((gran2-gran1)*fun1)/(fun2-fun1));
gran2 := gran1 - (fun1/proisfun);
until (gran1 <= gran2+0.0009) AND (gran1 >= gran2-0.0009);
WRiTELN('Найден X = ',gran1:5:5,', Колличество циклов = ',i);
READLN;
end.