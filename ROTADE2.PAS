PROGRAM ROT;
USES GRAPH,SGRAPH;
type
coor = array[1..5] of integer;
var
x1,y1,x2,y2,alpha,q :integer;
coor1 :coor;

procedure rotade(xcoor : coor);
var
x,y :integer;
begin
x := round((xcoor[3]*cos(xcoor[5]/(360/(2*pi)))) - (xcoor[4]*sin(xcoor[5]/(360/(2*pi)))) + xcoor[1]);
y := round((xcoor[3]*sin(xcoor[5]/(360/(2*pi)))) + (xcoor[4]*cos(xcoor[5]/(360/(2*pi)))) + xcoor[2]);
line(xcoor[1],xcoor[2],x,y);
end;

begin
initsgraph('800x600');
selcolor(15);
line(x1,y1,x2,y2);
coor1[1] := x1;
coor1[2] := y1;
coor1[3] := x2;
coor1[4] := x2;
coor1[5] := 90;;
for q := 0 to 360 do
begin
coor1[3] := q;
setcolor(15);
rotade(coor1);
end;
readln;
end.