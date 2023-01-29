
program rot2;
uses graph,sgraph,crt;
var
x1,y1,len,a,n:integer;
  grDriver: Integer;
  grMode: Integer;

procedure rotade(a1,s1,r,al,k1,k2 :integer);
var
i,j :integer;
radi :real;
begin
radi :=360/(2*pi);
i := round(sin((al+k2)/radi)*r);
j := round(sin((al+270+k1)/radi)*r);
line(a1,s1,a1+i,s1+j);

end;

begin
initsgraph('320X200');
  grDriver := 2;
  GRMODE := 3;
{  InitGraph(grDriver, grMode,'');}

x1 := 160;
y1 := 100;
len := 100;

for a := 0 to 360 do
begin

for n := 0 to 180 do
begin
selcolor(n);
rotade(x1,y1,len,n*2,a,0);

end;

selcolor(0);
if a <> 360 then
for n := 0 to 180 do
begin
rotade(x1,y1,len,n*2,a,0);
end;

end;

readln;
end.
