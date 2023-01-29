Program aaa;
Uses crt;
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
	Writeln;
	Write('Name: ');
	Readln(Spisok^.Namestr);
	Write('Family: ');
	Readln(Spisok^.Familystr);
	end
else
	begin
        new(tmpptr);
        Tmpptr^.next := spisok;
	write('Name: ');
	Readln(Tmpptr^.Namestr);
	Write('Family: ');
	Readln(Tmpptr^.Familystr);
        Spisok := Tmpptr;
	end;

while spisok <> nil do
begin
writeln(Spisok^.Namestr);
writeln(Spisok^.Familystr);
spisok := spisok^.next;
end;
end.