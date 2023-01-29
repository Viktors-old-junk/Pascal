program Find;
uses crt;
var
mas :array[1..100,1..100] of integer;
x,y,i,j,rasi,rasj,p,summa,i1,j1 :integer;

begin
textbackground(9);
highvideo;
clrscr;
textcolor(15);
writeln('Программа поиска суммы нечетных элементов в выделенной части');
writeln('массива. Версия 1.0');

textbackground(3);
textcolor(14);
window(5,5,40,5);
clrscr;
write('Введите размерность по J = ');
readln(rasj);
write('Размерность по J = ',rasj);

window(5,7,40,7);
clrscr;
write('Введите размерность по I = ');
readln(rasi);
write('Размерность по I = ',rasi);

window(1,1,80,25);
gotoxy(5,9);
textbackground(9);
write('Вводятся элементы массива');
textbackground(3);
window(5,10,50,10);
clrscr;
for x := 1 to rasi do
for y := 1 to rasj do
begin
write('Текущий элемент массива - [',x,',',y,'] = ');
readln(mas[x,y]);
end;
Write('Все элементы массива введены');

window(5,12,60,12);
clrscr;
write('Введите координаты точки [J,I] по горизонтали = ');
readln(j);
write('Координаты точки [J,I] по горизонтали = ',j);

window(5,14,60,14);
clrscr;
write('Введите координаты точки [J,I] по вертикали = ');
readln(i);
write('Координаты точки [J,I] по вертикали = ',i);

textbackground(2);
textcolor(4);
window(62,1,80,25);
clrscr;
write('╔═══╤═══╤═══╤═════╗');
Write('║  №│  I│  J│    P║');

i1 := i;

for j1 := 1 to rasj do
begin
if j1 > j then i1 := i1 - 1;
if i1 >= 1 then
begin
summa := 0;
for x := i1+1 to rasi do
for y := j1+1 to rasj do
if odd(mas[x,y]) = true then summa := summa + mas[x,y];
write('║',j1:3,'│',i1:3,'│',j1:3,'│',summa:5,'║');
end;
end;
write('╚═══╧═══╧═══╧═════╝');

readkey;
end.

