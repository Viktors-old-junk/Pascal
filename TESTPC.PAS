Program aaa;
uses dos, crt;
var
p,q :real;
a,b,c,d :word;
begin
clrscr;
highvideo;
repeat
textcolor(2);
gotoxy(1,1);
write('? ? ? ? ? . . .');
gettime(a,b,c,d);
if (c = 0) then q := 1;
c := c + 0;
sound(c);
until q = 1;
nosound;
repeat
gotoxy(38,12);
textcolor(13);
textbackground(128);
writeln('????');
p := p + 0.000001;
gotoxy(32,13);
textcolor(4);
writeln(p);
gettime(a,b,c,d);
until c = 10;
gotoxy(10,14);
textcolor(14);
writeln('?ந?????⥫쭮??? ??襣? ??? ',p,' ???㣠??');
readkey;
end.



