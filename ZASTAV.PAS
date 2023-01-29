program zastava;
uses crt, graph;
var
d, dd, cvet, cvet1, cvet2, cvet3 :integer;
procedure colorss;
label
l1, l2;

begin
l1:
cvet1 := cvet1 + 1;
cvet2 := cvet2 + 1;
cvet3 := cvet3 + 1;
setrgbpalette(cvet, cvet1, cvet2, cvet3);
delay(5);
if cvet1 <> 63 then goto l1;

l2:
cvet1 := cvet1 - 1;
cvet2 := cvet2 - 1;
cvet3 := cvet3 - 1;
setrgbpalette(cvet, cvet1, cvet2, cvet3);
delay(5);
if cvet1 <> 0 then goto l2;
end;

begin
d := 9;
dd := 2;
initgraph(d, dd, '');
cvet := 5;
cvet1 := 0;
cvet2 := 0;
cvet3 := 0;
setrgbpalette(5, 1,1,1);
setcolor(5);
settextstyle(7,0,100);
settextjustify(1,1);
outtextxy(320,240,'VKS');
colorss;
delay(20);

setfillstyle(1,0);
bar(1,1,639,639);
setcolor(5);
outtextxy(320,240,'Present:');
colorss;
delay(20);

setfillstyle(1,0);
bar(1,1,639,639);
setcolor(5);
outtextxy(320,120,'Krestik');
outtextxy(320,210,'&');
outtextxy(320,310,'Nolik');
colorss;
end.