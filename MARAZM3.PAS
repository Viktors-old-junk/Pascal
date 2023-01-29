  Program Sveta_9;
    var i:integer;
    Function Polindrom(a:integer):boolean; {а само число}
    type TMas=array[1..4] of LongInt;
    var Mas:TMas;
          b, {Хранит число полученных элементов}
					l,k:byte;
          step :integer;
    begin
    b:=0;
    for l:=4 downto 1 do
    begin
    step := 1;
    For k := 1 to l-1 do
    step := step*10;
    Mas[l]:= a div step;
    a := a mod step;
    end;
    b := 4;
    For l := 4 downto 1 do
    if mas[l] = 0 then dec(b) else break;
    if (b = 1) or ((mas[1] = mas[b]) and (mas[2] = mas[b-1])) then
    Polindrom := true else Polindrom := false;
    end;
	begin
  For i := 1 to 99 do
  if (Polindrom(i) = true) and (Polindrom(sqr(i)) = true) then
	Writeln('I = ',i,', I^2 = ',Sqr(i));
  readln;
	end.