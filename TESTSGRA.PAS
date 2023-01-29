 uses sGraph,GRAPH;

var
  grDriver: Integer;
  grMode: Integer;
  SIZE,ErrCode,X,Y,Z: INTEGER;
FF :FILE;
POI :POINTER;

begin
INITSGRAPH('1');

  ErrCode := GraphResult;
  if ErrCode = grOk then
  begin  { Do graphics }
{  FOR X := 20 TO 120 DO
  FOR Y := 20 TO 150 DO
  BEGIN
  PUTPIXEL(X,Y,TRUNC(256/(X+0.0001)*Y));
  END;
  SELCOLOR(15);
  RECTANGLE(20,20,120,150);
  RECTANGLE(0,0,319,199);
  RECTANGLE(0,0,639,399);
  RECTANGLE(0,0,639,479);
  RECTANGLE(0,0,799,599);
  RECTANGLE(0,0,1023,767);
  RECTANGLE(0,0,639,399);


  SIZE := IMAGESIZE(20,20,120,150);
  ASSIGN(FF,'GRAPHIMG.VGF');
  RESET(FF,SIZE);
  REWRITE(FF,SIZE);
  SIZE := IMAGESIZE(20,20,120,150);
  GETMEM(POI,SIZE);
  GETIMAGE(X,20,X,150,POI^);
  BlockWRITE(FF, POI^, SIZE);}

  ASSIGN(FF,'GRAPHIMG.VGF');
  RESET(FF,65535);
  GETMEM(POI,FILESIZE(FF));
  BLOCKREAD(FF,POI^,FILESIZE(FF));
  PUTIMAGE(100,100,POI^,0);

  Readln;
  CloseGraph;
  end
  else
    Writeln('Graphics error:', GraphErrorMsg(ErrCode));
end.
