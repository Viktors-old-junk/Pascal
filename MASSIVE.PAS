program massive;
uses crt;
var
	arr:array[1..20] of integer;
	a,b,min,max,nmax,nmin:integer;
begin
    clrscr;
    WriteLn('Искусственный интеллект для нахождения экстреммемы одномерного массива');
    WriteLn;
    Write('Введите число ячеек одномерного массива = ');
    ReadLn(a);
    for b:=1 to a do
    begin
    	Write('Введите значение ячки массива №',b,' = ');
		ReadLn(arr[b])
    end;
    nmax:=1;
    nmin:=1;
    max:=arr[1];
    min:=arr[1];
    for b:=1 to a do
    begin
    	if arr[b]>max then
        begin
        	max:=arr[b];
            nmax:=b
        end;
        if arr[b]<min then
        begin
        	min:=arr[b];
            nmin:=b;
        end;
    end;
    WriteLn;
    Write('Значения ячеек массива: ');
    for b:=1 to a-1 do
    	Write(arr[b],', ');
    WriteLn(arr[a]);
    WriteLn;
    WriteLn('Минимальное значение ячеек массива: ',min);
    WriteLn('Порядковый номер минимального значения: ',nmin);
    WriteLn('Максимальное значение ячеек массива: ',max);
    WriteLn('Порядковый номер максимального значения: ',nmax);
    Writeln('Разница между максимальным и минимальным значениями: ', nmax-nmin);
    ReadLn;
end.