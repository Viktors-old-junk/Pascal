program array1;
uses crt;
const
	a = 10;
type
	a1 = array[1..a] of integer;
var
  arr :a1;
  i, j, t :integer;
  d :boolean;
begin
  ClrScr;
  WriteLn('Введите элементы массива');
  For i := 1 to a do
  begin
  	Write('Введите элемент массива №',i,' ');
    ReadLn(arr[i]);
  end;
  For i := 1 to a do
  	Write(arr[i],' ');
  WriteLn;
  clrscr;

  repeat
	  WriteLn('Как вы хотите отсортировать массив?');
	  WriteLn('1 - По возростанию. 2 - По убыванию');
	  ReadLn(t);
	  If t = 1 then d := true;
	  If t = 2 then d := false;
    If (t <> 1) and (t <> 2) then WriteLn('ERROR!')
  until ((t = 1) or (t = 2));

  For i := 1 to a do
  For j := 1 to a-1 do
  	if ((arr[j] > arr[j+1]) and (d=true))
		or ((arr[j] < arr[j+1]) and (d=false)) then
    begin
    	t := arr[j];
      arr[j] := arr[j+1];
      arr[j+1] := t;
  	end;

  For i := 1 to a do
  	Write(arr[i],' ');
  WriteLn;
  t := arr[1];
  For i := 1 to a do
  	if arr[i] > t then t := arr[i];
  WriteLn('Максимальное значение массива: ',t);
  t := arr[1];
  For i := 1 to a do
  	if arr[i] < t then t := arr[i];
  WriteLn('Минимальное значение массива: ',t);
  WriteLn;
  ReadKey;
end.