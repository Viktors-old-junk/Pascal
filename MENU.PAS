uses
  Graph,Crt;
type
Stype = set of 1..4;

var
  grDriver : Integer;
  grMode   : Integer;
  ErrCode  : Integer;
  ch :char;
  m :byte;

Procedure menu(x :byte);
begin
Setcolor(15);
Outtextxy(310,210,'Menu 1');
Outtextxy(310,220,'Menu 2');
Outtextxy(310,230,'Menu 3');
Outtextxy(310,240,'Menu 4');

Setcolor(5);
Case x of
1 :Outtextxy(310,210,'Menu 1');
2 :Outtextxy(310,220,'Menu 2');
3 :Outtextxy(310,230,'Menu 3');
4 :Outtextxy(310,240,'Menu 4');
end;

end;

begin

  grDriver := Detect;
  InitGraph(grDriver,grMode,'');
  ErrCode := GraphResult;

m := 1;
SetBkColor(2);
setfillstyle(1,1);
bar(2,2,636,476);

setfillstyle(2,2);
bar(200,200,440,280);

Setcolor(10);
line(0,0,639,479);
Line(0,479,630,0);

Repeat
Menu(m);
ch := readkey;
if (m > 1) and (ch = #72) then M := m - 1 else
if (ch = #72) then m := 4;

if (M < 4) and (ch = #80) then M := m + 1 else
if (ch = #80) then m := 1;

If ch =#13 then
Case m of
1 :sound(100);
2 :sound(500);
3 :sound(1000);
4 :sound(1500);
end;

Delay(500);
nosound;

until ch = #27;

end.



