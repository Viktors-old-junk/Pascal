Program aaa;
uses crt;
var
f1: file of byte;
x1,x2,x3 :byte;
x,s,s1 :longint;
begin
Assign(f1,'tactgame.05');
reset(f1);
s := filesize(f1);
For x := 0 to s-1 do
begin
	If x < s then begin seek(f1,x); read(f1,x1); end else x1 := 0;
	If x+1 < s then begin seek(f1,x+1); read(f1,x2); end else x2 := 0;
{	If x+2 < s then begin seek(f1,x+2); read(f1,x3); end else x3 := 0;}
	IF ((x1=1) and (x2=2)) or ((x1=2) and (x2=1)) then
	Begin
	x1 := 1;
	If x+1 < s then begin seek(f1,x); write(f1,x1); seek(f1,x+1);
													write(f1,x1) end;
	end;
{Seek(f1,x);
read(f1,x1);
If x1 = 2 then begin x1 := 1; write(f1,x1); end;}
end;

sound(100);
delay(1000);
nosound;
end.
