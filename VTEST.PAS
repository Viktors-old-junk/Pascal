Uses graph, crt;
var
d, e, r, k, c1, c2, c3: integer;
l :char;
palette :palettetype;
label
a, b;
begin
c1 := 0;
c2 := 0;
c3 := 0;
WRITELN('Программа тестирования цветов монитора VTesT 1.0');
writeln('1, 2, 3, Q, W, E - Управление');
writeln('ESC - Выход');
readkey;
d := detect;
initgraph(d, r, '');
e := graphresult;
if e <> grOK then
writeln(grapherrormsg(e))
else begin
cleardevice;
end;
setfillstyle(1,5);
floodfill(2,2,2);
outtextxy(10,10,'Программа тестирования цветов монитора VTesT 1.0');
outtextxy(40,40,'1, 2, 3, Q, W, E - Управление');
outtextxy(70,70,'ESC - Выход');
setfillstyle(1,15);
bar(279,219,342,218);
bar(278,218,280,362);
setfillstyle(1,7);
bar(341,219,342,362);
bar(279,361,341,362);
setrgbpalette(4,0,0,0);
setfillstyle(1,3);
bar(280,220,340,360);
setfillstyle(1,4);
bar(260,170,280,190);
setfillstyle(1,2);
bar(300,170,320,190);
setfillstyle(1,1);
bar(340,170,360,190);
bar(503,230,503,240);
bar(508,230,508,234);
bar(508,236,508,241);
bar(513,230,513,230);
bar(513,235,513,241);
bar(500,230,500,230);
bar(504,230,504,230);
bar(509,230,509,230);
bar(509,241,509,241);
bar(501,230,501,240);
bar(506,230,506,241);
bar(511,230,511,235);
bar(511,241,511,241);
bar(502,241,502,241);
bar(507,235,507,235);
bar(512,230,512,230);
bar(512,235,512,235);
bar(512,241,512,241);

a:
sound(60000);
delay(1);
nosound;
l := readkey;
if (l = #49) and (c1 <> 63) then c1 := c1 + 1;
if (l = #50) and (c2 <> 63) then c2 := c2 + 1;
if (l = #51) and (c3 <> 63) then c3 := c3 + 1;
if (l = #81) and (c1 <> 0) then c1 := c1 - 1;
if (l = #87) and (c2 <> 0) then c2 := c2 - 1;
if (l = #69) and (c3 <> 0) then c3 := c3 - 1;
if (l = #113) and (c1 <> 0) then c1 := c1 - 1;
if (l = #119) and (c2 <> 0) then c2 := c2 - 1;
if (l = #101) and (c3 <> 0) then c3 := c3 - 1;
if (l = #27) then goto b;
setRgbpalette(3, c1, c2, c3);
setrgbpalette(2,0,c2,0);
setrgbpalette(1,0,0,c3);
setrgbpalette(4,c1,0,0);
goto a;
b:
Closegraph;
sound(500);
delay(40);
sound(200);
delay(80);
nosound;
end.
