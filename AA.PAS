Program aranal;
uses crt;
Type
tar =array[1..3] of byte;
tbl = array[0..254,0..1] of byte;
var
tf :file of tar;
tt :tar;
wordd :word;
x,y,z :longint;
ff :file of longint;
ttf :text;
begin
assign(tf,'Input');
reset(tf);
assign(ff,'Output');
rewrite(ff);
assign(ttf,'Outtxt');
rewrite(ttf);
y := 0;

writeln('!');

For x := 0 to 65536 do
begin
seek(ff,x);
write(ff,y);
end;

writeln('!');

y := 0;
For x := 0 to filesize(tf)-1 do
begin
seek(tf,x);
read(tf,tt);
Wordd := 256*(tt[1]-tt[2])+(tt[1]-tt[3]);
seek(ff,wordd);
read(ff,y);
y := y + 1;
write(ff,y);
end;

writeln('!');

For x := 0 to 65536 do
begin
seek(ff,x);
read(ff,y);
writeln(ttf,x:3,' - ',y:3);
end;


{clrscr;
wordd :=65535;
writeln(Hi(wordd));
writeln(Lo(wordd));

writeln(trunc(wordd / 256));
writeln(wordd - ((trunc(wordd / 256))*256));}

end.