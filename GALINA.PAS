program HomeWork2;
uses crt;
{??訬 ?㡨??᪮? ?ࠢ????? ??⮤?? ??????????? ???????}
var
    A,B,C,D :integer; {??????樥??? ?ࠢ?????}
    Answers :array[1..3] of integer; {???ᨢ, ? ????஬ ?࠭???? ?⢥?? ?ࠢ?????}
    answerx :longint; {????????⢮ ????????? ?⢥⮢}

function stepen(Num,step:integer):real;
{?㭪??? ?????????? ??᫠ Num ? ?⥯??? step}
var
    if1 :integer; {??६?????-??ࠬ??? 横??}
    resoult :real; {?࠭?? १??????? ?㭪権}
begin
    resoult := 1;
    if step > 0 then
	for if1 := 1 to step do
	    resoult := resoult*num;
    stepen := resoult;
end;

function makefunc(Num:integer):real;
{????᫥??? ???祭?? ?ࠢ????? ??? ???㬥??? Num }
begin
    makefunc := a*stepen(num,3)+b*stepen(num,2)+c*num+d;
end;

function find_x(Left,Rigth:integer):integer;
{????? ?⢥?? ? ?஬???⪥ ?? Left ?? Right }
var
    PointL,PointC,PointR :integer; {????? ?࠭???,?।??? ??窠 ? ?ࠢ?? ?࠭??? ?஬???⪠, ? ????஬ ?????? ?⢥? ?ࠢ????? }
    Cycldata :byte; {???࠭????? ????????⢮ 横???}
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
{????? ?஬???⪠ ? ????஬ ?᪠?? ?⢥?}
var
    if2 :integer; {??६?????-??ࠬ??? 横?? }
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
{??⠭???? ??砫쭮?? ???祭?? ??६?????}
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
{?????? ??????業⮢ ?ࠢ????? ?? ?᭮?? ?????? ??㤥???᪮?? ?????? }

    answerx := 0;
    Write('???????... ');
end;

Procedure OutData;
{?뢮? ?⢥??}
begin
    Writeln('Ok');
    writeln('a = ',a,' b = ',b,' c = ',c,' d = ',d);
    writeln(a,'X^3 +',b,'X^2 +',c,'X +',d,' = 0');
    writeln('X1 = ',answers[1],', X2 = ',answers[2],', X3 = ',answers[3],', ?ᥣ? ?⢥⮢: ',answerx);
    readkey;
end;

Procedure Application_Run;
{??????? ???楤??? ?ணࠬ??}
begin
    setvar;
    FindAllX;
    OutData;
end;

begin
{?????? ??????? ???楤??? ?ணࠬ??}
    Application_Run;
end.