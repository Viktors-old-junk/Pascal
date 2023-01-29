Program sss;
Uses Graph,SGraph,Crt;
var
x,y :integer;
z :real;
begin
InitSGraph('800x600');
setcolor(5);
line(0,300,800,300);
line(400,0,400,600);
For x := -500 to 500 do
begin
z := x/5;
{if  then}
{y := round(-(z/(z-1))*5);}
{y := round((2*z/(1-z*z))*5);}
y :=round((sin(z)*sin(z)+sin(z))*5);
PutPixel(x*5+400,y*10+300,15);
end;

readln;
end.