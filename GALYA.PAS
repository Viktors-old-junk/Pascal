Program Dialog;
{??????祭?? ???????⥫???? ???㫥? ? ??????? ?????ﭭ??}
uses crt;
const question = '??? ??? ????? ?';
reply1 = '?????? ????? ?? ?⫨筮 !!!';
reply2 = '??? ??????? ? 㭨????????, ????????, ??室? ?????.';
reply3 = '???? ? ?? ࠡ??? ???ந???? !';
reply4 = '???? ???? ???? - ?? ??????, ?? ??????? ???.';
{??????? ??६?????}
var
name,sw:string;
age:byte;
{?᭮???? ?ணࠬ??}
begin
{???? ????? ???祭?? ? ?뢮?? ᮮ⢥????????? ?????ᥩ ?? ??࠭}
    repeat
	clrscr;
	gotoxy (10,10);
	writeln(question);
	gotoxy (30,10);
	readln(name);
	gotoxy (10,11);
	writeln('?ਢ?? ',name);
	if (name='x')or(name='X') then halt;


	 if (name<>'x')or(name<>'X') then begin
	    gotoxy (10,12);
	    write ('????쪮 ?? ⥡? ??? ??ண?? ?');
	    gotoxy (39,12);
	    read (age);
	    gotoxy (10,13);
            {???? ?ࠢ?????}
	    if (age<=12) then write(reply1);
	    if ((age<=20)and(age>12)) then write(reply2);
	    if ((age<=40)and(age>20)) then write(reply3);
	    if (age>40) then write(reply4);
	    repeat
		sw:='';
		sw:=readkey;
	    until not (sw='')
	end;
	gotoxy (20,10);
	readln(name);
    until (name='x')or(name='X')
{????? ?ணࠬ??}
end.












































