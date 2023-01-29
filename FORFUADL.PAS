type Spis = ^Elem;
Elem=record
Inf:string;
Next:Spis
end;

var
Q,First:Spis;
{блок составления стека}

procedure Sost1(var P1:Spis);
 var
 P:Spis;
 begin
  P1:=nil;
{ввод значений}
  while not EOF do
   begin
    new(P);
    readln(P^.Inf);
    P^.Next:=P1;
    P1:=P;
   end
 end;

{блок составления очереди}

procedure Sost2(var P1:Spis);
 var
 P:Spis;
 begin
  new(P);
   readln(P^.Inf);
   P1:=P;
{ввод значений}
   while not EOF do
    begin
     new(P^.Next);
     P:=P^.Next;
     readln(P^.Inf);
    end;
  P^.Next:=nil;
 end;

{блок основной программы}
begin
 writeln ('После ввода последнего значения перед вводом наберите `alt`+2+6');
 Sost1(First);
 Q:=First;
 while Q<> nil do
  begin
   writeln (Q^.Inf);
   Q:=Q^.Next
  end
end.