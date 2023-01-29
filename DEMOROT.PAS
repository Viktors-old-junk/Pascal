Program RotadeDemo;
uses graph,sgraph,crt;
const
radi =360/(2*pi);
type

coord = record
x,y,r,a :integer
end;

lines = record
point1,point2,color :byte;
end;

Disk = record
Npoint :byte;
Nlines :byte;
points :array[0..50] of coord;
plines :array[1..50] of lines;
end;

var
disk1 :disk;
n,n1,n3 :word;
k :byte;

Procedure draw;
var
dx,col :byte;
begin

for dx := 1 to disk1.nlines do
begin
col := getcolor;
setcolor(disk1.plines[dx].color);
moveto(disk1.points[disk1.plines[dx].point1].x+disk1.points[0].x,
	 disk1.points[disk1.plines[dx].point1].y+disk1.points[0].y);

lineto({disk1.points[disk1.plines[dx].point1].x+disk1.points[0].x,
	 disk1.points[disk1.plines[dx].point1].y+disk1.points[0].y,}
     disk1.points[disk1.plines[dx].point2].x+disk1.points[0].x,
     disk1.points[disk1.plines[dx].point2].y+disk1.points[0].y);
setcolor(col);
end;
end;

procedure rotade(al,k1,k2 :integer);
var
dx :byte;
i,j,k,r :integer;
d1,d2 :real;
begin

d1 := al+k1;
d2 := al+270+k2;

for dx := 1 to disk1.npoint do
begin
r := disk1.points[dx].r;
disk1.points[dx].x := round(sin((d1+disk1.points[dx].a)/radi)*r);
disk1.points[dx].y := round(sin((d2+disk1.points[dx].a)/radi)*r);
end;
draw;
end;


Procedure Setal;
begin

disk1.npoint := 8;
disk1.nlines := 10;

disk1.points[0].x := random(400);
disk1.points[0].x := random(400);

disk1.points[1].a := 0;
disk1.points[2].a := 45;
disk1.points[3].a := 90;
disk1.points[4].a := 135;
disk1.points[5].a := 180;
disk1.points[6].a := 225;
disk1.points[7].a := 270;
disk1.points[8].a := 315;;

disk1.points[1].r := 30;
disk1.points[2].r := 200;
disk1.points[3].r := 30;
disk1.points[4].r := 200;
disk1.points[5].r := 30;
disk1.points[6].r := 200;
disk1.points[7].r := 30;
disk1.points[8].r := 200;

disk1.plines[1].point1 := 1;
disk1.plines[1].point2 := 2;
disk1.plines[1].color := 20;

disk1.plines[2].point1 := 2;
disk1.plines[2].point2 := 3;
disk1.plines[2].color := 30;

disk1.plines[3].point1 := 3;
disk1.plines[3].point2 := 4;
disk1.plines[3].color := 40;

disk1.plines[4].point1 := 4;
disk1.plines[4].point2 := 5;
disk1.plines[4].color := 50;

disk1.plines[5].point1 := 5;
disk1.plines[5].point2 := 6;
disk1.plines[5].color := 60;

disk1.plines[6].point1 := 6;
disk1.plines[6].point2 := 7;
disk1.plines[6].color := 70;

disk1.plines[7].point1 := 7;
disk1.plines[7].point2 := 8;
disk1.plines[7].color := 80;

disk1.plines[8].point1 := 8;
disk1.plines[8].point2 := 1;
disk1.plines[8].color := 90;

disk1.plines[9].point1 := 1;
disk1.plines[9].point2 := 5;
disk1.plines[9].color := 100;

disk1.plines[10].point1 := 3;
disk1.plines[10].point2 := 7;
disk1.plines[10].color := 110;


end;

begin

setal;

initsgraph('800X600');
disk1.points[0].x := GETMAXx DIV 2;
disk1.points[0].y := GETMAXY DIV 2;
seTcolor(15);


setfillstyle(0,0);
for n := 0 to 3600 do
begin
setcolor(15);
rotade(N,40,0);

delay(200);

{setcolor(0);
rotade(N,0,0);}


cleardevice;

end;

CLOSEGRAPH;

end.






