Uses graph, Crt;
var
d, r, e, n, k, color: integer;
palette : PaletteType;
begin
d := Detect;
initgraph(d, r, '');
e := GraphResult;
If e <> grOK then
writeln(GraphErrorMsg(e))
else
begin
setlinestyle(solidln, 0, thickwidth);
getpalette(palette);
for color := 0 to palette.size-1 do
begin
setcolor(color);
line(getmaxx div 3,color*10,2*getmaxx div 3,color*10)
end;
while not keypressed do
for e := 0 to Palette.size-1 do
setpalette(e,Random(Palette.Size));
if readkey=#0 then d:= ord(readkey);
Closegraph
end
end.