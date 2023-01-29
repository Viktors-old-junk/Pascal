program ddd;
uses graph,crt;
var
  grDriver: Integer;
  grMode: Integer;
  ErrCode: Integer;
n, x, y :integer;
c :char;
x1 :real;
matric :array [1..50,1..100] of real;
label
new;
begin
  grDriver := Detect;
  InitGraph(grDriver, grMode,'');
  new:
  cleardevice;
  setcolor(5);
  rectangle(0,0,639,479);
  rectangle(1,1,638,85);
  setcolor(9);
  setbkcolor(12);
  Outtextxy(10,20,'Здравствуйте! Я программа Кайкова Алексея, я решаю следующую задачу:');
  Outtextxy(10,40,'Вводится массив целых чисел размерностью 2N*N, вводится число X.');
  Outtextxy(10,60,'Если число в массиве больше чем X, то на экран выводится "0", иначе "1".');

outtextxy(20,115,'Введите размерность массива N ');
gotoxy(34,8);
readln(n);

outtextxy(20,150,'Введите контрольное число X ');
gotoxy(32,10);
readln(x1);

for x := 1 to n do
begin
for y := 1 to 2*n do
begin
outtextxy(20,170,'Введите элементы массива');
outtextxy(20,197,'Текущий элемент массива =');
window(29,13,39,13);
readln(matric[x,y]);
end;
end;
rectangle(5,210,315,225);
outtextxy(20,215,'Нажмите любую клавишу для расчета...');
readkey;
rectangle(1,235,52,250);
outtextxy(5,240,'Ответ:');
setcolor(3);
for x := 1 to n do
begin
for y := 1 to 2*n do
if matric[x,y] > x1 then
outtextxy(y*15-10,x*8+250,'0 ')
else
outtextxy(y*15-10,x*8+250,'1 ');
end;
readkey;
setcolor(15);
outtextxy(20,470,'Нажмите любую клавишу для продолжения или ESC для выхода');
c := readkey;
if c = #13 then goto new;
end.