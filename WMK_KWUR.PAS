program VMK_KvUr;
uses crt;
var
s :char;
a, b, c, d, e, k, x1, x2 :real;
label
dblx, onex, nox, ales, nw;
begin
nw:
clrscr;
writeln(' VKS Представлияет: ');
writeln('     Пpогpамму pешения Квадpатного уpовнения (полного).');
writeln('         Версия 1.0');
writeln('Введите коофициент при "X" в квадрате (вместе со знаком).');
readln(a);
writeln('Введите коофициент при "X" (вместе со знаком).');
readln(b);
writeln('Введите свободный член (вместе со знаком).');
readln(c);
writeln('Введите ответ - 0 или число (вместе со знаком).');
readln(e);
sound(500);
delay(20);
if e <> 0 then c := c + e;
sound(520);
delay(20);
d := sqr(b) - (4 * a * c);
sound(540);
delay(20);
Writeln('Дискриминант = ',d);
sound(560);
delay(20);
if d > 0 then goto dblx;
if d = 0 then goto onex;
if d < 0 then goto nox;

dblx:
sound(580);
delay(20);
x1 := ((b * -1) - sqrt(d)) / (2 * a);
sound(600);
delay(20);
x2 := ((b * -1) + sqrt(d)) / (2 * a);
sound(620);
delay(20);
k :=sqrt(d);
sound(640);
delay(20);
writeln('Корень из дискриминанта =',k);
sound(660);
delay(20);
Writeln('X1 = ',x1,' (Расчет для формулы с минусом)');
sound(680);
delay(20);
Writeln('X2 = ',x2,' (Расчет для формулы с плюсом)');
sound(700);
delay(20);
goto ales;

onex:
sound(580);
delay(20);
x1 := ((b * -1) + sqrt(d)) / (2 * a);
sound(600);
delay(20);
k :=sqrt(d);
sound(620);
delay(20);
writeln('Корень из дискриминанта =',k);
sound(640);
delay(20);
Writeln('X = ',x2,' (Дискриминант = 0)');
sound(660);
delay(20);
goto ales;


nox:
sound(580);
delay(20);
Writeln('Нет решения Дискриминант < 0');
sound(600);
delay(20);
goto ales;

ales:
nosound;
s := readkey;
if s = #27 then exit;
goto nw;
end.



