program lab1;
var
x :integer;
y :real;
begin
x := 10;
y := 0;
for x:= -10 to 10 do
begin

if x-1 <> 0 then
begin
y := (1-sqr(x))/(x-1);
writeln('X := ',x,' Y = ',y);
end
else
writeln('X := ',x,' Y = Не существует');;
end;

readln;
end.