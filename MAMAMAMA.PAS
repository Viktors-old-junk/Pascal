




Program mmm;
uses crt;
var
matrica: array[1..6,1..9] of real;
x,y,strmin,strmax :integer;
z :char;
min,max,chislo :real;
label start;
begin
start:
clrscr;
textbackground(5);
textcolor(3);
clrscr;
window(4,4,74,8);
write('В данной  действительной матрице  размера 6*9  поменять  местами строку');
write('содержащую  элемент  с  наибольшим    значением,  со  строкой  содержащейэлемент  с  наименьшим  значением. ');
write('Предполагается,  что  эти  элементыединственны.');
for x := 1 to 6 do
for y := 1 to 9 do
begin
window(30,11,51,12);
writeln('введите элемент [',x,',',y,']');
window(30,13,51,13);
readln(matrica[x,y]);
end;
min := matrica[1,1];
max := matrica[1,1];
strmax := 1;
strmin := 1;
for x := 1 to 6 do
for y := 1 to 9 do
begin
if matrica[x,y] > max then
begin
max := matrica[x,y];
strmax := y;
end;
if matrica[x,y] < min then
begin
min := matrica[x,y];
strmin := y;
end;
end;
window(1,1,80,25);
clrscr;
gotoxy(30,1);
writeln('исходная матрица');
for x := 1 to 9 do
writeln(x,')',matrica[1,x]:12:2,matrica[2,x]:12:2,matrica[3,x]:12:2,matrica[4,x]:12:2,matrica[5,x]:12:2,matrica[6,x]:12:2);
for x := 1 to 6 do
begin
chislo := matrica[x,strmax];
matrica[x,strmax] := matrica[x,strmin];
matrica[x,strmin] := chislo;
end;
gotoxy(30,12);
writeln('Конечная матрица');
for x := 1 to 9 do
writeln(x,')',matrica[1,x]:12:2,matrica[2,x]:12:2,matrica[3,x]:12:2,matrica[4,x]:12:2,matrica[5,x]:12:2,matrica[6,x]:12:2);
writeln('Максимальный элемент = ',max:12:2,'  Перемещен из строки ',strmax,' в строку ',strmin);
writeln('Минимальный  элемент = ',min:12:2,'  Перемещен из строки ',strmin,' в строку ',strmax);
readln;

writeln( 'Вы хотите закончить программу [Y/N]');
z:=readkey;
case z of
'Y','y':writeln('Выхожу');
'N','n':goto start;
end;
end.