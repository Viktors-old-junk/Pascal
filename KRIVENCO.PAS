program ddd;
uses graph, crt;
var
mat :array[1..50,1..50] of real;
x,y,z,k,rasm,grDriver, grMode: Integer;
strr,strr2 :string;
label
pusk;

begin
grDriver := Detect;
InitGraph(grDriver, grMode,'');

pusk:
setfillstyle(1,3);
bar(0,0,639,479);

setcolor(5);
textcolor(5);
rectangle(1,1,638,478);

rectangle(95,95,432,112);
window(42,7,54,7);
outtextxy(100,100,'Введите размерность массива:');
gotoxy(42,7);
readln(rasm);

bar(95,95,432,112);
rectangle(95,95,432,112);
gotoxy(42,7);

for x :=1 to rasm do
begin
for y :=1 to rasm do
begin
strr := 'Введите X';

bar(95,95,432,112);
rectangle(95,95,432,112);
gotoxy(42,7);

str(x,strr2);
strr := strr+strr2+',';
str(y,strr2);
strr := strr+strr2;
outtextxy(100,100,strr);
readln(mat[x,y]);
end;
end;

bar(95,195,432,212);
rectangle(95,195,432,212);
outtextxy(99,199,'Одинаковых строк нет');

for x := 1 to rasm do
begin

for k := x+1 to rasm do
begin
z := 0;

for y := 1 to rasm do
begin

if mat[x,y] = mat[k,y] then z := z+1;

if z = rasm then
begin
bar(95,195,432,212);
rectangle(95,195,432,212);
strr := 'Одинаковы строки - ';
str(x,strr2);
strr := strr + strr2 + ' и ';
str(k,strr2);
strr := strr + strr2;
outtextxy(99,199,strr);
readkey;
readkey;
end;
end;
end;
end;

rectangle(95,295,432,312);
outtextxy(99,299,'Хотите еще? (Y/N)');
strr := readkey;
if (strr = 'Y') or (strr = 'y') then goto pusk;
bar(95,295,432,312);

closegraph;
end.