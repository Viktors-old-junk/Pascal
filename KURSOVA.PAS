Program bilet14;
{Даны натуральные числа n - A1..An.
Определить число членов Ak последовательности A1..An

1)Удовлетворяющих условию
2^k < Ak < k!

2)Имеющих четные порядковые номера и являющиеся
нечетными числами.}
var
An :array[1..12] of longint;
x, nvars, answer :longint;

function factor (n:longint) :extended;
var
x :longint;
vars :extended;
begin
vars := 1;
for x := 1 to n do
vars := vars * x;
factor := vars;
end;

function step(n:longint) :extended;
var
vars :extended;
x :longint;
begin
vars := 1;
for x := 1 to n do
vars := vars * 2;
step := vars;
end;

function chet(n:longint) :boolean;
begin
if n/2 - round(n/2) = 0
then chet := true
else chet := false;
end;

procedure enter;
var
x :longint;
begin
writeln('Сколько вы хотели бы ввести переменных?');
readln(nvars);
for x := 1 to nvars do
begin
writeln('Переменная X',x);
readln(An[x]);
end;
end;

begin
enter;
for x := 1 to nvars do
{begin}
{writeln(x,' - ',factor(x):0:0);}
if (an[x] > step(x)) and (an[x] < factor(x)) and (chet(x) = true) and (chet(an[x]) = false) then answer := answer + 1;
{writeln(an[x],' ',step(x),'  ',an[x],' ',factor(x),'  ',chet(x),'  ',chet(an[x]));}
{end;}
writeln(answer);
readln;
end.
{При использовании типа REAL число членов -   33
                        DOUBLE            -  170
                        EXTENDED          - 1454
При использовании типа COMP программа виснет на 22 члене с ошибкой
№207-Недопустимая операция с плавующей запятой}