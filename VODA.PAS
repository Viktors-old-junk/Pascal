program musika;
uses crt;
var
a, b :integer;
begin
randomize;
a :=0;
b :=0;
repeat
sound(a);
delay(b);
a :=random(65535);
b :=random(3);
until keypressed;
nosound;
writeln(a);
readkey;
readkey;
end.