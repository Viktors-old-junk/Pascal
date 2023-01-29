program ddd;
uses graph,crt;
var {Описание переменных}
ar :array[1..6,1..6] of real;
x,y,xgr,grDriver,grMode: Integer;
strr :string;
label {Описание меток}
start;

begin
  grDriver := Detect;
  InitGraph(grDriver, grMode,''); {Запуск графического режима экрана}

start:
for x := 1 to 6 do {Обнуление всех переменных в массиве}
for y := 1 to 6 do
ar[x,y] :=0;

cleardevice; {Стираем графический экран}
setcolor(10); {Устанавливаем цвет рисования}
setbkcolor(9); {Устанавливаем цвет фона}
setfillstyle(1,9); {Устанавливаем тип заливки и цвет для команды BAR}
rectangle(0,0,639,479); {Рисуем прямоугольник}
outtextxy(200,210,'Введите элементы массива:'); {Выводим на экран текст}
window(26,15,50,15); {Создаем текстовае окно для ввода цифр}

setcolor(4);
rectangle(195,205,405,245);
for x := 1 to 6 do {Считываем значения массива}
for y := 1 to 6 do
read(ar[x,y]);

for x := 1 to 6 do {Приравниваем к нулю главную диаганаль и все, что выше ее}
for y := 1 to 6 do
if y <= x then ar[x,y] :=0;

cleardevice;
outtextxy(20,300,'Ответ...');

for x := 0 to 6 do {Рисуем таблицу}
begin
xgr := round(106.5*x); {Определяем координаты по "Х"}
line(xgr,0,xgr,288); {Рисуем вертекальную линию}
xgr := (48*x); {Определяем координаты по "У"}
line(0,xgr,639,xgr); {Рисуем горизонтальную линию}
end;

for x:= 1 to 6 do {Записываем значения в таблицу}
for y:= 1 to 6 do
begin
str(ar[x,y]:13:0,strr); {Преобразуем число из ar[x,y] в строку в strr}
outtextxy(round(106.5*(x-1)),48*(y-1)+20,strr); {Записываем строку strr в таблицу}
end;

readkey; {Ждем нажатия на клавишу}
bar(1,289,638,478); {Рисуем закрашенную полосу}
outtextxy(20,300,'Хотите еще (Y/N)');
strr := readkey; {Записываем код нажатой клавиши  в strr}
if (strr = 'Y') or (strr = 'y') then goto start;

bar(1,289,638,478);
outtextxy(20,300,'Вы уверены? (Y/N)');
strr := readkey;
if (strr = 'N') or (strr = 'n') then goto start;

end.