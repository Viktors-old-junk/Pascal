Unit GraphApp;

Interface

Uses GraphObj;
const
npoints = 1000;
type
Tgraphapp = object
points :array[1..npoints] of tpoint;
line :tline;
rect :trect;
circ :tcircle;
activeobj :integer;
Procedure init;
Procedure run;
Destructor done;
Procedure ShowAll;
Procedure MoveActiveObj(dx,dy :integer);
end;

Implementation

Uses Graph, Crt;
Procedure tgraphapp.init;
var
d,r,err,k : integer;
Begin
d := Detect;
InitGraph(d,r,'');
err := graphresult;
if err<>0 then
begin
grapherrormsg(err);
halt
end;

For k := 1 to npoints do
points[k].init(random(getmaxx),random(getmaxy),random(15)+1);

line.init(getmaxx div 3,getmaxy div 3,2*getmaxx div 3, 2*getmaxy div 3,lightred);

circ.init(getmaxx div 2,getmaxy div 2, getmaxy div 5, white);

rect.init(2*getmaxx div 5,2*getmaxy div 5, 3*getmaxx div 5, 3*getmaxy div 5,yellow);
showall;
activeobj := 1
end;

Procedure tgraphapp.run;
var
stop :boolean;
const
d = 5;
begin
stop := false;
repeat
case readkey of
#27 :stop := true;
#9 :begin
inc(activeobj);
if activeobj > 3 then
activeobj := 1;
end;
#0: case readkey of
#71: Moveactiveobj(-d,-d);
#72: Moveactiveobj(0,-d);
#73: Moveactiveobj(d,-d);
#75: Moveactiveobj(-d,0);
#77: Moveactiveobj(d,0);
#79: Moveactiveobj(-d,d);
#80: Moveactiveobj(0,d);
#81: Moveactiveobj(d,d);
end
end;
showall;
until stop;
end;

Destructor tgraphapp.done;
begin
closegraph;
end;

procedure tgraphapp.showall;
var
k :integer;
begin
for k := 1 to npoints do points[k].show;
line.show;
rect.show;
circ.show;
end;

procedure tgraphapp.moveactiveobj;
begin
case activeobj of
1:rect.moveto(dx,dy);
2:circ.moveto(dx,dy);
3:line.moveto(dx,dy);
end
end;
end.