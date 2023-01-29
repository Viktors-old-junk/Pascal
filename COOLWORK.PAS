program xsss;
uses crt,graph;

type
  TAction = (SInc,SDec,SZero,S2Dec,None);

  TActEl = object
   priority:array[0..4] of byte;
   used:TAction;
   constructor create;
   function WhattoDo:TAction;
   procedure AllOK;
   procedure AllBAD;
  end;

  TState = record
   x,v:integer;
  end;

const
  actfull:array[0..4] of TAction = (SInc,SDec,SZero,S2Dec,None);

function Acttoint(a:TAction):integer;
begin
case a of
SInc: Acttoint:=0;
SDec: Acttoint:=1;
SZero: Acttoint:=2;
S2Dec: Acttoint:=3;
None: Acttoint:=4;
end;
end;

function geta(a:integer):integer;
begin
if a<0 then geta:=0;
if a=0 then geta:=1;
if a>0 then geta:=2;
end;

function sita(a:integer):string;
begin
if a=0 then sita:='<Инкремент скорости>';
if a=1 then sita:='<Декремент скорости>';
if a=2 then sita:='<Без воздействия>';
if a=3 then sita:='<Резкий тормоз>';
if a=4 then sita:='<Случайное>';
end;

function sitx(a:integer):string;
begin
if a=0 then sitx:='переезда';
if a=1 then sitx:='соответствия';
if a=2 then sitx:='недоезда';
end;

function sitv(a:integer):string;
begin
if a=0 then sitv:='движении вперед';
if a=1 then sitv:='остановке';
if a=2 then sitv:='движении назад';
end;

var
  grDriver : Integer;
  grMode   : Integer;
  ErrCode  : Integer;
  i,j,k,ctime,maxp,olderror:integer;
  ai:array[0..2,0..2] of TActEl;
  x,y,e:TState;
  ai_exp: file of byte;
  p,www:byte;
label bbb;

{TActEl}

constructor TACtel.Create;
var i:integer;
begin
for i:=0 to 4 do priority[i]:=2;
Used:=None;
end;
{Мыслительный процесс}
function TActEl.Whattodo:TAction;
var
x,a,i:integer;
begin
if used<>None then
begin
whattodo:=used;
exit;
end;
a:=-1;
x:=random(10);
for i:=0 to 4 do
if a=-1 then
begin
if (x<priority[i]) then a:=i
 else x:=x-priority[i];
end;
if (a=4) then a:=random(4);
used:=actfull[a];
Whattodo:=actfull[a];
end;
{Пряник}
procedure TActel.AllOK;
begin
if used<>none then
begin
priority[acttoint(Used)]:=priority[acttoint(Used)]+priority[acttoint(None)];
priority[acttoint(None)]:=0;
used:=None;
end;
end;
{Кнут}
procedure TActel.AllBAD;
begin
if used<>none then
begin
if priority[acttoint(Used)]>0 then
 begin
  priority[acttoint(Used)]:=priority[acttoint(Used)]-1;
  priority[acttoint(None)]:=priority[acttoint(None)]+1;
 end;
used:=none;
end;
end;

procedure saveAI;
begin
 for i:=0 to 2 do
  for j:=0 to 2 do
    for k:=0 to 4 do
      write(ai_exp,ai[i,j].priority[k]);
end;

procedure loadAI;
begin
 for i:=0 to 2 do
  for j:=0 to 2 do
   for k:=0 to 4 do
    if not Eof(ai_exp) then
     read(ai_exp,ai[i,j].priority[k]);
end;

begin

  grDriver := Detect;
  InitGraph(grDriver,grMode,'');
  ErrCode := GraphResult;
  if ErrCode <> grOk then
    WriteLn('Graphics error:', GraphErrorMsg(ErrCode));

Randomize;

for i:=0 to 2 do
 for j:=0 to 2 do ai[i,j].Create;

Assign(ai_exp,'exp.ai');
Rewrite(ai_exp);

loadai;

p:=0;

bbb:
x.x:=0;
x.v:=0;
y.x:=0;
y.v:=0;
olderror:=0;

for ctime:=0 to 400 do
begin

if ctime>=0 then x.x:=round(sin(ctime/56)*10);

 case ai[geta(x.x-y.x),geta(x.v-y.v)].whattodo of
  SInc:  y.v:=y.v+1;
  SDec:  y.v:=y.v-1;
  S2Dec: y.v:=y.v-2;
 end;

{With Y do x := x+v;}

putpixel(ctime,200-x.x,YELLOW);
putpixel(ctime,200-y.x,WHITE);
if ctime mod 5=0 then
for i:=0 to 2 do
for j:=0 to 2 do
 if (abs(x.x-y.x)<olderror) or (x.x=y.x)
 then
  ai[i,j].AllOK
 else
  ai[i,j].AllBAD;
olderror:=abs(x.x-y.x);

end;

p:=p+1;
if p<200 then goto bbb;

readln;
CloseGraph;
clrscr;

 for i:=0 to 2 do
  for j:=0 to 2 do
   begin
    maxp:=0;
    for k:=1 to 4 do
      if (ai[i,j].priority[k]>ai[i,j].priority[maxp]) then maxp:=k;
    WriteLn('В случае ',sitx(i),' и ',sitv(j),' вер.действие: ',sita(maxp),'(',ai[i,j].priority[maxp],'0%)');
   end;

saveai;

readln;
Close(ai_exp);
end.