Program ddd;
uses crt,graph;
const
f :array [1..12] of real =
(130.8, 138.6, 146.8, 155.6, 164.8, 174.6, 185.0, 196.0, 207.7, 220.0,
233.1, 246.9);
var
k,n :integer;
d, e, r :integer;
palette :palettetype;

procedure ss(l :real; temp :integer);
begin
sound(round(l));
delay(temp);
nosound;
end;


begin
d := detect;
initgraph(d, r, '');
e := graphresult;
if e <> grOK then
writeln(grapherrormsg(e))
else begin
cleardevice;
end;

ss(f[12],100);

ss(f[3],400);
ss(f[7],800);
ss(f[7],800);
ss(f[7],800);
ss(f[7],800);
ss(f[7],800);

ss(f[2],4000);
ss(f[7],800);
ss(f[7],800);
ss(f[7],800);
ss(f[7],800);
ss(f[7],800);

ss(f[1],4000);
ss(f[7],800);
ss(f[7],800);
ss(f[7],800);
ss(f[7],800);
ss(f[7],800);

ss(f[12],5000);
ss(f[11],5000);
ss(f[10],5000);
ss(f[9],5000);
ss(f[12],1000);
ss(f[12],1000);
ss(f[12],1000);
readkey;
end.