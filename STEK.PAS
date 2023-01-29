Program stekx;
type
infptr = ^stekptr;
stekptr = record
	data :integer;
    next :infptr;
end;

var
stek :infptr;
x :integer;

procedure addptr(var l :infptr; data :integer);
var
tmpptr :infptr;
begin

if l = nil then
	begin
    	new(tmpptr);
		tmpptr^.data := data;
		tmpptr^.next := nil;
   		new(l);
        l := tmpptr;

		{l^.data := data;
		l^.next := nil;}
    end
	else
	begin
		while l^.next <> nil do l := l^.next;

		new(tmpptr);
		tmpptr^.data := data;
		tmpptr^.next := nil;
        l := tmpptr;
	end;
end;

procedure delptr(l :infptr);
var
tmpptr :infptr;
begin
tmpptr := l;
	if tmpptr <> nil then
		begin
        	repeat
        	    tmpptr := tmpptr^.next;
                            WRITELN('ZZZZZZZZ   -  ',tmpptr^.data);
            until tmpptr^.next <> nil;
{			while tmpptr^.next <> nil do
				tmpptr := tmpptr^.next;}
		tmpptr := nil;
    	end;
end;

function readptr(l :infptr):integer;
var
tmpptr :infptr;
begin
readptr := -1999;
tmpptr := l;
	if tmpptr <> nil then
		begin
			while tmpptr^.next <> nil do
				tmpptr := tmpptr^.next;

		readptr := tmpptr^.data;
	end;
end;

begin
stek := nil;
readln(x);
addptr(stek,x);
readln(x);
addptr(stek,x);
readln(x);
addptr(stek,x);
readln(x);
addptr(stek,x);

writeln;

WRITELN(STEK^.DATA);
STEK := STEK^.NEXT;
WRITELN(STEK^.DATA);
STEK := STEK^.NEXT;
WRITELN(STEK^.DATA);
STEK := STEK^.NEXT;
WRITELN(STEK^.DATA);
STEK := STEK^.NEXT;
WRITELN(STEK^.DATA);

{writeln(readptr(stek));
delptr(stek);
writeln(readptr(stek));
delptr(stek);
writeln(readptr(stek));
delptr(stek);
writeln(readptr(stek));}

writeln('-----');
readln;
end.
