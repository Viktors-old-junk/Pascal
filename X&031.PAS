program xo;
uses crt, graph;
var
ask, a1, a2, a3, a4, a5, a6, a7, a8, a9, x, pc, pc2, d, dd, s1, s2, s3, rand, win1, win2 :integer;
i1, i2, i3 :pointer;
label
vik1, v1, v2, v3, v4, v5, v6, v7, v8, v9, vv1, vv2, vv3, vv4, vv5, vv6, vv7, vv8, vv9, vih, ran, cyc,
fin, start, fin1, fin2, fin3, wh, cor, cc;

Procedure doska;
begin
setfillstyle(1,0);
bar(0,0,639,479);
outtextxy(10,10,'ΰ¥αβ¨ª¨-®«¨ª¨ 3.1');
outtextxy(20,30,'‘‚€ 1998');
setfillstyle(1,5);
bar(100,200,400,200);
bar(100,300,400,300);
bar(200,100,200,400);
bar(300,100,300,400);
setcolor(2);
circle(500,300,48);
setcolor(1);
line(452,52,548,148);
line(548,52,452,148);
setcolor(3);

s1 := imagesize(451,51,549,149);
getmem(i1, s1);
getimage(452,52,548,148, i1^);

s2 := imagesize(451,251,549,349);
getmem(i2, s2);
getimage(452,252,548,348, i2^);
end;

Procedure ask1;
var
askv :char;
label
da, net, eto, coloriss;
begin
setcolor(3);
line(400,450,400,400);
line(400,400,450,400);
line(401,449,401,401);
line(401,401,449,401);
line(402,448,402,402);
line(402,402,448,402);
line(403,447,403,403);
line(403,403,447,403);
setcolor(7);
line(450,400,450,450);
line(450,450,400,450);
line(449,401,449,449);
line(449,449,401,449);
line(448,402,448,448);
line(448,448,402,448);
line(447,403,447,447);
line(447,447,403,447);
setcolor(3);
line(500,450,500,400);
line(500,400,550,400);
line(501,449,501,401);
line(501,401,549,401);
line(502,448,502,402);
line(502,402,548,402);
line(503,447,503,403);
line(503,403,547,403);
setcolor(7);
line(550,400,550,450);
line(550,450,500,450);
line(549,401,549,449);
line(549,449,501,449);
line(548,402,548,448);
line(548,448,502,448);
line(547,403,547,447);
line(547,447,503,447);
setcolor(3);
outtextxy(417,420,'„€');
outtextxy(515,420,'…’');

da:
setcolor(0);
rectangle(498,398,552,452);
repeat
setcolor(13);
rectangle(398,398,452,452);
setcolor(2);
rectangle(398,398,452,452);
setcolor(5);
rectangle(398,398,452,452);

ask :=10;
rand := random(10000);
until keypressed;
askv := readkey;
if askv=#68 then goto coloriss;
if askv=#75 then goto da;
if askv=#77 then goto net;
if askv=#32 then goto eto;
goto da;

net:
setcolor(0);
rectangle(398,398,452,452);
repeat
setcolor(13);
rectangle(498,398,552,452);
setcolor(2);
rectangle(498,398,552,452);
setcolor(5);
rectangle(498,398,552,452);

ask :=1;
rand := random(9);
until keypressed;
askv := readkey;
if askv=#68 then goto coloriss;
if askv=#75 then goto da;
if askv=#77 then goto net;
if askv=#32 then goto eto;
goto net;

coloriss:
ask := 3;
goto eto;

eto:
setfillstyle(1,0);
bar(350,360,640,479);
end;

procedure ask2;
var
askv2 :char;
label
k1, k2, k3, k4, k5, k6, k7, k8, k9, usee;
begin

k1:
repeat
setcolor(9);
rectangle(101,101,199,199);
x := 11;
until keypressed;
askv2 := readkey;
setcolor(0);
rectangle(101,101,199,199);
if askv2=#72 then goto k7;
if askv2=#75 then goto k3;
if askv2=#77 then goto k2;
if askv2=#80 then goto k4;
if askv2=#32 then goto usee;
goto k1;

k2:
repeat
setcolor(9);
rectangle(201,101,299,199);
x := 12;
until keypressed;
askv2 := readkey;
setcolor(0);
rectangle(201,101,299,199);
if askv2=#72 then goto k8;
if askv2=#75 then goto k1;
if askv2=#77 then goto k3;
if askv2=#80 then goto k5;
if askv2=#32 then goto usee;
goto k2;

k3:
repeat
setcolor(9);
rectangle(301,101,399,199);
x := 13;
until keypressed;
askv2 := readkey;
setcolor(0);
rectangle(301,101,399,199);
if askv2=#72 then goto k9;
if askv2=#75 then goto k2;
if askv2=#77 then goto k1;
if askv2=#80 then goto k6;
if askv2=#32 then goto usee;
goto k3;

k4:
repeat
setcolor(9);
rectangle(101,201,199,299);
x := 21;
until keypressed;
askv2 := readkey;
setcolor(0);
rectangle(101,201,199,299);
if askv2=#72 then goto k1;
if askv2=#75 then goto k6;
if askv2=#77 then goto k5;
if askv2=#80 then goto k7;
if askv2=#32 then goto usee;
goto k4;

k5:
repeat
setcolor(9);
rectangle(201,201,299,299);
x := 22;
until keypressed;
askv2 := readkey;
setcolor(0);
rectangle(201,201,299,299);
if askv2=#72 then goto k2;
if askv2=#75 then goto k4;
if askv2=#77 then goto k6;
if askv2=#80 then goto k8;
if askv2=#32 then goto usee;
goto k5;

k6:
repeat
setcolor(9);
rectangle(301,201,399,299);
x := 23;
until keypressed;
askv2 := readkey;
setcolor(0);
rectangle(301,201,399,299);
if askv2=#72 then goto k3;
if askv2=#75 then goto k5;
if askv2=#77 then goto k4;
if askv2=#80 then goto k9;
if askv2=#32 then goto usee;
goto k6;

k7:
repeat
setcolor(9);
rectangle(101,301,199,399);
x := 31;
until keypressed;
askv2 := readkey;
setcolor(0);
rectangle(101,301,199,399);
if askv2=#72 then goto k4;
if askv2=#75 then goto k9;
if askv2=#77 then goto k8;
if askv2=#80 then goto k1;
if askv2=#32 then goto usee;
goto k7;

k8:
repeat
setcolor(9);
rectangle(201,301,299,399);
x := 32;
until keypressed;
askv2 := readkey;
setcolor(0);
rectangle(201,301,299,399);
if askv2=#72 then goto k5;
if askv2=#75 then goto k7;
if askv2=#77 then goto k9;
if askv2=#80 then goto k2;
if askv2=#32 then goto usee;
goto k8;

k9:
repeat
setcolor(9);
rectangle(301,301,399,399);
x := 33;
until keypressed;
askv2 := readkey;
setcolor(0);
rectangle(301,301,399,399);
if askv2=#72 then goto k6;
if askv2=#75 then goto k8;
if askv2=#77 then goto k7;
if askv2=#80 then goto k3;
if askv2=#32 then goto usee;
goto k9;

usee:
end;


Procedure coloris;
var
d, e, r, k, c1, c2, c3, cl, l1, l2, l3: integer;
l :char;
palette :palettetype;
label
a, b;
begin
setfillstyle(1,0);
bar(0,0,639,479);
setcolor(14);
rectangle(50, 50, 300, 250);
rectangle(65, 65,285,210);
line(50,220,300,220);
line(50,225,300,225);
line(125,250,150,270);
line(225,250,200,270);
rectangle(150,270,200,275);
rectangle(100,275,250,280);
setcolor(5);
line(85,120,195,120);
line(85,160,195,160);
line(120,85,120,195);
line(160,85,160,195);
setcolor(1);
line(215,85,255,125);
line(255,85,215,125);
setcolor(2);
circle(235,155,20);
setcolor(7);
line(230,185,230,200);
line(230,200,215,200);
line(260,185,260,200);
line(260,200,245,200);
setcolor(3);
line(245,200,245,185);
line(245,185,260,185);
line(215,200,215,185);
line(215,185,230,185);

setfillstyle(1,5);
bar(50,350,97,400);

setfillstyle(1,1);
BAR(100,350,147,400);

setfillstyle(1,2);
BAR(150,350,197,400);

setfillstyle(1,7);
BAR(200,350,247,400);

setcolor(12);
rectangle(399,299,411,364);
rectangle(429,299,441,364);
rectangle(459,299,471,364);

setfillstyle(1,3);
BAR(250,350,297,400);
outtextxy(70,330,'F1    F2    F3    F4    F5');
outtextxy(350,260,'“€‚‹™… ‹€‚:');
outtextxy(401,285,'1');
outtextxy(431,285,'2');
outtextxy(461,285,'3');
outtextxy(401,370,'Q');
outtextxy(431,370,'W');
outtextxy(461,370,'E');
outtextxy(350,385,'ESC - …–');
cl :=5;
c1 :=0;
c2 :=0;
c3 :=0;

a:
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
if (l = #59) then cl := 5;
if (l = #60) then cl := 1;
if (l = #61) then cl := 2;
if (l = #62) then cl := 7;
if (l = #63) then cl := 3;
if (l = #27) then goto b;
setRgbpalette(cl, c1, c2, c3);

setcolor(0);
line(400,l1,410,l1);
line(430,l2,440,l2);
line(460,l3,470,l3);

l1 := 363 - c1;
l2 := 363 - c2;
l3 := 363 - c3;

setcolor(12);
line(400,l1,410,l1);
line(430,l2,440,l2);
line(460,l3,470,l3);

goto a;

b:
doska;
outtextxy(420,375,'‚› €—€…’… ?');
outtextxy(387,470,'F10 - €‘’‰€ –‚…’‚');
ask1;
end;

begin
d := 9;
dd := 2;
initgraph(d, dd, '');
randomize;
start:
doska;
outtextxy(420,375,'‚› €—€…’… ?');
outtextxy(387,470,'F10 - €‘’‰€ –‚…’‚');
ask1;
a1 :=0;
a2 :=0;
a3 :=0;
a4 :=0;
a5 :=0;
a6 :=0;
a7 :=0;
a8 :=0;
a9 :=0;
cc:
if ask = 3 then coloris;
if ask = 3 then goto cc;
if ask = 1 then goto wh;
cyc:
if (a1 <> 0) and (a2 <> 0) and (a3 <> 0) and
(a4 <> 0) and (a5 <> 0) and (a6 <> 0) and (a7 <> 0) and (a8 <> 0) and (a9 <> 0) then goto fin3;
if a1 + a2 + a3 = 30 then goto fin1;
if a4 + a5 + a6 = 30 then goto fin1;
if a7 + a8 + a9 = 30 then goto fin1;
if a1 + a4 + a7 = 30 then goto fin1;
if a2 + a5 + a8 = 30 then goto fin1;
if a3 + a6 + a9 = 30 then goto fin1;
if a1 + a5 + a9 = 30 then goto fin1;
if a3 + a5 + a7 = 30 then goto fin1;

ask2;
if (x = 11) and (a1 <> 10) and (a1 <> 1) and (a1 = 0) then goto v1;
if (x = 12) and (a2 <> 10) and (a2 <> 1) and (a2 = 0) then goto v2;
if (x = 13) and (a3 <> 10) and (a3 <> 1) and (a3 = 0) then goto v3;
if (x = 21) and (a4 <> 10) and (a4 <> 1) and (a4 = 0) then goto v4;
if (x = 22) and (a5 <> 10) and (a5 <> 1) and (a5 = 0) then goto v5;
if (x = 23) and (a6 <> 10) and (a6 <> 1) and (a6 = 0) then goto v6;
if (x = 31) and (a7 <> 10) and (a7 <> 1) and (a7 = 0) then goto v7;
if (x = 32) and (a8 <> 10) and (a8 <> 1) and (a8 = 0) then goto v8;
if (x = 33) and (a9 <> 10) and (a9 <> 1) and (a9 = 0) then goto v9;
sound(20);
delay(10);
sound(30);
delay(10);
sound(40);
delay(10);
sound(50);
delay(10);
sound(60);
delay(10);
sound(70);
delay(10);
sound(80);
delay(10);
sound(90);
delay(10);
sound(1);
delay(10);
sound(10);
delay(10);
sound(20);
delay(10);
sound(30);
delay(10);
sound(40);
delay(10);
sound(50);
delay(10);
sound(60);
delay(10);
sound(70);
delay(10);
sound(20);
delay(10);
sound(30);
delay(10);
sound(40);
delay(10);
sound(50);
delay(10);
sound(60);
delay(10);
sound(70);
delay(10);
sound(80);
delay(10);
sound(90);
delay(10);
sound(1);
delay(10);
sound(10);
delay(10);
sound(20);
delay(10);
sound(30);
delay(10);
sound(40);
delay(10);
sound(50);
delay(10);
sound(60);
delay(10);
sound(70);
delay(10);
nosound;

goto cyc;

v1:
a1 := 1;
putimage(102,102,i1^,0);
goto vik1;

v2:
a2 := 1;
putimage(202,102,i1^,0);
goto vik1;

v3:
a3 := 1;
putimage(302,102,I1^,0);
goto vik1;

v4:
a4 := 1;
putimage(102,202,i1^,0);
goto vik1;

v5:
a5 := 1;
putimage(202,202,i1^,0);
goto vik1;

v6:
a6 := 1;
putimage(302,202,i1^,0);
goto vik1;

v7:
a7 := 1;
putimage(102,302,i1^,0);
goto vik1;

v8:
a8 := 1;
putimage(202,302,i1^,0);
goto vik1;

v9:
a9 := 1;
putimage(302,302,i1^,0);
vik1:
sound(220);
delay(10);
sound(230);
delay(10);
sound(240);
delay(10);
sound(250);
delay(10);
sound(260);
delay(10);
sound(270);
delay(10);
sound(280);
delay(10);
sound(290);
delay(10);
sound(300);
delay(10);
sound(310);
delay(10);
sound(320);
delay(10);
sound(330);
delay(10);
sound(340);
delay(10);
sound(350);
delay(10);
sound(360);
delay(10);
sound(370);
delay(10);
nosound;
wh:
if (a1 <> 0) and (a2 <> 0) and (a3 <> 0) and
(a4 <> 0) and (a5 <> 0) and (a6 <> 0) and (a7 <> 0) and (a8 <> 0) and (a9 <> 0) then goto fin3;
if a1 + a2 + a3 = 3 then goto fin2;
if a4 + a5 + a6 = 3 then goto fin2;
if a7 + a8 + a9 = 3 then goto fin2;
if a1 + a4 + a7 = 3 then goto fin2;
if a2 + a5 + a8 = 3 then goto fin2;
if a3 + a6 + a9 = 3 then goto fin2;
if a1 + a5 + a9 = 3 then goto fin2;
if a3 + a5 + a7 = 3 then goto fin2;

if (a1 = 10) and (a2 = 10) and (a3 = 0) then goto vv3;
if (a4 = 10) and (a5 = 10) and (a6 = 0) then goto vv6;
if (a7 = 10) and (a8 = 10) and (a9 = 0) then goto vv9;

if (a2 = 10) and (a3 = 10) and (a1 = 0) then goto vv1;
if (a5 = 10) and (a6 = 10) and (a4 = 0) then goto vv4;
if (a8 = 10) and (a9 = 10) and (a7 = 0) then goto vv7;

if (a1 = 10) and (a3 = 10) and (a2 = 0) then goto vv2;
if (a4 = 10) and (a6 = 10) and (a5 = 0) then goto vv5;
if (a7 = 10) and (a9 = 10) and (a8 = 0) then goto vv8;

if (a1 = 10) and (a4 = 10) and (a7 = 0) then goto vv7;
if (a2 = 10) and (a5 = 10) and (a8 = 0) then goto vv8;
if (a3 = 10) and (a6 = 10) and (a9 = 0) then goto vv9;

if (a4 = 10) and (a7 = 10) and (a1 = 0) then goto vv1;
if (a5 = 10) and (a8 = 10) and (a2 = 0) then goto vv2;
if (a6 = 10) and (a9 = 10) and (a3 = 0) then goto vv3;

if (a1 = 10) and (a7 = 10) and (a4 = 0) then goto vv4;
if (a2 = 10) and (a8 = 10) and (a5 = 0) then goto vv5;
if (a3 = 10) and (a9 = 10) and (a6 = 0) then goto vv6;

if (a1 = 10) and (a5 = 10) and (a9 = 0) then goto vv9;
if (a5 = 10) and (a9 = 10) and (a1 = 0) then goto vv1;
if (a1 = 10) and (a9 = 10) and (a5 = 0) then goto vv5;

if (a3 = 10) and (a5 = 10) and (a7 = 0) then goto vv7;
if (a7 = 10) and (a5 = 10) and (a3 = 0) then goto vv3;
if (a7 = 10) and (a3 = 10) and (a5 = 0) then goto vv5;


if (a1 = 1) and (a2 = 1) and (a3 = 0) then goto vv3;
if (a4 = 1) and (a5 = 1) and (a6 = 0) then goto vv6;
if (a7 = 1) and (a8 = 1) and (a9 = 0) then goto vv9;

if (a2 = 1) and (a3 = 1) and (a1 = 0) then goto vv1;
if (a5 = 1) and (a6 = 1) and (a4 = 0) then goto vv4;
if (a8 = 1) and (a9 = 1) and (a7 = 0) then goto vv7;

if (a1 = 1) and (a3 = 1) and (a2 = 0) then goto vv2;
if (a4 = 1) and (a6 = 1) and (a5 = 0) then goto vv5;
if (a7 = 1) and (a9 = 1) and (a8 = 0) then goto vv8;

if (a1 = 1) and (a4 = 1) and (a7 = 0) then goto vv7;
if (a2 = 1) and (a5 = 1) and (a8 = 0) then goto vv8;
if (a3 = 1) and (a6 = 1) and (a9 = 0) then goto vv9;

if (a4 = 1) and (a7 = 1) and (a1 = 0) then goto vv1;
if (a5 = 1) and (a8 = 1) and (a2 = 0) then goto vv2;
if (a6 = 1) and (a9 = 1) and (a3 = 0) then goto vv3;

if (a1 = 1) and (a7 = 1) and (a4 = 0) then goto vv4;
if (a2 = 1) and (a8 = 1) and (a5 = 0) then goto vv5;
if (a3 = 1) and (a9 = 1) and (a6 = 0) then goto vv6;

if (a1 = 1) and (a5 = 1) and (a9 = 0) then goto vv9;
if (a5 = 1) and (a9 = 1) and (a1 = 0) then goto vv1;
if (a1 = 1) and (a9 = 1) and (a5 = 0) then goto vv5;

if (a3 = 1) and (a5 = 1) and (a7 = 0) then goto vv7;
if (a7 = 1) and (a5 = 1) and (a3 = 0) then goto vv3;
if (a7 = 1) and (a3 = 1) and (a5 = 0) then goto vv5;

if a5 = 0 then goto vv5;

cor:
if (a1 = 0) or (a3 = 0) or (a7 = 0) or (a9 = 0) then pc2 := random(5);
if (pc2 = 1) and (a1 = 0) then goto vv1;
if (pc2 = 2) and (a3 = 0) then goto vv3;
if (pc2 = 3) and (a7 = 0) then goto vv7;
if (pc2 = 4) and (a9 = 0) then goto vv9;
if (a1 <> 0) or (a3 <> 0) or (a7 <> 0) or (a9 <> 0) then goto ran;
goto cor;

ran:
pc := random(10);
if (pc = 1) and (a1 = 0) then goto vv1;
if (pc = 2) and (a2 = 0) then goto vv2;
if (pc = 3) and (a3 = 0) then goto vv3;
if (pc = 4) and (a4 = 0) then goto vv4;
if (pc = 5) and (a5 = 0) then goto vv5;
if (pc = 6) and (a6 = 0) then goto vv6;
if (pc = 7) and (a7 = 0) then goto vv7;
if (pc = 8) and (a8 = 0) then goto vv8;
if (pc = 9) and (a9 = 0) then goto vv9;
goto ran;

vv1:
a1 := 10;
putimage(102,102,i2^,0);
goto vih;

vv2:
a2 := 10;
putimage(202,102,i2^,0);
goto vih;

vv3:
a3 := 10;
putimage(302,102,i2^,0);
goto vih;

vv4:
a4 := 10;
putimage(102,202,i2^,0);
goto vih;

vv5:
a5 := 10;
putimage(202,202,i2^,0);
goto vih;

vv6:
a6 := 10;
putimage(302,202,i2^,0);
goto vih;

vv7:
a7 := 10;
putimage(102,302,i2^,0);
goto vih;

vv8:
a8 := 10;
putimage(202,302,i2^,0);
goto vih;

vv9:
a9 := 10;
putimage(302,302,i2^,0);
goto vih;

vih:
sound(320);
delay(10);
sound(330);
delay(10);
sound(340);
delay(10);
sound(350);
delay(10);
sound(360);
delay(10);
sound(370);
delay(10);
sound(380);
delay(10);
sound(390);
delay(10);
sound(400);
delay(10);
sound(410);
delay(10);
sound(420);
delay(10);
sound(430);
delay(10);
sound(440);
delay(10);
sound(450);
delay(10);
sound(460);
delay(10);
sound(470);
delay(10);
nosound;

goto cyc;
fin1:
gotoxy(1, 9);
sound(100);
delay(70);
sound(190);
delay(70);
sound(180);
delay(70);
sound(170);
delay(70);
sound(160);
delay(70);
sound(150);
delay(70);
sound(160);
delay(70);
sound(170);
delay(70);
sound(180);
delay(70);
sound(190);
delay(70);
sound(200);
delay(70);
sound(210);
delay(70);
sound(220);
delay(70);
sound(230);
delay(70);
nosound;
writeln(' ‚›ƒ€‹!!! •€-• -ε !!!');
win2 := win2 + 1;
goto fin;

fin2:
sound(200);
delay(70);
sound(290);
delay(70);
sound(280);
delay(70);
sound(270);
delay(70);
sound(260);
delay(70);
sound(250);
delay(70);
sound(260);
delay(70);
sound(270);
delay(70);
sound(280);
delay(70);
sound(290);
delay(70);
sound(300);
delay(70);
sound(310);
delay(70);
sound(320);
delay(70);
sound(330);
delay(70);
nosound;

gotoxy(1, 9);
writeln('‚λ Άλ¨£ΰ «¨... ® ο ­¥ §¤ ξαμ!!!');
win1 := win1 + 1;
goto fin;

fin3:
sound(300);
delay(70);
sound(390);
delay(70);
sound(380);
delay(70);
sound(370);
delay(70);
sound(360);
delay(70);
sound(350);
delay(70);
sound(360);
delay(70);
sound(370);
delay(70);
sound(380);
delay(70);
sound(390);
delay(70);
sound(400);
delay(70);
sound(410);
delay(70);
sound(420);
delay(70);
sound(430);
delay(70);
nosound;
sound(200);
delay(70);
sound(290);
delay(70);
sound(280);
delay(70);
sound(270);
delay(70);
sound(260);
delay(70);
sound(250);
delay(70);
sound(260);
delay(70);
sound(270);
delay(70);
sound(280);
delay(70);
sound(290);
delay(70);
sound(300);
delay(70);
sound(310);
delay(70);
sound(320);
delay(70);
sound(330);
delay(70);
nosound;

gotoxy(1, 9);
writeln('—!? ®¦¥β ¥ι¥?...');
win1 := win1 + 1;
win2 := win2 + 1;
fin:
setcolor(3);
outtextxy(430,375,'†…’ …™… ?');
ask1;
if ask=10 then goto start;
cleardevice;
restorecrtmode;
end.
