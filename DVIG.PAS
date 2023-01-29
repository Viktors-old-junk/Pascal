 uses Graph;

var
  grDriver: Integer;
  grMode: Integer;
  ErrCode: Integer;
  n1,n2,n3,n4,m,x,y,X1,X2,X3,Y1,Y2,Y3,A,m1,l1,xc,yc,m2,l2 :longint;
  L,R :real;

function modul(z:longint):longint;
begin
if z > 0 then modul := z
else
modul := z*-1;
end;

function primravn(z,f:real):boolean;
begin

if (z=f) then
primravn := true
else
primravn := false;
if (z<f+a) and (z>f-a) then
primravn := true
else
primravn := false;




end;

begin
  grDriver := Detect;
  InitGraph(grDriver, grMode,'');
  ErrCode := GraphResult;
  if ErrCode = grOk then
  begin  { Do graphics }
    X1 := 220;
    Y1 := 200;
    X2 := 300;
    Y2 := 200;
    A := 180;

setcolor(15);


m := sqr(x2-x1)+sqr(y2-y1);
r := sqrt(m);
l := 2*m*(1-cos(a));

xc := -1;
yc := -1;
for x:= 0 to 640 do
for y:= 0 to 480 do
begin

m1 := sqr(x-x1)+sqr(y-y1);
l1 := sqr(x-x2)+sqr(y-y2);

if primravn(m1,m) = true then
if primravn(l1,l) = true then
{if primravn(sqr(x-x1)+sqr(y-y1), m) = true then}
begin
line(X1,Y1,X,Y);
xc:= x;
yc := y;
end;


end;
{line(x1,y1,x2,y2);}

circle(x1,y1,round(r));
    Readln;
    CloseGraph;
    write(m,' ',r,' ',l,' ',xc,' ',yc);
    readln;
  end
  else
    Writeln('Graphics error:', GraphErrorMsg(ErrCode));
end.










{m1 := sqr(x3-x2)+sqr(y3-y2);
l1 := sqr(x3-x2)+sqr(y3-y2);

m2 := sqr(xc-x2)+sqr(yc-y2);
l2 := sqr(xc-x2)+sqr(yc-y2);

n1 := modul(m) - modul(m1);
n2 := modul(m) - modul(m2);
n3 := modul(l) - modul(l1);
n4 := modul(l) - modul(l2);}

{if (modul(n1) < modul(n2)) then
if (modul(n3) < modul(n4)) then}
