Program kakugodno;
uses crt;
type
	 list =^zveno; {??뫪? ?? ???????}
	 zveno = record {⨯ ????????}
		elem: integer;
		Next:list; {??뫪? ?? ᫥???騩 ???????}
		Prev:list;
	 end;
var
Top :list;
temp :list;
Procedure addtolist(Var SP:List);
var
Temp,temp1,Temp2:list;
begin
	Temp := Sp;
	If Temp = nil then
        begin
        New(SP);
        WriteLn('??????? ???祭??');
        Readln(SP^.elem);
        Sp^.Next := sp;
        Sp^.Prev := sp;
        end
        else
        begin
        New(temp1);
        WriteLn('??????? ???祭??');
        Readln(Temp1^.elem);

        Writeln(Temp^.Elem);
        Writeln(Temp^.next^.Elem);
        Writeln(Temp^.prev^.Elem);

        While {(Temp^.elem >= Temp1^.elem) and} (Temp^.next = sp)  do
        Temp := Temp^.Next;

        temp2 := Temp^.next;

        If Temp^.elem = Temp1^.elem then
        begin
        writeln('????? ??????? 㦥 ????');
        exit;
        end;

        If Temp^.next = sp then
        begin
        Sp^.prev := Temp1;
        Temp1^.next := sp;
        Temp1^.prev := temp;
        Temp^.next := Temp1;
        exit;
        end;

{        If Temp^.elem > Temp1^.elem then
        begin}
        Temp1^.next := Temp^.next;
        Temp1^.prev := tEMP;
        Temp^.next := Temp1;
        Temp2^.prev := Temp1;
{        end;


        {Sp^.Next := sp;
        Sp^.Prev := sp;}

        end;
end;

begin
clrscr;
Top :=nil;
Addtolist(TOP);
Addtolist(TOP);
Addtolist(TOP);
Addtolist(TOP);

Temp := top;
writeln;

repeat
Writeln(Temp^.elem);
Temp := Temp^.next;
until temp = top;

end.

