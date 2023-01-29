Program CUDS;
uses crt;
type
SPtr = ^SpisokRec;
SpisokRec = record
	Data :longint;
	Next :SPtr;
    	Prev :SPtr
    end;
var
Spisok :SPtr;

Procedure AddToSpisok(VAR TSP :SPTR);
var
Temp,NewTemp,PrevEl,NextEl :SPTR;
X,y,z :Integer;
Dat :LongInt;
begin
Writeln('Введите значение:');
Readln(Dat);

TEMP := TSP;
IF Temp = NIL then
    begin
    New(Temp);
    Temp^.Data := Dat;
    Temp^.Next := Temp;
    Temp^.Prev := Temp;
    TSP := TEMP;
    end
    else
    begin

if not (TEMP^.data < dat) then
begin
        Repeat
        If Temp^.data = dat then EXIT;
        Temp := Temp^.next;
        Until (Temp = TSP) or (Temp^.data < dat);

    PrevEl := Temp^.prev;
    NextEl := Temp;

    New(NewTemp);
    NewTemp^.data := dat;
    NewTemp^.Next := NextEl;
    NewTemp^.Prev := PrevEl;
    PrevEl^.Next := NewTemp;
    NextEl^.Prev := NewTemp;
end
else
begin
	PrevEl := TSP^.prev;
	NextEl := TSP;

	New(NewTemp);
	NewTemp^.data := dat;
	NewTemp^.Next := NextEl;
	NewTemp^.Prev := PrevEl;
	PrevEl^.Next := NewTemp;
	NextEl^.Prev := NewTemp;
   TSP := NewTemp;
end
    end;
end;

Procedure ViewSpisok(VAR TSP :SPTR);
var
Temp :SPTR;
begin
Writeln;
Temp := TSP;
Repeat
Writeln(Temp^.Data);
Temp := Temp^.next;
until Temp = TSP;
end;

Procedure DelElement(VAR TSP :SPTR);
var
Temp,PrevEl,NextEl :SPTR;
begin
Temp := TSP;
PrevEl := Temp^.prev;
NextEl := Temp^.Next;
PrevEl^.Next := NextEl;
NextEl^.Prev := PrevEl;
TSP := NextEl;
end;

Procedure Menu;
var
Ch :Char;
begin
highvideo;
TextBackGround(1);
TextColor(14);
ClrScr;
Repeat
ClrScr;
Writeln('Кольцевой упорядоченный двунаправленный список');
Writeln('1) - Добавить элемент в список');
Writeln('2) - Удалить элемент из списка');
Writeln('3) - Просмотреть список');
Writeln('4) - Выход из программы');
Case Ch of
#49: AddToSpisok(Spisok);
#50: DelElement(Spisok);
#51: ViewSpisok(Spisok);
end;
Ch := Readkey;
Until (ch = #52) or (ch = #27);
end;

Procedure Application_Run;
begin
New(Spisok);
Spisok := Nil;
Menu;
end;

begin
Application_RUN;
end.