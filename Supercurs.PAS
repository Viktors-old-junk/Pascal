Uses sgraph,graph, crt;
var
d,e,r,Driver,Mode,code,ak,page :Integer;
DriverF:file;
DriverP:Pointer;
c :char;

PROCEDURE KEY(X,Y,X1,Y1,NUM:longint;STRR:STRING);
{???楤??? ᮧ????? ? ??ࠢ????? ????ࠦ????? ?????? ?? ??࠭?.}
VAR
CAPTION:STRING;

PROCEDURE OUTLINE;
{?뢮???????? ?? ??????}
BEGIN
SETCOLOR(0);
OUTTEXTXY(X+ROUND(((X1+2-LENGTH(CAPTION)*8)/2)),Y+ROUND((Y1+2-8)/2),CAPTION);
END;

PROCEDURE NOVISION;
{??????? ??????}
BEGIN
SETFILLSTYLE(1,GETPIXEL(X+3,Y+3));
BAR(X,Y,X+X1+1,Y+Y1+1);
END;

PROCEDURE VISION;
{????ᮢ??? ??????}
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
{??????? ??????}
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
IF STRR='???????' THEN ACTIV;
IF STRR='??????' THEN NOVISION;
IF STRR='??????' THEN VISION;
IF NUM=6500 THEN
BEGIN
CAPTION:=STRR;
OUTLINE;
END;

IF STRR='??????' THEN
{?????? ??????}
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
{???楤??? ᮧ????? ???㪫?? ??? ?????⮩ ࠬ??}
BEGIN
SETCOLOR(20);
LINE(X,Y,X1,Y);
LINE(X,Y,X,Y1);

SETCOLOR(15);
LINE(X,Y1,X1,Y1);
LINE(X1,Y,X1,Y1);
END;

procedure win(strr,strrr :string);
{???楤??? ᮧ????? ???? ?? ??࠭?}
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
{???楤??? ?뢮?? ??????}
begin
Bar(50,50,748,248);
if page = 1 then
begin
setcolor(45);
outtextxy(55,55,'?????? ?ணࠬ?? ????? ????祩 ? ?????? ?14 ???????? ?? ????ଠ⨪?.');
outtextxy(55,70,'????? ??????:');
outtextxy(55,105,'???? ????ࠫ???? ??᫠ n - A1..An.');
outtextxy(55,120,'??।????? ??᫮ ??????⮢ Ak ??᫥????⥫쭮??? A1..An');
outtextxy(55,145,'1)??????⢮?????? ?᫮???');
outtextxy(55,160,'  2^k < Ak < k!');
outtextxy(55,185,'2)??????? ?????? ???浪???? ?????? ? ??騥??');
outtextxy(55,200,'  ??????묨 ??᫠??.');
page := 2;
end
else
begin
setcolor(45);
outtextxy(55,55,'?????? ?ணࠬ?? ?ணࠬ?? ????? ᫥???騥 ??࠭?祭??:');
outtextxy(55,90,'??᫮ ??????⮢ ???ᨢ? ?? ?????.........1454');
outtextxy(55,105,'???????? ??᫮ ?? ?????...........2147483647');
outtextxy(55,140,'?????? ?롨?????? ?????让 TAB');
outtextxy(55,155,'??????                     F1');
outtextxy(55,170,'??室 ?? ?ணࠬ??         ESC');
page := 1;
end;
end;

procedure enter;
{???楤??? ????? ?????? ? ??????? ?⢥??}
var
akey :integer;
cntrlv, nvars, answer, x :longint;
c :char;
wstr,cv,strr :string[10];
An :array[1..1454] of longint;

procedure work;
{???楤??? ??????? ?⢥??}
var
x :longint;

procedure crcl(x,y:integer);
{???楤??? ᮧ????? "???ନ⥫?᪮??" ??㣠}
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
{?㭪??? ??????? 䠪??ਠ??}
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
{?㭪??? ??????? ?⥯???}
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
{?㭪??? ??।?????? ??⭮??? ??᫠.}
begin
crcl(349,524);
if n/2 - round(n/2) = 0
then chet := true
else chet := false;
end;

begin
{??????}
win('????? ?14','??????...');

for x := 1 to nvars do
if (an[x] > step(x)) and (an[x] < factor(x)) and (chet(x) = true) and (chet(an[x]) = false) then answer := answer + 1;

STR(ANSWER,STRR);

bar(450,300,598,548);
KEY(649,399,100,50,0,'???????');

bevel(512,304,595,316);
setcolor(0);
outtextxy(456,307,'?⢥?:');
outtextxy(515,307,strr);
if (copy(strr,length(strr)-1,1) = '6') or (copy(strr,length(strr)-1,1) = '7') or (copy(strr,length(strr)-1,1) = '7') or
(copy(strr,length(strr)-1,1) = '9') or (copy(strr,length(strr)-1,1) = '9') or (copy(strr,length(strr)-1,1) = '5') or
(copy(strr,length(strr)-1,1) = '0') then
outtextxy(456,320,'??????⮢');

if (copy(strr,length(strr)-1,1) = '2') or (copy(strr,length(strr)-1,1) = '3') or (copy(strr,length(strr)-1,1) = '4') then
outtextxy(456,320,'????????');

if (copy(strr,length(strr)-1,1) = '1') then
outtextxy(456,320,'???????');

win('????? ?14','?⢥?...');
readkey;
bar(450,300,598,548);
KEY(649,399,100,50,0,'???????');

end;

begin
{???? ??????}
win('????? ?14','????...  F1 - ??????');
setcolor(0);
bar(450,300,598,548);
for x := 1 to 1457 do
an[x] := 0;
nvars := 0;
answer := 0;
strr := '';

outtextxy(456,305,'???????   ???????');
outtextxy(456,395,'????騩 ???????:');
bevel(453,315,595,335);
bevel(453,405,595,425);

key(453,340,143,20,6500,'??????騩');
key(453,340,143,20,0,'???????');
akey := 1;
key(453,365,143,20,6500,'???');
key(453,365,143,20,0,'??????');

KEY(649,299,100,50,6500,'??????');
KEY(649,299,100,50,0,'??????');
KEY(649,399,100,50,6500,'????');
KEY(649,399,100,50,0,'??????');
KEY(649,499,100,50,6500,'??室');
KEY(649,499,100,50,0,'??????');

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
key(453,340,143,20,6500,'??????騩');
key(453,340,143,20,0,'??????');
akey:=2;
key(453,365,143,20,6500,'???');
key(453,365,143,20,0,'???????');
end

else

begin
key(453,340,143,20,6500,'??????騩');
key(453,340,143,20,0,'???????');
akey:=1;
key(453,365,143,20,6500,'???');
key(453,365,143,20,0,'??????');
end;
end;

if (c=#13) and (akey=1) then
begin
key(453,340,143,20,6500,'??????騩');
key(453,340,143,20,2000,'??????');
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
key(453,365,143,20,6500,'???');
key(453,365,143,20,3000,'??????');
c := #27;
work;
end;
until c = #27;
KEY(649,399,100,50,6500,'????');
KEY(649,399,100,50,0,'???????');
end;

procedure start;
{???楤??? ᮧ????? ??砫쭮?? ????ࠦ????}
begin
{??????砥??? ???⠭??????? ?ࠩ??? SVGA256.BGI}
{  Assign(DriverF, 'C:\TP\SVGA256.BGI');
  Reset(DriverF, 1);
  GetMem(DriverP, FileSize(DriverF));
  BlockRead(DriverF, DriverP^, FileSize(DriverF));
  InstallUserDriver('SVGA256',DriverP);
  DRIVER := 16;
{???????? ०?? 800x600x256}
{  Mode := 3;
  InitGraph(Driver, Mode, '');}
  InitSGraph(3);

SETFILLSTYLE(1,25);
BAR(0,0,799,599);
win('????? ?14','1998');
BEVEL(49,49,749,249);
BEVEL(399,349,49,299);
BEVEL(399,449,49,399);
BEVEL(399,549,49,499);
BEVEL(449,299,599,549);

KEY(649,299,100,50,6500,'??????');
KEY(649,299,100,50,0,'??????');
KEY(649,399,100,50,6500,'????');
KEY(649,399,100,50,0,'??????');
KEY(649,499,100,50,6500,'??室');
KEY(649,499,100,50,0,'??????');
KEY(649,399,100,50,0,'???????');
ak := 2;
page := 1;

setcolor(50);
outtextxy(74,321,'?????ਠ?');
outtextxy(74,421,'2 ? ?⥯??? "N"');
outtextxy(74,521,'??⭮?/????⭮? ??᫮');

help;
end;

begin
start;

repeat
c:=readkey;
win('????? ?14','F1 - ??????');
if (c=#9) and (ak = 1) then
begin
ak := 2;
KEY(649,299,100,50,6500,'??????');
KEY(649,299,100,50,0,'??????');
KEY(649,399,100,50,6500,'????');
KEY(649,399,100,50,0,'???????');
c := #0;
end;

if (c=#9) and (ak = 2) then
begin
ak := 3;
KEY(649,399,100,50,6500,'????');
KEY(649,399,100,50,0,'??????');
KEY(649,499,100,50,6500,'??室');
KEY(649,499,100,50,0,'???????');
c := #0;
end;

if (c=#9) and (ak = 3) then
begin
ak := 1;
KEY(649,299,100,50,6500,'??????');
KEY(649,299,100,50,0,'???????');
KEY(649,499,100,50,6500,'??室');
KEY(649,499,100,50,0,'??????');
c := #0;
end;

if (c=#13) and (ak=1) then
begin
KEY(649,299,100,50,3000,'??????');
c := #0;
help;
end;

if (c=#13) and (ak=2) then
begin
c := #0;
KEY(649,399,100,50,3000,'??????');
enter;
ak := 2;
end;

if (c=#13) and (ak=3) then
begin
KEY(649,499,100,50,3000,'??????');
c := #27;
end;

if c=#59 then
help;

until c=#27;

closegraph;
end.