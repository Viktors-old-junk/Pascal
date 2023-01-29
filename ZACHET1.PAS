program zachot_1;
uses crt;
const
	m = 5;
	n = 10;
type
	TCharArrayA = array[1..m] of char;
	TCharArrayB = array[1..n] of char;
var
	CharArrayA :TCharArrayA; {Массив А}
	CharArrayB :TCharArrayB; {Массив В}
	T, C :Char;              {Переменная для хранения промежуточных результатов}
    NB, i, j :Integer;   {Номер С в массивах А и В, переменные для счетчиков}
    B :Boolean;              {Логическая переменная для хранения статуса сортировки}
begin
	ClrScr;
	WriteLn('Введите значения ячеек массива А');
	For i:=1 to m do begin {Вводим массив А}
   	  Write('Введите значение ячейки №',i,' ');
   	  CharArrayA[i] := ReadKey;
   	  WriteLn(CharArrayA[i]);
		end;
	ClrScr;
	WriteLn('Введите значения ячеек массива B');
	For i:=1 to n do begin {Вводим массив В}
   	  Write('Введите значение ячейки №',i,' ');
	    CharArrayB[i] := ReadKey;
      WriteLn(CharArrayB[i]);
		end;
  ClrScr;
	Repeat {Цикл ввода значения С}
		Write('Введенные значения массива А:');
		For i:=1 to m do Write(CharArrayA[i]);
		WriteLn; {Выводим на экран массив А}
		Write('Введенные значения массива B:');
		For i:=1 to n do Write(CharArrayB[i]);
		WriteLn; {Выводим на экран массив В}
		Write('Введите искомый элемент С: ');
		c := ReadKey; {Вводим элемент С}
		WriteLn(c);
		NB := 0;
		For i:=1 to n do {Пытаемся найти С в массиве В}
			If CharArrayB[i] = c then begin
				NB := i;
				Break;
				end;
    {Если какой-то элемент не найден, то вывести сообщение}
		If NB = 0 then WriteLn('Элемент "С" = ',c,' - не найден в массиве B.');
	Until (not (NB = 0));
  {Цикл ввода С закончится только если С будет найдено в массивах А и В}
	WriteLn('Номер элемента "С" = ',c,', в массвe B - ',NB);
  {Выведем номара С в массивах А и В}
  B := False;
  While not B do begin {Сортируем массив А от номера найденного элемента С + 1
	до конца массива}
  	B := True;
    for i := Nb+1 to m-1 do
    	if CharArrayA[i] > CharArrayA[i+1] then begin
      	T := CharArrayA[i];
        CharArrayA[i] := CharArrayA[i+1];
        CharArrayA[i+1] := T;
        B := False;
        End;
    End;
  WriteLn;
  Write('Отсортированный после символа "',c,'" массив А: ');
	For i:=Nb+1 to m do Write(CharArrayA[i]); {Выведем результат на экран}
  Sound(2000);
  Delay(500); {Пропищим}
  NoSound;
  ReadKey; {Подождем нажатия на клавишу}
End.