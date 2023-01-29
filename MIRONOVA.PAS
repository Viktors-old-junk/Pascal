program ddd;
uses graph,crt;
var
x,y,x1,y1,xgr,xgr1 :integer;
ar :array[1..6,1..6] of real;
  grDriver: Integer;
  grMode: Integer;
  strr :string;
label
start;

begin
  grDriver := Detect;
  InitGraph(grDriver, grMode,'');

start:
for x := 1 to 6 do
begin
for y := 1 to 6 do
ar[x,y] :=0;
end;

setcolor(4);
setfillstyle(4,8);
bar(0,0,639,479);
outtextxy(20,300,'Введите числа во все ячейки');

xgr1 := 2;
for y := 1 to 6 do
begin
bar(0,0,639,288);

for x1:= 1 to 6 do
begin
for y1:= 1 to 6 do
begin
str(ar[x1,y1]:13:0,strr);
if ar[x1,y1] <> 0 then
outtextxy(round(106.5*(x1-1)),48*(y1-1)+20,strr);
end;
end;

for x1 := 0 to 6 do
begin
xgr := round(106.5*x1);
line(xgr,0,xgr,288);
end;

for x1 := 0 to 6 do
begin
xgr := (48*x1);
line(0,xgr,639,xgr);
end;

window(2,xgr1,13,xgr1);
gotoxy(2,xgr1);
read(ar[1,y]);
bar(0,0,639,299);

for x1:= 1 to 6 do
begin
for y1:= 1 to 6 do
begin
str(ar[x1,y1]:13:0,strr);
if ar[x1,y1] <> 0 then
outtextxy(round(106.5*(x1-1)),48*(y1-1)+20,strr);
end;
end;

for x1 := 0 to 6 do
begin
xgr := round(106.5*x1);
line(xgr,0,xgr,288);
end;

for x1 := 0 to 6 do
begin
xgr := (48*x1);
line(0,xgr,639,xgr);
end;

window(15,xgr1,26,xgr1);
gotoxy(15,xgr1);
read(ar[2,y]);
bar(0,0,639,299);

for x1:= 1 to 6 do
begin
for y1:= 1 to 6 do
begin
str(ar[x1,y1]:13:0,strr);
if ar[x1,y1] <> 0 then
outtextxy(round(106.5*(x1-1)),48*(y1-1)+20,strr);
end;
end;

for x1 := 0 to 6 do
begin
xgr := round(106.5*x1);
line(xgr,0,xgr,288);
end;

for x1 := 0 to 6 do
begin
xgr := (48*x1);
line(0,xgr,639,xgr);
end;

window(28,xgr1,39,xgr1);
gotoxy(28,xgr1);
read(ar[3,y]);
bar(0,0,639,299);

for x1:= 1 to 6 do
begin
for y1:= 1 to 6 do
begin
str(ar[x1,y1]:13:0,strr);
if ar[x1,y1] <> 0 then
outtextxy(round(106.5*(x1-1)),48*(y1-1)+20,strr);
end;
end;

for x1 := 0 to 6 do
begin
xgr := round(106.5*x1);
line(xgr,0,xgr,288);
end;

for x1 := 0 to 6 do
begin
xgr := (48*x1);
line(0,xgr,639,xgr);
end;

window(42,xgr1,53,xgr1);
gotoxy(42,xgr1);
read(ar[4,y]);
bar(0,0,639,299);

for x1:= 1 to 6 do
begin
for y1:= 1 to 6 do
begin
str(ar[x1,y1]:13:0,strr);
if ar[x1,y1] <> 0 then
outtextxy(round(106.5*(x1-1)),48*(y1-1)+20,strr);
end;
end;

for x1 := 0 to 6 do
begin
xgr := round(106.5*x1);
line(xgr,0,xgr,288);
end;

for x1 := 0 to 6 do
begin
xgr := (48*x1);
line(0,xgr,639,xgr);
end;

window(55,xgr1,66,xgr1);
gotoxy(55,xgr1);
read(ar[5,y]);
bar(0,0,639,299);

for x1:= 1 to 6 do
begin
for y1:= 1 to 6 do
begin
str(ar[x1,y1]:13:0,strr);
if ar[x1,y1] <> 0 then
outtextxy(round(106.5*(x1-1)),48*(y1-1)+20,strr);
end;
end;

for x1 := 0 to 6 do
begin
xgr := round(106.5*x1);
line(xgr,0,xgr,288);
end;

for x1 := 0 to 6 do
begin
xgr := (48*x1);
line(0,xgr,639,xgr);
end;

window(68,xgr1,79,xgr1);
gotoxy(68,xgr1);
read(ar[6,y]);
bar(0,0,639,299);

for x1:= 1 to 6 do
begin
for y1:= 1 to 6 do
begin
str(ar[x1,y1]:13:0,strr);
if ar[x1,y1] <> 0 then
outtextxy(round(106.5*(x1-1)),48*(y1-1)+20,strr);
end;
end;

for x1 := 0 to 6 do
begin
xgr := round(106.5*x1);
line(xgr,0,xgr,288);
end;

for x1 := 0 to 6 do
begin
xgr := (48*x1);
line(0,xgr,639,xgr);
end;

xgr1 := xgr1+3;
end;
bar(0,0,639,479);
outtextxy(20,300,'Работаю...');

for x := 1 to 6 do
begin
for y := 1 to 6 do
if y <= x then ar[x,y] :=0;
end;


bar(0,0,639,479);
outtextxy(20,300,'Ответ...');

for x1:= 1 to 6 do
begin
for y1:= 1 to 6 do
begin
str(ar[x1,y1]:13:0,strr);
outtextxy(round(106.5*(x1-1)),48*(y1-1)+20,strr);
end;
end;

for x1 := 0 to 6 do
begin
xgr := round(106.5*x1);
line(xgr,0,xgr,288);
end;

for x1 := 0 to 6 do
begin
xgr := (48*x1);
line(0,xgr,639,xgr);
end;
readkey;

bar(0,289,639,479);
outtextxy(20,300,'Хотите еще (Y/N)');
gotoxy(3,60);
strr := readkey;
if (strr = 'Y') or (strr = 'y') then goto start;
closegraph;
end.