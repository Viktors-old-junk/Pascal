PROGRAM HomeWork1;
uses crt;

procedure setwindow(left,top,rigth,down,coltext,colfon: integer);
{Процедура устанавливает тексовое окно, цвет его фона и символов}
begin
textbackground(colfon);
textcolor(coltext);
window(left,top,rigth,down);
clrscr;
end; {Setwindow}

procedure setscreen;
{Процедура рисует общий вид программы на экране}
begin
highvideo;
textbackground(2);
clrscr;
textbackground(3);
window(2,2,79,24);
clrscr;

setwindow(5,3,75,5,4,2);
writeln('               Программа - калькулятор. Версия 1.0');
writeln('    Программа предназначенна для расчета простейших арифметических');
write('действий по вводимой формуле.');

setwindow(40,8,75,9,1,2);
writeln('Пример ввода формулы:');
write('                   24*22 или 100-78');

setwindow(30,11,50,11,1,2);
write('   Введите формулу:');

setwindow(30,12,50,12,1,0);

setwindow(30,14,50,14,1,2);
write('        Ответ:');

setwindow(30,15,50,15,1,0);

setwindow(1,25,80,25,15,2);
write(' ESC - Выход');
end; {SetScreen}

procedure analiz;
{Процедура ввода формулы, ее анализа и вывода результатов на экран}
var
x,x1,x2 :longint;
{x - Параметр цикла}
{x1,x2 - Переменные над еоторыми будут производиться действия}
errorcode :integer;
{Содержит код ошибки при преобразовании строки в число}
y :real;
{Содержит ответ}
data :string[15];
{Содержит формулу}
x1s,x2s :string[7];
{Содержат строковые представления переменных x1, x2}
funct :char;
{Содержит действие}

procedure outerror;
{Выводит на экран сообщение об ошибке}
begin
setwindow(30,15,50,15,13,0);
write('Ошибка');
end; {OutError}

begin
setscreen;
setwindow(30,12,50,12,15,0);
readln(data);
write(data);
{Вводим DATA}

x1s := '';
x2s := '';

for x := 1 to length(data) do
begin

if (data[x] = '/') or (data[x] = '*') or (data[x] = '-') or (data[x] = '+') then
begin
funct := data[x]; {Получаем действие}
delete(data,0,x);
x2s := data; {Получаем x2}
break;
end;
x1s :=x1s + data[x]; {Получаем x1}
end;

val(x1s,x1,errorcode); {Преобразуем строку в число}
if errorcode <> 0 then {Если есть ошибка то}
begin
outerror; {выводим сообщение}
exit; {завершаем работу подпрограммы}
end;

val(x2s,x2,errorcode); {Аналогично предидущему}
if errorcode <> 0 then
begin
outerror;
exit;
end;

if x2 =0 then {x2 может быть знаменателем, надо проверить его на 0}
begin
outerror;
exit;
end;

case funct of {Производим действие}
'/' :y := x1/x2;
'*' :y := x1*x2;
'-' :y := x1-x2;
'+' :y := x1+x2;
else
begin {Если неизвестное действие то}
outerror; {выводим сообщение об ошибке}
exit; {завершаем работу подпрограммы}
end;

end;
setwindow(30,15,50,15,15,0);
write(y:10:10); {Выводим ответ}
end; {analiz}

procedure application_run;
{Зацикливает работу программы до нажатия клавиши ESC}
var
ch:char;
{Содержит код клавиши}
begin
repeat
analiz;
ch := readkey;
until ch = #27; {Код клавиши ESC}
end; {application_run}

begin {Главная программа}
application_run;
end.