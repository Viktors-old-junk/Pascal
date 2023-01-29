Program Arhiv3;
uses crt;
type
Nstr =String[8];
NArr =array[1..8] of char;


function DecToBin(dec:byte):Nstr;
var
xz1,xz2,xz3 :byte;
strr1 :Nstr;
begin
xz1 := dec;
strr1 := '';
for xz3 := 1 to 7 do
begin
xz2 := xz1 mod 2;
xz1 := xz1 div 2;
if xz2 = 0 then strr1 := '0'+strr1;
if xz2 = 1 then strr1 := '1'+strr1;
end;
if xz1 = 0 then strr1 := '0'+strr1;
if xz1 = 1 then strr1 := '1'+strr1;
dectobin := strr1;
end;

Procedure Arhive;
var
Input :File of byte;
Temp :File of Narr;
Temp1 :File of char;
Temp2 :File of char;
Output :File of byte;
fseek1,fseek2,fseek3 :Longint;
fsize1,fsize2,x :Longint;
Data,col :byte;
DataStr :Nstr;
dataarray :Narr;
D1,D2,D3,D4,D5,D6,D7,D8,dd :char;
begin
Assign(Input,'Input');
Assign(Output,'Output');
Assign(Temp,'Temp');
Assign(Temp1,'Temp');
Assign(Temp2,'Temp2');
Reset(Input);
ReWrite(Output);
ReWrite(Temp);
Reset(Temp1);
Rewrite(Temp2);
Fsize1 := FileSize(Input);

Writeln('1');

For FSeek1 := 0 to FSize1-1 do
	begin
	seek(Input,FSeek1);
	Read(Input,data);
	DataStr := DecToBin(data);
	for x := 1 to 8 do
		dataarray[x] := datastr[x];
	write(Temp,dataarray);
	end;
Close(Input);
Close(Temp);


FSize2 := FileSize(Temp1);

FSeek1 := 0;
FSeek2 := 0;
col := 0;

Writeln(2);

repeat

If FSeek1 < FSize2 then Seek(Temp1,FSeek1);
Read(Temp1,D1);
{FSeek1 := FSeek1 + 1;}
Col := col+1;


If FSeek1+1 < FSize2 then
begin
Seek(Temp1,FSeek1+1);
Read(Temp1,D2);
If D2 = D1 then
	begin
{    FSeek1 := FSeek1 + 1;}
    Col := col + 1;
    end;
end;

If FSeek1+2 < FSize2 then
begin
Seek(Temp1,FSeek1+2);
Read(Temp1,D3);
If (D3 = D2) and (D3 = D1) then
	begin
{    FSeek1 := FSeek1 + 1;}
    Col := col + 1;
    end;
end;

If FSeek1+3 < FSize2 then
begin
Seek(Temp1,FSeek1+3);
Read(Temp1,D4);
If (D4 = D3) and (d4 = d2) and (d4 = d1) then
	begin
{    FSeek1 := FSeek1 + 1;}
    Col := col + 1;
    end;
end;

If FSeek1+4 < FSize2 then
begin
Seek(Temp1,FSeek1+4);
Read(Temp1,D5);
If (D5 = D4) and (D5 = D3) and (d5 = d2) and (d5 = d1) then
	begin
{    FSeek1 := FSeek1 + 1;}
    Col := col + 1;
    end;
end;

If FSeek1+5 < FSize2 then
begin
Seek(Temp1,FSeek1+5);
Read(Temp1,D6);
If (D6 = D5) and (D6 = D4) and (D6 = D3) and (d6 = d2) and (d6 = d1) then
	begin
{    FSeek1 := FSeek1 + 1;}
    Col := col + 1;
    end;
end;

If FSeek1+6 < FSize2 then
begin
Seek(Temp1,FSeek1+6);
Read(Temp1,D7);
If (D7 = D6) and (D7 = D5) and (D7 = D4) and (D7 = D3) and (d7 = d2) and (d7 = d1) then
	begin
{    FSeek1 := FSeek1 + 1;}
    Col := col + 1;
    end;
end;

If FSeek1+7 < FSize2 then
begin
Seek(Temp1,FSeek1+7);
Read(Temp1,D8);
If (D8 = D7) and (D8 = D6) and (D8 = D5) and (D8 = D4) and (D8 = D3) and (d8 = d2) and (d8 = d1) then
	begin
{    FSeek1 := FSeek1 + 1;}
    Col := col + 1;
    end;
end;

FSeek1 := FSeek1 + col;

Seek(Temp2,FSeek2);
Write(Temp2,D1);

Seek(Temp2,FSeek2+1);
If (Col = 1) or (col = 2) or (Col = 3) or (col = 4) Then dd := '0'else dd := '1';
write(Temp2,dd);

Seek(Temp2,FSeek2+2);
If (Col = 1) or (col = 2) or (Col = 5) or (col = 6) Then dd := '0'else dd := '1';
write(Temp2,dd);

Seek(Temp2,FSeek2+3);
If (Col = 1) or (col = 3) or (Col = 5) or (col = 7) Then dd := '0'else dd := '1';
write(Temp2,dd);

FSeek2 := FSeek2 + 4;

Col := 0;
D1 := ' ';
D2 := ' ';
D3 := ' ';
D4 := ' ';
D5 := ' ';
D6 := ' ';
D7 := ' ';
D8 := ' ';
DD := ' ';

Until FSeek1 >= FSize2;
Close(Temp1);
Close(Temp2);
end;

begin
clrscr;
Arhive;
End.