program xo;
uses
crt, graph;
Procedure egadrv; external;
{$L egavga.obj}
var
a1, a2, a3, a4, a5, a6, a7, a8, a9, x, pc, pc2, d, m  :integer;
w :char;
label
vik1, v1, v2, v3, v4, v5, v6, v7, v8, v9, vv1, vv2, vv3, vv4, vv5, vv6, vv7, vv8, vv9, vih, ran, cyc,
fin, fin1, fin2, fin3, wh, cor ;

begin
if registerbgidriver (@EGADRV) < 0 then
begin
writeln ('ERROR DRV');
halt
end;


d := 3;
m := 0;
InitGraph(d, m, 'd:\tp\bgi');
a1 :=0;
a2 :=0;
a3 :=0;
a4 :=0;
a5 :=0;
a6 :=0;
a7 :=0;
a8 :=0;
a9 :=0;
Setbkcolor(1);
setcolor(4);
cleardevice;
outtextxy(1,1,'  ???????????Ŀ');
outtextxy(1,9,'1 ?   ?   ?   ? VKS Present:');
outtextxy(1,17,'  ???????????Ĵ    "The ????⨪ and ?????"');
outtextxy(1,25,'2 ?   ?   ?   ?          Version 1.05');
outtextxy(1,33,'  ???????????Ĵ');
outtextxy(1,41,'3 ?   ?   ?   ?');
outtextxy(1,49,'  ?????????????            ??᪢? 1998');
outtextxy(1,57,'    1   2   3  ');
outtextxy(1,65,' ??? ??????? ?? - 1 ? - 0 ');
w := readkey;
if w = #48 then goto wh;
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

gotoxy(1, 9);
clreol;
gotoxy(1, 10);
clreol;
gotoxy(1, 11);
clreol;
gotoxy(1, 9);
readln(x);
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
outtextxy(34, 10,'X');
goto vik1;

v2:
a2 := 1;
outtextxy(66, 10,'X');
goto vik1;

v3:
a3 := 1;
outtextxy(98, 10,'X');
goto vik1;

v4:
a4 := 1;
outtextxy(34, 26,'X');
goto vik1;

v5:
a5 := 1;
outtextxy(66, 26,'X');
goto vik1;

v6:
a6 := 1;
outtextxy(98, 26,'X');
goto vik1;

v7:
a7 := 1;
outtextxy(34, 42,'X');
goto vik1;

v8:
a8 := 1;
outtextxy(66, 42,'X');
goto vik1;

v9:
a9 := 1;
outtextxy(98, 42,'X');

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
outtextxy(34, 10,'0');
goto vih;

vv2:
a2 := 10;
outtextxy(66, 10,'0');
goto vih;

vv3:
a3 := 10;
outtextxy(98, 10,'0');
goto vih;

vv4:
a4 := 10;
outtextxy(34, 26,'0');
goto vih;

vv5:
a5 := 10;
outtextxy(66, 26,'0');
goto vih;

vv6:
a6 := 10;
outtextxy(98, 26,'0');
goto vih;

vv7:
a7 := 10;
outtextxy(34, 42,'0');
goto vih;

vv8:
a8 := 10;
outtextxy(66, 42,'0');
goto vih;

vv9:
a9 := 10;
outtextxy(98, 42,'0');
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
gotoxy(1, 9);
clreol;
gotoxy(1, 10);
clreol;
gotoxy(1, 11);
clreol;
gotoxy(1, 9);
outtextxy(1,65,'? ???????!!! ??-??-??!!!');

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
clreol;
gotoxy(1, 10);
clreol;
gotoxy(1, 11);
clreol;
gotoxy(1, 9);
outtextxy(1,65,'?? ?먣ࠫ?... ?? ? ?? ??????!!!');
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
clreol;
gotoxy(1, 10);
clreol;
gotoxy(1, 11);
clreol;
gotoxy(1, 9);
outtextxy(1,65,'?????!? ????? ????...');
fin:
outtextxy(1,73,' This is LeftCopy Program!!! ');
readkey;
closegraph;
clrscr;
normvideo;
end.
