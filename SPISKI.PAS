uses Crt;
Type Str13=String[13];
    EltPtr=^EltofList;
    EltofList = record
	Num  : Integer;
	Str:Str13;
	Next:EltPtr;
end;
var List:eltptr;{ссылка на начало списка}
    Tmp1,Tmp2:EltPtr;{временные ссылки}
    Flag:Byte;{номер действия изменений}


Procedure Print_List(L:EltPtr);{ссылка на начало списка}
var temp:integer;
begin {проверка пустоты списка}
    if(L=Nil) then WriteLn('список пуст');{ else}
{    begin}
{    if (L^.Next=l) then
    begin   {печать единственного элемента}
{	WriteLn(L^.num);
	WriteLn(L^.str);
    end
    else
    begin                      {печать элементов в цикле}
	tmp1:=l;
	Repeat {печать элемента Tmp1^}
	    WriteLn(tmp1^.num);
	    WriteLn(tmp1^.str);
	    Tmp1:=tmp1^.Next;
	until(Tmp1=l);
{    end;
{    end;}
end;

Procedure AddTo_List(var L:EltPtr);
var
Temp:EltPtr;
B:Boolean;
begin
    if (L=Nil) then {список пуст} begin {добавление элемента}
{	Temp := L;}
{	New(Temp);}
{	L^.Next:=L;}

	New(L);
	WriteLn('введите значение 1-го поля') ;
	ReadLn(L^.Num);
	WriteLn('введите значения 2-го поля');
	ReadLn(L^.Str);
	L^.next :=L;

{	New(Temp^.next);}


    end else
	begin  {проверяем возможность вставки}
    Temp := L;

    While Temp^.next <> l do
    Temp := Temp^.next;

    New(Tmp1);
{    Tmp1 := Tmp1^.Next;}
    WriteLn('введите значение 1-го поля') ;
    ReadLn(Tmp1^.Num);
    WriteLn('введите значение 2-го поля');
    ReadLn(Tmp1^.Str);
    Temp^.Next := tmp1;
    Tmp1^.Next := l;

{
	L^.Next:=L;
	{проверка списка}
{	New(L);
	WriteLn('введите значение 1-го поля') ;
	ReadLn(L^.Num);
	WriteLn('введите значение 2-го поля');
	ReadLn(L^.Str);
	B:=false;}
{	Repeat;
	tmp1:=l^.next;
	    if(Tmp1^.Next=Tmp1) then B:=true;
	    Tmp1:=Tmp1^.Next;
	until B or (Tmp1=L);
	if B then WriteLn('элемент добавить нельзя')
	else L:=tmp1;}
    end;
end;

begin
   ClrScr;
List:=Nil;{инициализация}
    {блок 1-печать меню в цикле }
{	WriteLn('Выберите нужный пункт');
	WriteLn('0-выход из программы');
	WriteLn('1-печать содержимого списка');
	WriteLn('2-добавление элемента');
	WriteLn('3-удаление элемента');}
	Repeat
    WriteLn('Выберите нужный пункт');
	WriteLn('0-выход из программы');
	WriteLn('1-печать содержимого списка');
	WriteLn('2-добавление элемента');
	WriteLn('3-удаление элемента');

	ReadLn(flag);
    clrscr;

	Case flag of
	    1 : Print_List(List);
	    2 : AddTo_List(List);
	end;{of Case};
    until(Flag=0);
end.











