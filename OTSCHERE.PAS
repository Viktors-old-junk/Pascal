
type
    Spis = ^Elem;
    Elem=record
	Inf:string;
	Next:Spis
    end;
var
    Q,First:Spis;
    num,select:integer;
{???? ???⠢????? ???।?}

procedure Sost(var P1:Spis);
 var
 P:Spis;
 begin

 p := p1;

WHILE P^.Next <> nil do
begin
P := P^.Next;
end;

Readln(P^.inf);



{

	New(P);
	 P^.next:=nil;
	 readln(p^.inf);
	if p1<>nil then P^.next:=P1;
	 P1:=P}
 end;

procedure tipe(var first:spis);
begin
writeln ('?⥪:');
 Q:=first;
 while Q <> nil do
  begin
   writeln (Q^.Inf);
   Q:=Q^.Next
  end
end;
procedure delet(var p1:spis);
begin
if p1<>nil then
begin
q:=p1^.next;
dispose (p1);
p1:=q;
writeln ('??᫥???? ???祭?? 㤠????');
end;
if p1=nil then
begin
p1:=nil;
writeln ('?⥪ ????');
end;
end;
{???? ?᭮???? ?ணࠬ??}
begin
first:=nil;
first^.next := nil;
while (select<>4)  do
begin
writeln ('1-?????? ???祭?? ? ?⥪, 2-???ᬮ?? ?⥪?, 3-??????? ???祭?? ?? ?⥪, 4-??室');
readln (select);
if select=1 then Sost(First);
if select=2 then tipe(First);
if select=3 then delet(First);
end;
end.