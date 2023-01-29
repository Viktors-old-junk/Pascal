PROGRAM MATANALIZ2;

USES CRT;
VAR
ANS :EXTENDED;
znam :extended;
chis,y :comp;
X,A :LONGINT;
BEGIN
CLRSCR;
A := 1;
ANS := 0;
znam := 0;
sound(600);
delaY(100);
NOSOUND;

for x := 1 to 27553 do
begin
y := x;
chis := ((16*y*y*y*y)+(64*y*y*y)+(56*y*y)-(16*y)-15);
znam := 1/(chis);
if znam >= 0 then ans := ans + znam else break;
gotoxy(10,10);
write(x,' ',znam:2:25,' ',ans:2:25,' ');
end;

readkey;
END.