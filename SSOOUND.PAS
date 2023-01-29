program fff;
uses crt;
var
c :char;
cc,dd :integer;
begin
clrscr;
cc := 200;
dd := 20;
gotoxy(37,13);
writeln('F1  F2');
gotoxy(39,14);
writeln('UP');
gotoxy(35,15);
writeln('LEFT  RIGHT');
gotoxy(38,16);
writeln('DOWN');
sound(cc);
delay(dd);
repeat
c := readkey;
if (c = #72) and (dd < 25500) then cc := cc + 1;
if (c = #80) and (cc > 0) then cc := cc - 1;

if (c = #77) and (dd < 25500) then dd := dd + 1;
if (c = #75) and (dd > 0) then dd := dd - 1;

if c = #59 then
begin
repeat
cc := cc + 1;
sound(cc);
delay(dd);
gotoxy(37,17);
writeln(cc,' ',dd


























,'               ');
until (cc = 25500) or keypressed;
end;

if c = #60 then
begin
repeat
cc := cc - 1;
sound(cc);
delay(dd);
gotoxy(37,17);
writeln(cc,' ',dd,'               ');
until (cc = 0) or keypressed;
end;


sound(cc);
delay(dd);

gotoxy(37,17);
writeln(cc,' ',dd,'               ');

until c = #27;
nosound;
end.