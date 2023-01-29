program matanaliz;
uses crt;
var
a,b : integer;
ls,rs :EXTENDED;
x :longint;
begin
clrscr;
a := 16;
b := 1;
ls := sqrt(a);
rs := b;


for x := 0 to 10000 do
begin
ls := sqrt(a-(b*ls));
rs := b+(a/rs);
gotoxy(10,10);
write(x,' ');
gotoxy(10,12);
write(ls:20:30,' = ',(rs-B):20:30,' ');
END;
END.