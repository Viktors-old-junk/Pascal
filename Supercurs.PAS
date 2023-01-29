Uses sgraph,graph, crt;
var
d,e,r,Driver,Mode,code,ak,page :Integer;
DriverF:file;
DriverP:Pointer;
c :char;

PROCEDURE KEY(X,Y,X1,Y1,NUM:longint;STRR:STRING);
{Процедура создания и управления изображением Кнопки на экране.}
VAR
CAPTION:STRING;

PROCEDURE OUTLINE;
{Выводнадписи на кнопке}
BEGIN
SETCOLOR(0);
OUTTEXTXY(X+ROUND(((X1+2-LENGTH(CAPTION)*8)/2)),Y+ROUND((Y1+2-8)/2),CAPTION);
END;

PROCEDURE NOVISION;
{Стереть кнопку}
BEGIN
SETFILLSTYLE(1,GETPIXEL(X+3,Y+3));
BAR(X,Y,X+X1+1,Y+Y1+1);
END;

PROCEDURE VISION;
{Нарисовать кнопку}
BEGIN
NOVISION;
outline;
SETCOLOR(15);
LINE(X,Y,X+X1,Y);
LINE(X,Y,X,Y+Y1);
SETCOLOR(0);
LINE(X,Y+Y1+1,X+X1+1,Y+Y1+1);
LINE(X+X1+1,Y,X+X1+1,Y+Y1);
SETCOLOR(23);
LINE(X+1,Y+Y1,X+X1,Y+Y1);
LINE(X+X1,Y-1,X+X1,Y+Y1-1);
SETCOLOR(28);
LINE(X+1,Y+1,X+X1-1,Y+1);
LINE(X+1,Y+1,X+1,Y+Y1-1);

setlinestyle(1,1,1);
setcolor(25);
rectangle(x+4,y+4,x+x1-4,y+y1-4);
setlinestyle(0,1,1);

END;

PROCEDURE ACTIV;
{Выбрать кнопку}
BEGIN
SETCOLOR(0);
RECTANGLE(X,Y,X+X1,Y+Y1);
SETCOLOR(15);
LINE(X+1,Y+1,X+X1-1,Y+1);
LINE(X+1,Y+1,X+1,Y+Y1-1);
SETCOLOR(0);
LINE(X+1,Y+Y1,X+X1,Y+Y1);
LINE(X+X1,Y,X+X1,Y+Y1);
SETCOLOR(23);
LINE(X+2,Y+Y1-1,X+X1-1,Y+Y1-1);
LINE(X+X1-1,Y-2,X+X1-1,Y+Y1-2);
SETCOLOR(28);
LINE(X+2,Y+2,X+X1-2,Y+2);
LINE(X+2,Y+2,X+2,Y+Y1-2);
setlinestyle(1,1,1);
setcolor(0);
rectangle(x+4,y+4,x+x1-4,y+y1-4);
setlinestyle(0,1,1);
END;

BEGIN
IF STRR='АКТИВНА' THEN ACTIV;
IF STRR='СКРЫТА' THEN NOVISION;
IF STRR='ВИДЕМА' THEN VISION;
IF NUM=6500 THEN
BEGIN
CAPTION:=STRR;
OUTLINE;
END;

IF STRR='НАЖАТА' THEN
{Нажать кнопку}
BEGIN
SETCOLOR(0);
RECTANGLE(X,Y,X+X1,Y+Y1);
SETCOLOR(23);
RECTANGLE(X+1,Y+1,X+X1,Y+Y1);
DELAY(num);
activ;
END;
END;

PROCEDURE BEVEL(X,Y,X1,Y1:longint);
{Процедура создания выпуклой или вогнутой рамки}
BEGIN
SETCOLOR(20);
LINE(X,Y,X1,Y);
LINE(X,Y,X,Y1);

SETCOLOR(15);
LINE(X,Y1,X1,Y1);
LINE(X1,Y,X1,Y1);
END;

procedure win(strr,strrr :string);
{Процедура создания Окна на экране}
begin
setcolor(20);
line(3,0,3,595);
line(0,3,795,3);
line(4,24,795,24);
line(799,0,799,599);
line(0,599,799,599);
line(4,580,796,580);

setcolor(15);
line(0,0,0,599);
line(0,0,799,0);
line(4,21,796,21);
line(796,5,796,595);
line(4,596,796,596);
line(4,576,796,576);

setcolor(25);
line(1,22,798,22);
line(1,23,798,23);
line(1,577,798,577);
line(1,578,798,578);
setcolor(0);
bar(5,5,794,20);
bar(5,581,794,595);
outtextxy(10,8,strr);
outtextxy(10,585,strrr);
end;

procedure help;
{Процедура вывода помощи}
begin
Bar(50,50,748,248);
if page = 1 then
begin
setcolor(45);
outtextxy(55,55,'Данная программа является задачей к билету №14 экзамена по информатике.');
outtextxy(55,70,'Текст билета:');
outtextxy(55,105,'Даны натуральные числа n - A1..An.');
outtextxy(55,120,'Определить число элементов Ak последовательности A1..An');
outtextxy(55,145,'1)Удовлетворяющих условию');
outtextxy(55,160,'  2^k < Ak < k!');
outtextxy(55,185,'2)Имеющих четные порядковые номера и являющиеся');
outtextxy(55,200,'  нечетными числами.');
page := 2;
end
else
begin
setcolor(45);
outtextxy(55,55,'Данная программа программа имеет следующие ограничения:');
outtextxy(55,90,'Число элементов массива не более.........1454');
outtextxy(55,105,'Вводимое число но более...........2147483647');
outtextxy(55,140,'Кнопки выбираются клавишой TAB');
outtextxy(55,155,'Помощь                     F1');
outtextxy(55,170,'Выход из программы         ESC');
page := 1;
end;
end;

procedure enter;
{Процедура ввода данных и расчета ответа}
var
akey :integer;
cntrlv, nvars, answer, x :longint;
c :char;
wstr,cv,strr :string[10];
An :array[1..1454] of longint;

procedure work;
{Процедура расчета ответа}
var
x :longint;

procedure crcl(x,y:integer);
{Процедура создания "оформительского" круга}
var
n,nn,c :integer;
begin
nn := getpixel(x,y);
c:=30;
setcolor(c);
for n := 1 to 15 do
begin
setcolor(c+n);
circle(x,y,n);
delay(30);
end;

setcolor(nn);
for n := 0 to 15 do
begin
c:=15-n;
circle(x,y,c);
delay(30);
end;

end;

function factor (n:longint) :extended;
{Функция расчета факториала}
var
vars:extended;
x :longint;
begin
vars := 1;
crcl(349,324);
for x := 1 to n do
vars := vars * x;
factor := vars;
end;

function step(n:longint) :extended;
{Функция расчета степени}
var
vars:extended;
x :longint;
begin
vars := 1;
crcl(349,424);
for x := 1 to n do
vars := vars * 2;
step := vars;
end;

function chet(n:longint) :boolean;
{Функция определения четности числа.}
begin
crcl(349,524);
if n/2 - round(n/2) = 0
then chet := true
else chet := false;
end;

begin
{Расчет}
win('Билет №14','Расчет...');

for x := 1 to nvars do
if (an[x] > step(x)) and (an[x] < factor(x)) and (chet(x) = true) and (chet(an[x]) = false) then answer := answer + 1;

STR(ANSWER,STRR);

bar(450,300,598,548);
KEY(649,399,100,50,0,'АКТИВНА');

bevel(512,304,595,316);
setcolor(0);
outtextxy(456,307,'Ответ:');
outtextxy(515,307,strr);
if (copy(strr,length(strr)-1,1) = '6') or (copy(strr,length(strr)-1,1) = '7') or (copy(strr,length(strr)-1,1) = '7') or
(copy(strr,length(strr)-1,1) = '9') or (copy(strr,length(strr)-1,1) = '9') or (copy(strr,length(strr)-1,1) = '5') or
(copy(strr,length(strr)-1,1) = '0') then
outtextxy(456,320,'элементов');

if (copy(strr,length(strr)-1,1) = '2') or (copy(strr,length(strr)-1,1) = '3') or (copy(strr,length(strr)-1,1) = '4') then
outtextxy(456,320,'элемента');

if (copy(strr,length(strr)-1,1) = '1') then
outtextxy(456,320,'элемент');

win('Билет №14','Ответ...');
readkey;
bar(450,300,598,548);
KEY(649,399,100,50,0,'АКТИВНА');

end;

begin
{Ввод данных}
win('Билет №14','Ввод...  F1 - Помощь');
setcolor(0);
bar(450,300,598,548);
for x := 1 to 1457 do
an[x] := 0;
nvars := 0;
answer := 0;
strr := '';

outtextxy(456,305,'Введите   элемент');
outtextxy(456,395,'Текущий элемент:');
bevel(453,315,595,335);
bevel(453,405,595,425);

key(453,340,143,20,6500,'Следующий');
key(453,340,143,20,0,'АКТИВНА');
akey := 1;
key(453,365,143,20,6500,'Все');
key(453,365,143,20,0,'ВИДЕМА');

KEY(649,299,100,50,6500,'Помощь');
KEY(649,299,100,50,0,'ВИДЕМА');
KEY(649,399,100,50,6500,'Ввод');
KEY(649,399,100,50,0,'ВИДЕМА');
KEY(649,499,100,50,6500,'Выход');
KEY(649,499,100,50,0,'ВИДЕМА');

wstr :='';
x := 0;
setcolor(0);
bar(454,406,594,424);
str(nvars+1,cv);
outtextxy(456,412,cv);
repeat
c:=readkey;
if (c=#48) or (c=#49) or (c=#50) or (c=#51) or (c=#52) or (c=#53) or (c=#54) or (c=#55) or (c=#56) or (c=#57) then
begin
wstr :=concat(wstr,c);
val(wstr,cntrlv,code);
if code = 10 then
delete(wstr,length(wstr),1);
setcolor(0);
outtextxy(456,321,wstr);

bar(454,406,594,424);
str(nvars+1,cv);
outtextxy(456,412,cv);
end;

if c=#59 then
help;

if c=#8 then
begin
delete(wstr,length(wstr),1);
BAR(454,316,594,334);
setcolor(0);
outtextxy(456,321,wstr);
end;
if c=#9 then
begin
if akey=1 then
begin
key(453,340,143,20,6500,'Следующий');
key(453,340,143,20,0,'ВИДЕМА');
akey:=2;
key(453,365,143,20,6500,'Все');
key(453,365,143,20,0,'АКТИВНА');
end

else

begin
key(453,340,143,20,6500,'Следующий');
key(453,340,143,20,0,'АКТИВНА');
akey:=1;
key(453,365,143,20,6500,'Все');
key(453,365,143,20,0,'ВИДЕМА');
end;
end;

if (c=#13) and (akey=1) then
begin
key(453,340,143,20,6500,'Следующий');
key(453,340,143,20,2000,'НАЖАТА');
val(wstr,cntrlv,code);
if cntrlv > 0 then
begin
nvars := nvars +1;
val(wstr,an[nvars],code);
bar(454,406,594,424);
str(nvars+1,cv);
outtextxy(456,412,cv);
end;

BAR(454,316,594,334);
wstr := '';
end;

if (c=#13) and (akey=2) then
begin
key(453,365,143,20,6500,'Все');
key(453,365,143,20,3000,'НАЖАТА');
c := #27;
work;
end;
until c = #27;
KEY(649,399,100,50,6500,'Ввод');
KEY(649,399,100,50,0,'АКТИВНА');
end;

procedure start;
{Процедура создания начального изображения}
begin
{Подключается нестандартный драйвер SVGA256.BGI}
{  Assign(DriverF, 'C:\TP\SVGA256.BGI');
  Reset(DriverF, 1);
  GetMem(DriverP, FileSize(DriverF));
  BlockRead(DriverF, DriverP^, FileSize(DriverF));
  InstallUserDriver('SVGA256',DriverP);
  DRIVER := 16;
{Задается режим 800x600x256}
{  Mode := 3;
  InitGraph(Driver, Mode, '');}
  InitSGraph(3);

SETFILLSTYLE(1,25);
BAR(0,0,799,599);
win('Билет №14','1998');
BEVEL(49,49,749,249);
BEVEL(399,349,49,299);
BEVEL(399,449,49,399);
BEVEL(399,549,49,499);
BEVEL(449,299,599,549);

KEY(649,299,100,50,6500,'Помощь');
KEY(649,299,100,50,0,'ВИДЕМА');
KEY(649,399,100,50,6500,'Ввод');
KEY(649,399,100,50,0,'ВИДЕМА');
KEY(649,499,100,50,6500,'Выход');
KEY(649,499,100,50,0,'ВИДЕМА');
KEY(649,399,100,50,0,'АКТИВНА');
ak := 2;
page := 1;

setcolor(50);
outtextxy(74,321,'Факториал');
outtextxy(74,421,'2 в степени "N"');
outtextxy(74,521,'Четное/Нечетное число');

help;
end;

begin
start;

repeat
c:=readkey;
win('Билет №14','F1 - Помощь');
if (c=#9) and (ak = 1) then
begin
ak := 2;
KEY(649,299,100,50,6500,'Помощь');
KEY(649,299,100,50,0,'ВИДЕМА');
KEY(649,399,100,50,6500,'Ввод');
KEY(649,399,100,50,0,'АКТИВНА');
c := #0;
end;

if (c=#9) and (ak = 2) then
begin
ak := 3;
KEY(649,399,100,50,6500,'Ввод');
KEY(649,399,100,50,0,'ВИДЕМА');
KEY(649,499,100,50,6500,'Выход');
KEY(649,499,100,50,0,'АКТИВНА');
c := #0;
end;

if (c=#9) and (ak = 3) then
begin
ak := 1;
KEY(649,299,100,50,6500,'Помощь');
KEY(649,299,100,50,0,'АКТИВНА');
KEY(649,499,100,50,6500,'Выход');
KEY(649,499,100,50,0,'ВИДЕМА');
c := #0;
end;

if (c=#13) and (ak=1) then
begin
KEY(649,299,100,50,3000,'НАЖАТА');
c := #0;
help;
end;

if (c=#13) and (ak=2) then
begin
c := #0;
KEY(649,399,100,50,3000,'НАЖАТА');
enter;
ak := 2;
end;

if (c=#13) and (ak=3) then
begin
KEY(649,499,100,50,3000,'НАЖАТА');
c := #27;
end;

if c=#59 then
help;

until c=#27;

closegraph;
end.