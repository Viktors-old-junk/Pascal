
type
    Spis = ^Elem;
    Elem=record
	Inf:string;
	Next:Spis
    end;
var
    Q,First:Spis;
    num,select:integer;
{блок составления очереди}

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
writeln ('стек:');
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
writeln ('последние значение удалено');
end;
if p1=nil then
begin
p1:=nil;
writeln ('стек пуст');
end;
end;
{блок основной программы}
begin
first:=nil;
first^.next := nil;
while (select<>4)  do
begin
writeln ('1-ввести значение в стек, 2-просмотр стека, 3-стереть значение из стек, 4-выход');
readln (select);
if select=1 then Sost(First);
if select=2 then tipe(First);
if select=3 then delet(First);
end;
end.