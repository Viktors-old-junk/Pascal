Program Dialog;
{Подключение дополнительных модулей и объявление постоянных}
uses crt;
const question = 'Как вас зовут ?';
reply1 = 'Галина учись на отлично !!!';
reply2 = 'Иди учиться в университет, институт, выходи замуж.';
reply3 = 'Пора и на работу устроиться !';
reply4 = 'Твой путь один - на пенсию, за выслугу лет.';
{Объявление переменных}
var
name,sw:string;
age:byte;
{Основная программа}
begin
{Цикл ввода значений и вывода соответствующих надписей на экран}
    repeat
	clrscr;
	gotoxy (10,10);
	writeln(question);
	gotoxy (30,10);
	readln(name);
	gotoxy (10,11);
	writeln('привет ',name);
	if (name='x')or(name='X') then halt;


	 if (name<>'x')or(name<>'X') then begin
	    gotoxy (10,12);
	    write ('Сколько же тебе лет дорогая ?');
	    gotoxy (39,12);
	    read (age);
	    gotoxy (10,13);
            {Блок сравнений}
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
{Конец программы}
end.












































