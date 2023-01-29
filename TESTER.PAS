uses graph, crt;

procedure OpenGraph;
var Gd, Gm: Integer;
begin
Gd := Detect;
InitGraph(Gd, Gm, '');
if GraphResult <> grOk then
Halt(1);
end;

type
shape = object
 x,y,color:integer;
 Constructor shape(xu,yu,cu:integer);
 procedure draw;virtual;
 procedure mov(dx,dy,bgcolor:integer);
end;

circ = object(shape)
 radius:integer;
 Constructor circ(xu,yu,cu,ru:integer);
 procedure draw;virtual;
end;

Constructor shape.shape(xu,yu,cu:integer);
begin
x:=xu;
y:=yu;
color:=cu;
end;

procedure shape.draw;
begin
end;

Constructor circ.circ(xu,yu,cu,ru:integer);
begin;
shape(xu,yu,cu);
radius:=ru;
end;

procedure circ.draw;
begin
setfillstyle(0,color);
circle(x,y,radius);
end;

procedure shape.mov(dx,dy,bgcolor:integer);
begin
 setcolor(bgcolor);
 draw;
 x:=x+dx;
 y:=y+dy;
 setcolor(color);
 draw;
end;

var
www:circ;

begin
OpenGraph;
www.circ(200,200,green,20);
repeat
www.mov(1,0,black);
delay(2000);
until www.x>=1000;
CloseGraph;
end.