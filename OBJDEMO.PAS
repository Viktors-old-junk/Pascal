Program aaaa;
uses crt;
type

MyObject = object
a,b,c :integer;
Procedure Create(ax,bx,cx :integer);
Procedure OutAnswer(x,y :integer);
end;

ChObject = object(MyObject)
Parent :MyObject;
end;

Procedure MyObject.Create(ax,bx,cx :integer);
begin
a := ax;
b := bx;
c := cx;
end;

Procedure MyObject.OutAnswer(x,y :integer);
var
d :real;
x1, x2 :real;
begin
d := Sqr(b)-4*a*c;
If d >= 0 then
begin
x1 := (-b-sqrt(d))/(2*a);
x2 := (-b+sqrt(d))/(2*a);
end;
Gotoxy(x,y);
Write('Answer:');
Gotoxy(x,y+1);
If d >= 0 then Write('X1 = ',x1:0:2) else Write('D < 0 - Not anyone answer.');
Gotoxy(x,y+2);
if d > 0 then Write('X2 = ',x2:0:2);
end;

var
OB :ChObject;
begin
clrscr;
OB.Parent.Create(2,4,-2);
OB.Parent.OutAnswer(10,10);
readkey;
end.