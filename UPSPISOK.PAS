Program VSpisok; {Программа создания упорядоченного списка}
Uses crt;
type
  SPtr = ^Rec; {Создаем динамическую структуру данных}
  Rec = record {Ее основа - эта запись}
    Data :longint;
    Next :SPtr
  end;

Procedure add(var Sp:SPtr);
{Процедура добавления элемента в список}
{Процедура, также, упорядочивает список}
var
  Temp,Temp1 :SPtr; {Временные списки}
  Data :longint;
begin
  Writeln('Введите элемент');
  Readln(Data); {Вводим данные}
  Temp := SP;
  If SP = Nil then {Если список пуст, создаем новый элемент списка}
  begin
    New(SP);
    SP^.Next := nil;
    SP^.Data := Data;
  end
  else {иначе}
  begin {Добавляем елемент в список}
    while (Temp^.next <> nil) 
          {Пока список не закончиться}
      and (Data < Temp^.Next^.Data)
          {Или не найдеться место для нового элемента}
      and (data < sp^.data) do
          {Или место для нового элемента - первый член списка}
      Temp := temp^.next; {Спускаемся ниже по списку}
    if (data > sp^.data) then
       {Если нужно вставить новый элемент первым в списке}
    begin
      new(temp1);
      Temp1^.Data := data;
      Temp1^.next := SP; {Добовляем элемент в}
      SP := Temp1; {Начало списка}
    end
    else {иначе}
    begin
      new(temp1);
      Temp1^.Data := data;
      Temp1^.Next := Temp^.Next; {Всотвляем элемент в}
      Temp^.Next := Temp1; {тело списка}
    end;
  end;
end;

Procedure EDel(Var Sp:SPtr);
{Процедура наибольшего удаления элемента списка}
var
  Temp :SPtr;
begin
  If Sp <> nil then Sp := Sp^.Next;
  {Так как список упорядочен, то удаляться 
       будет именно наибольший его элемент}
end;

Procedure View(var Sp:SPtr);
{Просмотр списка}
var
  Temp :SPtr;
begin
  Temp := Sp; {Работаем с временной переменной}
  While Temp <> nil do
  begin {Пока список не кончился}
    Writeln(Temp^.Data); {Просматриваем данные в списке}
    Temp := Temp^.Next; {Спускаемся ниже по списку}
  end;
end;

var
  Spisok :SPtr; {Это список}
  Ch :char; {Это переменная для хранения выборанного пункта меню}
begin
  spisok := nil;
  CLRSCR;
  Repeat {Меню}
    Writeln('1 - Добавить элемент в список');
    Writeln('2 - Удалить элемент из списка');
    Writeln('3 - Просмотреть список');
    Writeln('4 - Выход');
    CH := Readkey; {Запись нажатой пользователем клавиши}
    CLRSCR;
    Case Ch Of {Выбор действия}
      '1': Add(spisok);
      '2': EDel(spisok);
      '3': View(spisok);
    end;
  until ch = '4'; {Конец меню}
end.