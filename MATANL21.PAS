PROGRAM MATANALIZ2;
{$N+,E+}
USES CRT;
VAR
ANS :EXTENDED;
chis,znam :comp;
X,y,A :LONGINT;
BEGIN
CLRSCR;
A := 1;
ANS := 0;
znam := 0;
sound(600);
delaY(100);
NOSOUND;

FOR X := 1 TO 20000 DO
BEGIN
for y := 1 to a do
begin
if znam + a > 0 then znam := znam + a;
end;
if znam + a < 0 then break;
A := A+2;
END;
sound(600);
delaY(100);
NOSOUND;

A := 1;
chis := 0;
FOR X := 1 TO 20000 DO
BEGIN
if chis+(znam/(a*(a+2)*(a+4)*(a+6))) > 0 then chis := chis+(znam/(a*(a+2)*(a+4)*(a+6)));
if chis+(znam/(a*(a+2)*(a+4)*(a+6))) > 0 then break;
A := A+2;
END;
sound(600);
delaY(100);
NOSOUND;

ans := chis/znam;

writeln(ans:20:20,' ',chis:20:20,' ',znam:20:20);
readkey;
END.