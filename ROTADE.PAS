 uses Graph,crt;

var
  grDriver: Integer;
  grMode: Integer;
  ErrCode: Integer;
  coo :arccoordstype;
  x,y,z :integer;

  procedure rotade(x1,y1,x2,y2,a :integer);
  var
  coo :arccoordstype;
  r1,r2,r3,a1 :integer;
  tg :real;
  begin
  r1 := round(sqrt(sqr(x1-x2)+sqr(y1-y2)));
  r2 := x2-x1;
  r3 := y2-y1;
  if r2 <> 0 then tg := r3/r2;
  a1 := round(arctan(tg)/(pi/180));
z := a1;
{  setactivepage(1);}
  arc(x1,y1,a,a+a1,r1);
  getarccoords(coo);
{  setactivepage(0);}
  line(x1,y1,x2,y2);
  setcolor(5);
  line(x1,y1,coo.xend,coo.yend);
  end;


begin
  grDriver := Detect;
  InitGraph(grDriver, grMode,'');
  ErrCode := GraphResult;
  if ErrCode = grOk then
  begin  { Do graphics }

rotade(200,200,100,100,0);

    Readln;
    CloseGraph;
    writeln(z);
    readln;
  end
  else
    Writeln('Graphics error:', GraphErrorMsg(ErrCode));
end.
