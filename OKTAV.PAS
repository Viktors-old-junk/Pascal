Program ddd;
uses crt;
const
f :array [1..12] of real =
(130.8, 138.6, 146.8, 155.6, 164.8, 174.6, 185.0, 196.0, 207.7, 220.0,
233.1, 246.9);
temp = 4;
var
k,n :integer;
begin
for k := 0 to 3 do
for n := 1 to 12 do
begin
sound(round(f[n]*(1 shl k )));
delay(temp);
nosound;
end;
for k := 3 downto 0 do
for n := 12 downto 1 do
begin
sound(round(f[n]*(1 shl k )));
delay(temp);
nosound;
end;
end.