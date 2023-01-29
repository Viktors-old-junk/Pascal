program Matrica;
uses Crt;

const
  MaxRow = 50;
  MaxCol = 50;
  Error = Red;                    { Цвет сообщений об ошибках }
  Success = Brown;                { Цвет справочных сообщений }
  Result = Blue;                  { Цвет сообщений при вводе чисел }
  Single = '┌┐└┘│─';              { Одинарная рамка }
  Double = '╔╗╚╝║═';              { Двойная рамка }

type
  TMatrix = Array [1..MaxCol, 1..MaxRow] of Real;

var
  I, J, N, M : Integer; { Переменные для размеров матрицы }
  Matrix : TMatrix;     { Переменная матрицы }
  Sum : Real;           { Переменная для суммы элементов строк }
  Ok : Boolean;         { Переменная для проверки условия суммы < 1 }
  Ch : Char;            { Переменная используется в меню }

{ ---- Сервисные функции и процедуры ---- }
procedure Border(X1, Y1, X2, Y2, F, B : Byte; T : String);
{ Процедура Border рисует на экране рамку }
var
  I : Integer;
begin
  TextColor(F);
  TextBackGround(B);
  GotoXY(X1, Y1);
  Write(T[1]);
  for I := 1 to (X2 - X1 - 1) do Write(T[6]);
  Writeln(T[2]);
  for I := 1 to (Y2 - Y1 - 1) do
   begin
     GotoXY(X1, Y1+I); Write(T[5]);
     GotoXY(X2, Y1+I); Write(T[5]);
   end;
  GotoXY(X1, Y2);
  Write(T[3]);
  for I := 1 to (X2 - X1 - 1) do Write(T[6]);
  Write(T[4]);
  NormVideo;
end;

procedure WriteMessage(Msg : String; T : Byte);
{ Процедура WriteMessage выводит сообщение внизу экрана }
var
  Ch : Char;
begin
  GotoXY(1,25);
  TextBackGround(T);
  ClrEol;
  Write(Msg + ' - Нажмите клавишу <Enter>');
  Ch := ReadKey;
  GotoXY(1,25);
  TextBackGround(Black);
  ClrEol;
end;

procedure Intro; { Заставка программы }
var
  Ch : Char;
begin
  ClrScr;
  Border(1, 1, 80, 24, White, Black, Double);
  GotoXY(21,2);
  Writeln('Северо-Западный Административный Округ');
  GotoXY(33,10);
  TextColor(LightCyan);
  Writeln('ВЫПУСКНАЯ РАБОТА');
  TextColor(White);
  GotoXY(20,11);
  Writeln('по программированию в среде Турбо Паскаль');
  GotoXY(15,12);
  Write('тема работы: ');
  TextColor(LightMagenta);
  Writeln('Определение количества строк матрицы');
  GotoXY(16,13);
  Writeln('с абсолютным значением суммы элементов меньше 1');
  TextColor(White);
  GotoXY(47,15);
  Write('Выполнил: ');
  TextColor(Yellow);
  Writeln('Букин М.');
  TextColor(White);
  GotoXY(33,22);
  Writeln('Москва - 1999 год');
  WriteMessage('Добро пожаловать', Success)
end;

{ ---- Основные функции и процедуры программы ---- }
procedure MainMenu; { ---- Меню ---- }
begin
  ClrScr;
  Border(1, 1, 80, 24, White, Black, Double);
  TextColor(White);
  GotoXY(34,5);
  Writeln('Главное меню');
  GotoXY(19,7);
  Writeln('1 - Заполнение матрицы с клавиатуры');
  GotoXY(19,8);
  Writeln('2 - Подсчет сумм элементов строк матрицы');
  GotoXY(19,9);
  Writeln('3 - Выход');
end;

procedure InputData;     { Процедура заполнения матрицы с клавиатуры }
var
  K : Byte;

begin
  ClrScr;
  Border(1, 1, 80, 24, White, Black, Double);
  Window(2, 2, 79, 23);
  TextColor(LightCyan);
  GoToXY(32, 1);
  Writeln('ЗАПОЛНЕНИЕ МАТРИЦЫ');
  TextColor(White);
  repeat             { Определение размеров матрицы с контролем ввода }
  Ok := True;
  GoToXY(5, 4);
  ClrEol;
  TextColor(LightGray);
  Write('(количество строк - положительное число)');
  GoToXY(5, 3);
  ClrEol;
  TextColor(White);
  Write('Введите количество строк (не больше', MaxRow:3, ') : ');
{$I-}
  Readln(N);
{$I+}
  if IOResult = 106 then
  begin
    Window(1, 1, 80, 25);
    WriteMessage('Количество строк - числовое значение', Error);
    Window(2, 2, 79, 23);
    Ok := False
  end;
  if N <= 0 then
  begin
    Window(1, 1, 80, 25);
    WriteMessage('Количество строк должно быть больше нуля', Error);
    Window(2, 2, 79, 23);
    Ok := False
  end
  until Ok;
  repeat
  GoToXY(5, 7);
  ClrEol;
  TextColor(LightGray);
  Write('(количество столбцов - положительное число)');
  GoToXY(5, 6);
  ClrEol;
  TextColor(White);
  Write('Введите количество столбцов (не больше', MaxCol:3, ') : ');
{$I-}
  Readln(M);
{$I+}
  if IOResult = 106 then
  begin
    Window(1, 1, 80, 25);
    WriteMessage('Количество столбцов - числовое значение', Error);
    Window(2, 2, 79, 23);
    Ok := False
  end;
  if M <= 0 then
  begin
    Window(1, 1, 80, 25);
    WriteMessage('Количество столбцов должно быть больше нуля', Error);
    Window(2, 2, 79, 23);
    Ok := False
  end
  until Ok;
  ClrScr;		{ Заполнение матрицы с контролем ввода }
  TextColor(LightCyan);
  GoToXY(26, 1);
  Writeln('ЗАПОЛНЕНИЕ МАТРИЦЫ (', N:2, ',', M:2, ')');
  TextColor(White);
  Window(5, 4, 77, 22);
  K := 1;
  for I := 1 to N do
  begin
   for J := 1 to M do
    repeat
    Ok := True;
    if K = 20 then begin K := 1; ClrScr end;
    GoToXY(1, K);
    ClrEol;
    TextColor(White);
    Write('Введите значение элемента матрицы [', I:2, ',', J:2, '] : ');
{$I-}
    Readln(Matrix[I, J]);
{$I+}
    if IOResult = 106 then
     begin
       Window(1, 1, 80, 25);
       WriteMessage('Элемент матрицы - числовое значение', Error);
       Window(5, 4, 77, 22);
       Ok := False
     end;
     Inc(K);
    until Ok;
  end;
  Window(1, 1, 80, 25);
  WriteMessage('Матрица заполнена', Result);
end;

procedure CountRows;     { Процедура подсчета суммы строк матрицы }
var
  Count, K : Integer;
  S : String;

begin
  ClrScr;
  Border(1, 1, 80, 24, White, Black, Double);
  Window(5, 3, 79, 23);
  GoToXY(24, 1);
  Writeln('РЕЗУЛЬТАТЫ ПОДСЧЕТА');
  Write('┌───┬');
  for J := 1 to M do Write('──────┬');
  Writeln('────────┐');
  Write('│I\J│');
  for J := 1 to M do Write(J:4, '  │');
  Writeln('  Сумма │');
  Count := 0;
  for I := 1 to N do
   begin
     Write('├───┼');
     for J := 1 to M do Write('──────┼');
     Writeln('────────┤');
     Write('│', I:3, '│');
     Sum := 0;
     for J := 1 to M do
      begin
        Sum := Sum + Matrix[I, J];
        if Matrix[I, J] >= 0 then Write(' ', Matrix[I, J]:5:2, '│')
        else Write(Matrix[I, J]:6:2, '│')
      end;
      if Abs(Sum) < 1 then
       begin
         Inc(Count);
         TextColor(Yellow);
         Write(Abs(Sum):8:2);
         TextColor(White);
         Writeln('│');
       end
      else
         Writeln(Abs(Sum):8:2, '│')
   end;
  Write('└───┴');
  for J := 1 to M do Write('──────┴');
  Writeln('────────┘');
  Window(1, 1, 80, 25);
  if Count = 0 then WriteMessage('Искомых строк в матрице нет', Result)
  else
   begin
     Str(Count, S);
     WriteMessage('Искомых строк в матрице - ' + S, Result)
   end
end;

begin
  Intro;
  repeat
   MainMenu;
   GotoXY(28,12);
   Write('Выберите режим (1-3) : ');
   Ch := ReadKey;
   case Ch of
    '1': InputData;
    '2': CountRows;
   end
  until (Ch in ['1'..'3']) and (Ch = '3');
  WriteMessage('Всего доброго !!!', Success);
  ClrScr
end.
