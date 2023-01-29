Program FileProcessor;
Uses crt;
Const
  MaxInArray = 10; {Максимум значений в массиве}

Type {Типы массивов, необходимы для работы с файлами}
  TensArray = Array[1..MaxInArray,1..MaxInArray] of byte;
  TempArray = Array[1..MaxInArray] of Byte;

  function FileExists(FileName: String): Boolean;
  var {Функция проверки существования файл на диске}
    F: file;
  begin
    {$I-} {Отключаем ошибки ввода-вывода}
    Assign(F, FileName);
    Reset(F);
    Close(F);{Пробуем открыть файл}
    {$I+} {Включаем ошибки ввода-вывода}
    FileExists := (IOResult = 0) and (FileName <> ''); {Проверяем результат}
  end;

  Procedure OutMatrix(Arr :TensArray);
  Var {Процедура вывода матрицы на экран}
    i, j :Integer;
  Begin
    For i := 1 to 10 do
    Begin
      For j := 1 to 10 do
      Begin
        Write(Arr[j,i]:4);
      End;
      WriteLn;
    End;
  End;

  Procedure CreateFile;
  Var {Процедура создания нового файла}
    IntFile :File of TensArray;
    i, j :Integer;
    Arr :TensArray;
    FileName :String;
  Begin
    Clrscr;
    WriteLn('Создается матрица 10х10 с использованием генератора случайных чисел');
		For i := 1 to 10 do
		For j := 1 to 10 do
		Begin
      Arr[i,j] := Random(255);
		End;
    Write('Введите имя конечного файла - ');
    ReadLn(FileName);
    Assign(IntFile,FileName);
    ReWrite(IntFile);
    Write(IntFile,Arr);
    Close(IntFile);
    WriteLn;
    WriteLn('Получилась матрица:');
    OutMatrix(Arr);
    ReadKey;
  End;

  Procedure ViewFile;
  Var {Процедура просмотра файла}
    IntFile :File of TensArray;
    Arr :TensArray;
    FileName :String;
  Begin
    ClrScr;
    Write('Введите имя просматриваемого файла: ');
    ReadLn(FileName);
    If FileExists(FileName) then
    Begin
      Assign(IntFile,FileName);
      Reset(IntFile);
      Read(IntFile,Arr);
      WriteLn;
      WriteLn('В файле записана матрица:');
      OutMatrix(Arr);
      Close(IntFile);
    End Else WriteLn('Файл не найден!');
    ReadKey;
  End;

  Procedure ProcessFile;
  Var {Процедура изменения файла}
    IntFile :File of TensArray;
    Arr :TensArray;
    FileName :String;

    Procedure DownLine;
    Var {Процедура "опускания" строчки в матрице}
      i, j :Integer;
      Temp :TempArray;
    Begin
      For i := 1 to MaxInArray do
      Temp[i] := Arr[i,MaxInArray];

      For j := MaxInArray downto 2 do
      For i := 1 to MaxInArray do
      Arr[i,j] := Arr[i,j-1];

      For i := 1 to MaxInArray do
      Arr[i,1] := Temp[i]
    End;

    Procedure MoveColumn;
    Var {Процедура сдвига столбца в матрице}
      i, j :Integer;
      Temp :TempArray;
    Begin
      For i := 1 to MaxInArray do
      Temp[i] := Arr[MaxInArray,i];

      For j := MaxInArray downto 2 do
      For i := 1 to MaxInArray do
      Arr[j,i] := Arr[j-1,i];

      For i := 1 to MaxInArray do
      Arr[1,i] := Temp[i]
    End;

  Begin
    ClrScr;
    Write('Введите имя изменяемого файла: ');
    ReadLn(FileName);
    If FileExists(FileName) then
    Begin
      Assign(IntFile,FileName);
      Reset(IntFile);
      Read(IntFile,Arr);
      WriteLn;
      WriteLn('В файле была записана матрица:');
      OutMatrix(Arr);

      DownLine; {Сдвиг и перенос строк и столбцов}
      DownLine;
      MoveColumn;
      MoveColumn;
      MoveColumn;

      WriteLn;
      WriteLn('Теперь в файле записана матрица:');
      OutMatrix(Arr);
      Seek(IntFile,0);
      Write(IntFile,Arr);
      Close(IntFile);
    End Else WriteLn('Файл не найден!');
    ReadKey;
  End;

  Procedure Menu;
  Var {Процедура создания меню, и выбора действия}
    c :Char;
  Begin
    repeat
      clrscr;
      Window(25,10,80,25);
      WriteLn('Выберете действие:');
      WriteLn('Создать файл        -  "1"');
      WriteLn('Просмотреть файл    -  "2"');
      WriteLn('Изменить файл       -  "3"');
      WriteLn('Выход               - "ESC"');
      Window(1,1,80,25);
      c := readkey;
      Case c of
        '1' :CreateFile;
        '2' :ViewFile;
        '3' :ProcessFile;
      End;
    Until c = #27;
  End;
Begin
  Randomize; {Запуск генератора случайных чисел (модуль CRT)}
  Menu;
End.