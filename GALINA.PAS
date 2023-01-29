program HomeWork2;
uses crt;
{Решим кубическое уравнение методом половинного деления}
var
    A,B,C,D :integer; {коэффициенты уравнения}
    Answers :array[1..3] of integer; {массив, в котором хранятся ответы уравнения}
    answerx :longint; {колличество найденных ответов}

function stepen(Num,step:integer):real;
{функция возведения числа Num в степень step}
var
    if1 :integer; {переменная-параметр цикла}
    resoult :real; {хранит результаты функций}
begin
    resoult := 1;
    if step > 0 then
	for if1 := 1 to step do
	    resoult := resoult*num;
    stepen := resoult;
end;

function makefunc(Num:integer):real;
{вычисление значения уравнения при аргументе Num }
begin
    makefunc := a*stepen(num,3)+b*stepen(num,2)+c*num+d;
end;

function find_x(Left,Rigth:integer):integer;
{поиск ответа в промежутке от Left до Right }
var
    PointL,PointC,PointR :integer; {левая граница,средняя точка и правая граница промежутка, в котором ищется ответ уравнения }
    Cycldata :byte; {сохраняется колличество циклов}
begin
    cycldata := 0;
    PointL := Left;
    PointR := Rigth;
    repeat
	pointC := round((PointL+PointR)/2);
	if makefunc(PointC) = 0 then
	    begin
		answerx := answerx+1;
		answers[answerx] := PointC;
		exit;
	    end;

	if (makefunc(PointC) > 0) and (makefunc(PointL) < 0) or
	(makefunc(PointC) < 0) and (makefunc(PointL) > 0) then
	    PointR := PointC;

	if (makefunc(PointC) > 0) and (makefunc(PointR) < 0) or
	(makefunc(PointC) < 0) and (makefunc(PointR) > 0) then
	    PointL := PointC;

	cycldata := cycldata + 1;
    until cycldata = 16;
end;

Procedure FindAllX;
{поиск промежутка в котором искать ответ}
var
    if2 :integer; {переменная-параметр цикла }
begin
    for if2 := -2048 to 2047 do
    begin
       if (makefunc(if2*16) > 0) and (makefunc(if2*16+15) < 0)
       or (makefunc(if2*16) < 0) and (makefunc(if2*16+15) > 0)
       then
	   find_x(if2*16,if2*16+15);

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
{установка начального значения переменных}
begin
    clrscr;
    answers[1] :=0;
    answers[2] :=0;
    answers[3] :=0;
{a:=1;
b:=-1;
c:=-1;
d:=-2;}

    a := 4mod 3+1;
    b := 2mod 5-6;
    c := 0mod 6-4;
    d := 9mod 7-4;
{расчет коэффицентов уравнения на основе номера студенческого билета }

    answerx := 0;
    Write('Работаю... ');
end;

Procedure OutData;
{вывод ответа}
begin
    Writeln('Ok');
    writeln('a = ',a,' b = ',b,' c = ',c,' d = ',d);
    writeln(a,'X^3 +',b,'X^2 +',c,'X +',d,' = 0');
    writeln('X1 = ',answers[1],', X2 = ',answers[2],', X3 = ',answers[3],', Всего ответов: ',answerx);
    readkey;
end;

Procedure Application_Run;
{главная процедура программы}
begin
    setvar;
    FindAllX;
    OutData;
end;

begin
{запуск главной процедуры программы}
    Application_Run;
end.