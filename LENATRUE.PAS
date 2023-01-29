{Программа с менюшкой для работы со стеком.}
{Выполняет некоторые операции.             }


Program Stack(input,output);
uses crt;
Const n = 5; {Колличество элементов в стеке}
      enter = #13; {код клавиши, для выхода из программы}
Type telem = integer; {тип элемента стека}
     list =^zveno; {ссылка на элемент}
     zveno = record {тип элемента}
                elem:telem;{integer}
                next:list {ссылка на следующий элемент}
             end;
     mass = array [1..n] of integer; {массив, преобразуемый в стек}
     address = list;{ссылка на элемент}
Var  St, {ссылка на первый элемент(соответствует ссылке 'L'используемой
	  в подпрограмме, ссылка  меняется т.к. в некоторых подпрограммах
	  'L'является параметром переменной и при использовании подпрограммы
	  преобретает значение 'NIL' и при выводе стека он может оказаться
	  нулевым).}
      q,   {временная ссылка, используется в подпрограмме, присваивается
            искомому элементу}
      p, p1: list;{ временные ссылки}
      chislo,    {выбор в case}
      x:integer;   {число добавляемое в стек}
      b:boolean;
      c:char;    {в запросах 'y' или 'n'}
{----------------------------------------------------------------}
{----------подпрограмма выводящая главное меню пользователя------}
function zapros1:integer;
 var vibor:integer;
begin
    writeln('Что Вы хотите:');
 writeln('Вывести стек ___________ - нажмите "1"');
 writeln('Ввести новый стек ______ - нажмите "2"');
 writeln('Просто добавить элемент  - нажмите "3"');
 writeln('Внести элемент в стек __ - нажмите "4"');
 writeln('Удалить элемент из стека - нажмите "5"');
 writeln('Закончить работу _______ - нажмите "6"');
 readln(vibor);
 zapros1:=vibor;
end;
{--------подпрограмма запрашивающая пользователя
                        о выводе нового изменённого стека--------------}
function zapros2:boolean;
 var c:char;
begin
 zapros2:=false;
 writeln('Вывести стек? Да-"у".Нет-"n".');
 readln(c);
 if (c='n')or(c='N') then zapros2:=true;
end;
{------------подпрограмма добавляющая один элемент в стек-------------}
Procedure Vst_st( var L:list; x:integer );
  var p:list;
 begin
  new(p);
  p^.elem:=x;
  p^.next:=L;
  L:=p
 end;
{------------ввод массива для создания стека------------------------}
Procedure Vv_vect ( var a:mass );
  var i:integer;
 begin
  writeln('Введите ',n,' элементов стека');
  for i:=1 to n do read (a[i])
 end;
{--------------------------ввод стека----------------------}
Procedure Vvodstack(var L:list);
 var i:integer; a:mass;
  begin
      { Ввод массива элементов для построения списка }
     Vv_vect(A);
     L:=nil;
     for i:=1 to n do Vst_st( L, A[i] );
  end;
{-------------------------------вывод стека--------------------------}
procedure Writestack(L:list);
 var q:address;
begin
    q:=L;
    while q<>nil do
                  begin
                   write (q^.elem,' ');
                   q:=q^.next
                  end;
    writeln;
end;
{--------------------третий запрос о продолжении работы-------------------}
function zapros3:boolean;
 var c:char; b:boolean;
begin
 b:=false;
 writeln('**********************************');
 writeln('Продолжить работу? Да-"у".Нет-"n".');
 readln(c);
 if (c='n')or(c='N') then b:=true;
 if not b then begin
                 clrscr;
                 writeln('Ваш стек:');
                 writestack(st);
               end;
 zapros3:=b;
end;
{--------подпрограмма проверяющая наличие элемента в списке----------------}
Function Proverka(L:list; c:telem; var p,p1:address): boolean;
    var q:address; find:boolean;
begin
    q:=L;
    p1:=L;
    find:=false;
    while (q<>nil) and not find do begin
                              if q^.elem=c then find:=true else begin
                                                                  p1:=q;
                                                                  q:=q^.next;
                                                                   end;
                                   end;
    proverka:=find;
    if find then p:=q
  end;
{--------------удаление элемента из стека------------------------------}
Procedure Delete(L:list);
   var p,p1:address; z:telem;
  begin
   writeln('Введите элемент который надо удалить');
   readln(z);
   p:=L;
   p1:=L;
   if not proverka(L,z,p,p1) then writeln('Такого элемента в списке нет');
   if (p1=L)and(proverka(L,z,p,p1)) then begin
                                          L:=p1^.next;
                                          dispose(p1)
                                         end;

   if proverka(L,z,p,p1) then
                           begin
                            p1^.next:=p^.next;
                            dispose(p)
                           end;
  if not zapros2 then writestack(L);
  end;
{------------------------------вставка элемента---------------------------}
Procedure Insert(L:list);
 var p,p1,r:address; z,c:telem;
begin
    writeln;
    writeln('Введите элемент за которым надо вставить');
    readln(z);
    p:=L;
    p1:=L;
    if proverka(L,z,p,p1) then
                         begin
                            new(r);
                            writeln('Введите элемент');
                            read(c);
                            r^.elem:=c;
                            r^.next:=p^.next;
                            p^.next:=r;
                            r:=nil
                         end
                       else writeln('Такого элемента в списке нет');
  if not zapros2 then writestack(L);
end;
{---------------начало основной программы---------------------------------}


Begin
 p:=nil;
 p1:=nil;
 clrscr;
 writeln;
 writeln('{Программа с меню пользователя для работы со стеком.}');
 writeln('{ Операции: ввод стека, добавление и удаление элемента в стеке }');
 writeln('Начало работы ');

 Vvodstack(st);
Repeat
begin
repeat
 chislo:=zapros1;
 case chislo of

   1: writestack(st);

   2: vvodstack(st);

   3: begin
         writeln('Введите элемент');
         read(x);
         Vst_st(st,x);
         if not zapros2 then writestack(st);
      end;

   4: insert(st);

   5: delete(st);
 end;{case}
until zapros3;
end;
until chislo=6;
 { ПРЕОБРАЗОВАНИЕ СПИСКА И ВЫВОД ЕГО ЭЛЕМЕНТОВ }

 writeln('Конец работы ');
 writeln('Нажмите клавишу ввод ...');
 repeat until readkey=enter

End.

