program HomeWork2;
uses crt;
{Решим кубическое уравнение методом половинного деления}
var
A,B,C,D :integer;
Answers :array[1..3] of real;
answerx :longint;

function stepen(num :real;step:integer):real;
var
if1 :integer;
resoult :real;
begin
resoult := 1;
if step > 0 then
   for if1 := 1 to step do
       resoult := resoult*num;
stepen := resoult;
end;

function makefunc(Num:real):real;
begin
makefunc := a*stepen(num,3)+b*stepen(num,2)+c*num+d;
end;

function find_x(Left,Rigth:integer):integer;
var
PointL,PointC,PointR :real;
Cycldata :longint;
begin
cycldata := 0;
PointL := Left;
PointR := Rigth;
repeat
      pointC := (PointL+PointR)/2;
      if makefunc(PointC) = 0 then
      begin
           answerx := answerx+1;
           answers[answerx] := PointC;
           break;
      end;

      if (makefunc(PointC) > 0) and (makefunc(PointL) < 0) or
      (makefunc(PointC) < 0) and (makefunc(PointL) > 0) then
           PointR := PointC;

      if (makefunc(PointC) > 0) and (makefunc(PointR) < 0) or
      (makefunc(PointC) < 0) and (makefunc(PointR) > 0) then
           PointL := PointC;

      cycldata := cycldata + 1;
until cycldata = 2000000;

end;

Procedure FindAllX;
var
if2 :integer;
begin
for if2 := -2048 to 2047 do
begin
     if (makefunc(if2*16) > 0) and (makefunc(if2*16+15) < 0)
     or
        (makefunc(if2*16) < 0) and (makefunc(if2*16+15) > 0)
     then
     begin
     gotoxy(1,3);
          writeln(if2);
          find_x(if2*16,if2*16+15);
          end;

     if makefunc(if2*16) = 0 then
     begin
          answerx := answerx+1;
          answers[answerx] := if2*16;
     end;

     if makefunc(if2*16+15) = 0 then
     begin
          answerx := answerx+1;
          answers[answerx] := if2*16+15;
     end;
end;

end;

Procedure SetVar;
begin
clrscr;
{a := 1;
b := -4;
c := -7;
d := 10;}
answers[1] :=0;
answers[2] :=0;
answers[3] :=0;
a := 8mod 3+1;
b := 5mod 5-6;
c := 0mod 6-4;
d := 9mod 7-4;
answerx := 0;
Write('Работаю... ');
end;

Procedure OutData;
begin
Writeln('Ok');
writeln('a = ',a,' b = ',b,' c = ',c,' d = ',d);
writeln(a,'X^3 +',b,'X^2 +',c,'X +',d,' = 0');
writeln('X1 = ',answers[1],', X2 = ',answers[2],', X3 = ',answers[3],', Всего ответов: ',answerx);
readkey;
end;

Procedure Application_Run;
begin
setvar;
FindAllX;
OutData;
end;

begin
Application_Run;
end.