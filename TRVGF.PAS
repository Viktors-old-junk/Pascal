 uses Graph;

var
  grDriver: Integer;
  grMode: Integer;
  ErrCode: Integer;
  x1,y1,x2,y2 :INTEGER;
  ff: file of WORD;
  data :WORD;
  x,y :integer;
  seekff: LONGINT;
  DAT,XD,YD :LONGINT;

begin
  grDriver := Detect;
  InitGraph(grDriver, grMode,'');
  ErrCode := GraphResult;
  if ErrCode = grOk then
  begin  { Do graphics }

  x1 :=0;
  y1 :=0;
  x2 :=639;
  Y2 :=479;




    Line(0, 0, GetMaxX, GetMaxY);
    bar(20,20,50,100);
    setcolor(10);
    circle(35,60,20);
    setcolor(3);
    rectangle(10,10,60,110);


    assign(ff,'vgi.vgi');
    rewrite(ff);
    reset(ff);

DAT := X2-X1;
XD := 0;

REPEAT

IF DAT - 255 > 0 THEN
BEGIN
DAT := DAT-255;
XD := XD+1;
END;

UNTIL DAT - 255 > 0;

seekff := 0;
seek(ff,seekff);
DATA := DAT;
write(FF,DATA);

seekff := seekff+1;
seek(ff,seekff);
DATA := XD;
write(FF,DATA);

DAT := Y2-Y1;
XD := 0;
REPEAT
IF DAT - 255 > 0 THEN
BEGIN
DAT := DAT-255;
XD := XD+1;
END;
UNTIL DAT - 255 < 0;

seekff := seekff+1;
seek(ff,seekff);
DATA := DAT;
write(FF,DATA);

seekff := seekff+1;
seek(ff,seekff);
DATA := XD;
write(FF,DATA);




for x := x1 to x2 do
for y := y1 to y2 do
begin
seekff := seekff+1;
seek(ff,seekff);
dATA := getpixel(x,y);
write(ff,data);
end;



    Readln;
    CloseGraph;
  end
  else
    Writeln('Graphics error:', GraphErrorMsg(ErrCode));
end.
