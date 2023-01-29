Program Matrix2001;
Uses Crt; {Подключаем модуль CRT}

Const
  {Минимальная и максимальная граница массива}
  MinOrder = 2;
  MaxOrder = 10;

Type
  Matrix = Array[1..MaxOrder,1..MaxOrder] of integer;

Var
  F, D :Matrix; {Глобальные переменные - матрицы F и D}
  K, N :Integer;{Глобальные переменные - порядки матриц F и D - K и N}

  Procedure OutIntro; {Процедура вывода на экран вступительного приветствия}
  Begin
    HighVideo;
    ClrScr;
    GotoXY(6,3);
    Write('Программа Matrix 2001');
    GotoXY(17,4);
    Write('Автор: Дроздова Евгения');
    GotoXY(6,8);
    Write('Программа решает следующую задачу:');
    GotoXY(6,10);
    Write('    Заданы  квадратная  матрица F,  порядка K  и  квадратная  матрица D');
    GotoXY(6,11);
		Write('порядка  N. Для  обеих  матриц  найти в каждой  строке максимальный  по');
    GotoXY(6,12);
		Write('модулю элемент и поменять его с элементом стоящим на главной диаганали.');
    GotoXY(6,13);
		Write('    Результат работы программы вывести на печать.                     ');
    GotoXY(6,20);
    Write('Нажмите на любую клавишу для продолжения...');
    ReadKey;
  End; {Intro}

  Procedure ReadMatrix(Var Matrr :Matrix; Var Order :Integer);
  {Процедура считывания матрицы}
  {Matrr - параметр-переменная. Это считываемая матрица}
  {Order - параметр-переменная. Это порядок считываемой матрицы}
  Var
    I,J :Integer; {Параметры цикла}
  Begin
    Repeat
    {Этот цикл сделан для проверки правильности ввода порядка матрицы}
      GotoXY(6,10);
      Write('Введите порядок матрицы от ',MinOrder,' до ',MaxOrder,' - ');
      ReadLn(Order);
      If (Order < MinOrder) or (Order > MaxOrder) Then
      Begin
        GotoXY(6,12);
        Write('Ошибка: ',Order,' - Недопустимое значение порядка матрицы');
        ReadKey;
      End;
    {Цикл выполняется до тех пор, пока порядок матрицы не окажется в допустимых границах}
    Until (Order >= MinOrder) and (Order <= MaxOrder);

    For J := 1 To Order Do
    For I := 1 To Order Do
    Begin
      {Это цикл ввода матрицы. Матрица вводится построчно.}
      ClrScr;
      GotoXY(6,10);
      Write('Матрица имеет порядок ',Order,'x',Order);
      GotoXY(6,11);
      Write('Вы ввели ',(J-1)*Order+(I-1),' элементов матрицы. Осталось ввести ',
						Sqr(Order)-((J-1)*Order+(I-1)),' элементов.');
      GotoXY(6,12);
      Write('Введите элемент [',I,',',J,'] - ');
      ReadLn(Matrr[I,J]);
    End;
  End; {ReadMatrix}

  Procedure ProcessMatrix(Var Matrr :Matrix; Order :Integer);
  {Процедура обработки матрицы}
  {Matrr - параметр-переменная. Это рабочая матрица}
  {Order - порядок считываемой матрицы}
  Var
    I, J, {Параметры цикла}
		Max, {Хранит максимально по модулю найденное в строке значение}
		MaxNumber, {Хранит номер найденного в строке максимального значения}
		Temp :Integer; {Временная переменная для взаимозамены максимального}
    {элемента строки и элемента на главной диаганали}
  Begin
  {Это цикл поиска максимального элемента в каждой строке матрицы}
  {И взаимозамены этого максимального элемента с элементом на}
  {главной диаганали}
    For J := 1 To Order do
    Begin
      Max := ABS(Matrr[1,J]);
      MaxNumber := 1;
      For I := 1 To Order do
      Begin
        {Этот подцикл ищет максимальный элемент строки}
        If ABS(Matrr[I,J]) > Max Then
        Begin
          Max := ABS(Matrr[I,J]);
          MaxNumber := I;
        End;
      End;
      {Эти три строки кода меняю тестами максимальный элемент строки}
      {и элемент главной диаганали.}
      Temp := Matrr[J,J];
      Matrr[J,J] := Matrr[MaxNumber,J];
      Matrr[MaxNumber,J] := Temp;
    End;
  End; {ProcessMatrix}

  Procedure WriteMatrix(X, Y :Integer; Matrr :Matrix; Order: Integer);
  {Процедура выводаматрицы на экран в заданых координатах}
  {X и Y - координаты левого верхнего угла таблици матрицы}
  {Matrr - выводимая на экран матрица}
  {Order - порядок считываемой матрицы}
  Var
  I, J :Integer; {Параметры цикла}
  Begin
    For J := 1 To Order Do
    For I := 1 To Order Do
    Begin
      GotoXY(X+(I-1)*7,Y+J-1);
      Write(Matrr[I,J]:7);
    End;
  End; {WriteMatrix}

Begin
  OutIntro; {Вывод окна приветствия}
  ClrScr;
  GotoXY(6,8);
  Write('Работаем с матрицей F');
  ReadMatrix(F,K); {Считывание матриц}
  ClrScr;
  GotoXY(6,8);
  Write('Работаем с матрицей D');
  ReadMatrix(D,N);
  ClrScr;
  GotoXY(2,1);
  Write('Исходная матрица F:');
  WriteMatrix(2,2,F,K); {Вывод исходной матрицы}
  ProcessMatrix(F,K);   {Обработка матрицы}
  GotoXY(2,14);
  Write('Измененная матрица F:');
  WriteMatrix(2,15,F,K);{Вывод конечной матрицы}
  ReadKey;

  ClrScr;
  GotoXY(2,1);
  Write('Исходная матрица D:');
  WriteMatrix(2,2,D,N); {Вывод исходной матрицы}
  ProcessMatrix(D,N);   {Обработка матрицы}
  GotoXY(2,14);
  Write('Измененная матрица D:');
  WriteMatrix(2,15,D,N);{Вывод конечной матрицы}
  ReadKey;
End. {Matrix2001}