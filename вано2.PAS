Program vano;
uses crt, graph;
var
matr :array[1..100] of real;
x,y,otrelem,prinelem,N,codeerr :integer;
Driver: Integer;
Mode: Integer;
readstr, numstr :string;

label
narray,nelement;

begin
  Driver := Detect;
  InitGraph(Driver, Mode,'');
SetBkColor(12);
setfillstyle(1,12);
setcolor(3);
rectangle(0,0,639,479);
setcolor(1);
rectangle(2,2,637,477);
setcolor(15);
outtextxy(10,10,'Задача:');
outtextxy(10,20,'Даны натуральные числа N, действительные числа А1..Аn.');
outtextxy(10,30,'В последовательности А1..Аn все неотрицательные члены, не');
outtextxy(10,40,'принадлежащие отрезку [1..2] заменить на единицу. Кроме того,');
outtextxy(10,50,'получить число отрицательных членов и членов принадлежащих отрезку.');
setcolor(11);
line(3,65,636,65);
line(3,85,636,85);

setcolor(15);
outtextxy(40,100,'Введите колличество элементов массива:');
window(45,7,48,7);
narray:
readln(readstr);
val(readstr,n,codeerr);
if (codeerr <> 0) or (n > 100) or (n < 0) then
begin
outtextxy(40,70,'Неправильно введено число, нажмите на любую клавишу и повторите ввод');
readkey;
bar(4,66,635,84);
goto narray;
end;

bar(4,86,635,476);

outtextxy(40,100,'Введите элеменнты массива. Всего элементов в массиве - ' + readstr);
window(38,9,53,9);
for x:=1 to N do
begin
Nelement:
bar(264,132,286,138);
str(x,numstr);
outtextxy(40,132,'Вводиться элемент массива № '+numstr);
readln(readstr);
val(readstr,matr[x],codeerr);
if codeerr <> 0 then
begin
outtextxy(40,70,'Неправильно введено число, нажмите на любую клавишу и повторите ввод');
readkey;
bar(4,66,635,84);
goto Nelement;
end;
end;

window(1,1,80,25);
bar(4,86,635,476);
outtextxy(40,70,'Ответ...');
outtextxy(80,100,'Было        Стало');

for x:=1 to N do
begin
y:=y+1;
If y = 36 then
begin
outtextxy(240,220,'Все элементы массива не умещаются на экран');
outtextxy(240,230,'Нажмите любую клавишу для продолжения...');
readkey;
bar(4,86,635,476);
y := 1;
end;
str(x,numstr);
outtextxy(5,100+y*10,numstr+')');

str(matr[x]:15:2,numstr);
outtextxy(15,100+y*10,numstr);

if matr[x]<0 then otrelem := otrelem+1;
if (matr[x]>=1) and (matr[x]<=2) then prinelem:=prinelem+1;
if (matr[x]>=0) and (matr[x]<1) or (matr[x]>2) then matr[x] := 1;
str(matr[x]:15:2,numstr);
outtextxy(115,100+y*10,numstr);

end;

str(otrelem,numstr);
Outtextxy(240,110,'Число отрицательных членов = '+numstr);
str(prinelem,numstr);
outtextxy(240,120,'Число членов пренадлежащих отрезку [1..2] = '+numstr);
readkey;
closegraph;
end.

