Program aaa;
type
string20 = string[20];
NamePtr = ^NameRec;

NameRec = record
	namestr :string;
	familystr :string20;
	numberbt :byte;
	Next :NamePtr
end;

var
Spisok,TmpPtr :NamePtr;
x,y,z :byte;

begin
spisok := nil;

for x:= 1 to 3 do
If (spisok = nil) then
	begin
	New(spisok);
	Spisok^.Next := nil;
	    tmpptr := spisok;
	Writeln;
	Write('Name: ');
	Readln(Spisok^.Namestr);
	Write('Family: ');
	Readln(Spisok^.Familystr);
	end
else
	begin
{	Tmpptr := spisok;}

{	While (TmpPtr^.Next <> Nil) do
	TmpPtr := TmpPtr^.Next;

	New(TmpPtr^.Next);
	TmpPtr^.Next := nil;
	spisok^.next := tmpptr;}
	    new(tmpptr^.next);
		tmpptr := tmpptr^.next;
        tmpptr^.next := nil;
	write('Name: ');
	Readln(TmpPtr^.Namestr);
	Write('Family: ');
	Readln(TmpPtr^.Familystr);
	{    new(tmpptr^.next);
	    tmpptr^.next := nil;
	    tmpptr := tmpptr^.next;}

{    spisok := tmpptr;}
end;

while spisok <> nil do
begin
writeln(Spisok^.Namestr);
writeln(Spisok^.Familystr);
spisok := spisok^.next;
end;



end.