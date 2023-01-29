Unit Graphobj;
interface
type

tgraphobj = object
x,y :integer;
color :word;
constructor init(ax,ay: integer; acolor :word);
procedure draw(acolor: word); virtual;
procedure show;
procedure hide;
procedure moveto(dx,dy :integer);
end;

tpoint = object(tgraphobj)
procedure draw(acolor :word); virtual;
end;

tline = object(tgraphobj)
dx,dy :integer;
constructor init(x1,y1,x2,y2 :integer; acolor :word);
procedure draw(acolor :word); virtual;
end;

tcircle = object(tgraphobj)
r :integer;
constructor init(ax,ay,ar :integer; acolor: word);
procedure draw(acolor :word); virtual;
end;

trect = object(tline)
procedure draw(acolor:word); virtual;
end;

implementation

uses graph;

constructor tgraphobj.init;
begin
x := ax;
y := ay;
color := acolor;
end;


procedure tgraphobj.draw;
begin

end;

procedure tgraphobj.show;
begin
draw(color);
end;

procedure tgraphobj.hide;
begin
draw(getbkcolor);
end;

procedure tgraphobj.moveto;
begin
hide;
x := x+dx;
y := y+dy;
show
end;

procedure tpoint.draw;
begin
putpixel(x,y,color);
end;

constructor tline.init;
begin
inherited init(x1,y1,acolor);
dx := x2-x1;
dy := y2-y1;
end;

procedure tline.draw;
begin
setcolor(acolor);
line(x,y,x+dx,y+dy)
end;

constructor tcircle.init;
begin
inherited init(ax,ay,acolor);
r := ar
end;

procedure Tcircle.Draw;
Begin
setcolor(acolor);
circle(x,y,r)
end;


Procedure trect.draw;
var
z :integer;
begin
setcolor(acolor);
for z := 1 to 3 do
rectangle((x+z)*2,y,(x+z)*2+dx,y+dy)
end;
end.