Uses
graph, crt;
var
d,e,r,c:integer;
strr:string;
Driver,Mode:Integer;
DriverF:file;
DriverP:Pointer;

PROCEDURE KEY(STRR:STRING; NUM:INTEGER);
VAR
X,Y,X1,Y1:INTEGER;
CAPTION:STRING;

PROCEDURE OUTLINE;
BEGIN
SETCOLOR(0);
OUTTEXTXY(X+ROUND(((X1+2-LENGTH(CAPTION)*8)/2)),Y+ROUND((Y1+2-8)/2),CAPTION);
END;

PROCEDURE NOVISION;
BEGIN
SETFILLSTYLE(1,GETPIXEL(X+3,Y+3));
BAR(X,Y,X+X1+1,Y+Y1+1);
END;

PROCEDURE VISION;
BEGIN
NOVISION;
OUTLINE;
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
END;


PROCEDURE ACTIV;
BEGIN
SETCOLOR(0);
RECTANGLE(X,Y,X+X1,Y+Y1);
SETCOLOR(15);
LINE(X+1,Y+1,X+X1-1,Y+1);
LINE(X+1,Y+1,X+1,Y+Y1-1);
SETCOLOR(0);
LINE(X+1,Y+Y1+1-1,X+X1+1-1,Y+Y1+1-1);
LINE(X+X1+1-1,Y,X+X1+1-1,Y+Y1+1);
SETCOLOR(23);
LINE(X+1+1,Y+Y1-1,X+X1-1,Y+Y1-1);
LINE(X+X1-1,Y-1+1,X+X1-1,Y+Y1-1-1);
SETCOLOR(28);
LINE(X+1+1,Y+1+1,X+X1-1-1,Y+1+1);
LINE(X+1+1,Y+1+1,X+1+1,Y+Y1-1-1);
END;

BEGIN
IF STRR='‹…‚€Ÿ' THEN X:=NUM;
IF STRR='‚…•ŸŸ' THEN Y:=NUM;
IF STRR='„‹ˆ€' THEN X1:=NUM;
IF STRR='˜ˆˆ€' THEN Y1:=NUM;
IF STRR='€Š’ˆ‚€' THEN ACTIV;
IF STRR='‘Š›’€' THEN NOVISION;
IF STRR='‚ˆ„…Œ€' THEN VISION;
IF NUM=6500 THEN
BEGIN
CAPTION:=STRR;
OUTLINE;
END;

IF STRR='€†€’€' THEN
BEGIN
DELAY(30000);
SETCOLOR(0);
RECTANGLE(X,Y,X+X1,Y+Y1);
SETCOLOR(23);
RECTANGLE(X+1,Y+1,X+X1,Y+Y1);
DELAY(30000);
END;

END;

{PROCEDURE KEYBOX(NUMBER:INTEGER; STRR:STRING; NUM:INTEGER);
VAR
n:integer;
KOOR:ARRAY[1..10,1..4] OF INTEGER;
CAPTIONS,ACTIV,VISIBLE:ARRAY[1..10] OF STRING;

PROCEDURE PUTCOOR(N :INTEGER);
BEGIN
KEY('‹…‚€Ÿ',KOOR[N,1]);
KEY('‚…•ŸŸ',KOOR[N,2]);
KEY('„‹ˆ€',KOOR[N,3]);
KEY('˜ˆˆ€',KOOR[N,4]);
END;

BEGIN
IF STRR='‹…‚€Ÿ' THEN KOOR[NUMBER,1]:=NUM;
IF STRR='‚…•ŸŸ' THEN KOOR[NUMBER,2]:=NUM;
IF STRR='„‹ˆ€' THEN KOOR[NUMBER,3]:=NUM;
IF STRR='˜ˆˆ€' THEN KOOR[NUMBER,4]:=NUM;
IF STRR='€Š’ˆ‚€' THEN
begin
for n:=1 to 10 do
Activ[n]:='‚ˆ„…Œ€';
Activ[NUMBER]:='€Š’ˆ‚€';
for n:=1 to 10 do
begin
putcoor(n);
key(activ[n],0);
end;
end;

IF STRR='‚ˆ„…Œ€' THEN
begin
VISIble[number]:='‚ˆ„…Œ€';
for n:=1 to 10 do
begin
putcoor(n);
key('‚ˆ„…Œ€',0);
end;
end;

IF NUM=6500 THEN
begin
captions[number]:=strr;
putcoor(number);
key(captions[number],6500);
end;

IF STRR='‘Š›’€' THEN
begin
putcoor(number);
key('‘Š›’€',0);
end;

IF STRR='€†€’€' THEN
begin
keybox(number,'€Š’ˆ‚€',0);
putcoor(number);
key('€†€’€',0);
end;
END;}

begin
  Assign(DriverF, 'SVGA256.BGI');
  Reset(DriverF, 1);
  GetMem(DriverP, FileSize(DriverF));
  BlockRead(DriverF, DriverP^, FileSize(DriverF));
  InstallUserDriver('SVGA256',DriverP);
  DRIVER := 16;
  Mode := 3;
  InitGraph(Driver, Mode, '');

SETFILLSTYLE(1,25);
BAR(0,0,799,599);
for c :=0 to 255 do
begin
str(c,strr);
SETFILLSTYLE(1,25);
BAR(0,0,199,199);
outtextxy(20,20,strr);

SETFILLSTYLE(1,c);
BAR(300,300,599,599);

readln;
end;


{KEYbox(1,'‹…‚€Ÿ',200);
KEYbox(1,'‚…•ŸŸ',200);
KEYbox(1,'„‹ˆ€',80);
KEYbox(1,'˜ˆˆ€',35);
KEYbox(1,'Š­®¯ª  1',6500);
KEYbox(1,'‚ˆ„…Œ€',0);

READKEY;

KEYbox(1,'€†€’€',0);
READKEY;}
end.
