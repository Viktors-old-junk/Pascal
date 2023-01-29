program as;
uses crt;
const
m:array[1..7]of integer=(262,294,330,349,392,440,494);
t:array[1..7] of integer=(2000,2100,2200,2300,2400,2500,2600);
var i:integer;
begin
Repeat
begin
for i:=1 to 7 do
begin
Sound(m[i]*3);
Delay(t[i]);
NoSound;
end;
end;
until KeyPressed;
end.