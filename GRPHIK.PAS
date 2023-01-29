Program aaa;
 uses Graph;
var
  grDriver: Integer;
  grMode: Integer;
  ErrCode: Integer;
  X,y :LongInt;
begin
  grDriver := Detect;
  InitGraph(grDriver, grMode,'');
  ErrCode := GraphResult;
  if ErrCode = grOk then
  begin  { Do graphics }
    MoveTo(0,240);
    For x := -200 to 200 do
    Begin
      Y := x*x*x*x+11*x*x-11;
      LineTo(Round((640/400)*(200+x)),Round((480/1600439989)*y));
    End;
    Readln;
    CloseGraph;
  end
  else
    Writeln('Graphics error:', GraphErrorMsg(ErrCode));
end.
