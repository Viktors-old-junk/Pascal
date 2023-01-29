Program KABAN;
Var
InString, OutString :String;
X1 :Byte;
begin
InString := 'Š€€ “€‹ ˆ ‹€“ €Š';
	For X1 := 1 to Length(InString) do
		If (ord(InString[x1]) = 32) then
			OutString := InString[x1]+OutString
		else
			If (ord(InString[x1]) < 144) then
				OutString := Chr(Ord(InString[x1])+32)+OutString
			else
				OutString := Chr(Ord(InString[x1])+80)+OutString;
OutString := '„‚… ˜ˆŠˆ ' + OutString;
WriteLn(InString);
WriteLn(OutString);
Readln;
end.