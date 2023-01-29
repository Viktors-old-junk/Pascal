program MetodHordAndKosateln;
uses crt;
	{Метод хорд и косательных}
var
a,b,c,d :integer;
	{Кооффициенты кубического уравнения}

    Procedure get_koren;
    {Процедура поиска Х методом Хорд и Косательных}
    var
		Interr :INTEGER;
		{Число циклов}
		Left,right,FLeft,FRigth,Dfunction :real;
		{Left, Rigth - Границы промежутка,
		Fleft, FRigth - Функции от границ промежутка,
		Dfunction - Производная от функции}
    begin
    	Left := -32000;
		right := 32000;
		Interr := 0;
		{Задаем начальные значения переменных}
		repeat
			Interr := Interr + 1; {Счетчик циклов}
			FLeft := a*Left*Left*Left+b*Left*Left+c*Left+d;
			FRigth := a*right*right*right+b*right*right+c*right+d;
			{Расчет значений функций}
			Dfunction := 3*a*Left*Left+2*b*Left+c;
			{Расчет производной функции}
			if FRigth - FLeft <> 0 then {Проверка знаменателя}
					Left := Left - (((right-Left)*FLeft)/(FRigth-FLeft));
			{Расчет новой нраницы 1}
			right := Left - (FLeft/Dfunction);
			{Расчет новой границы 2}
		until (Left <= right+0.0009) AND (Left >= right-0.0009);
		{Если границы примерно равны, то конец цикла}
		WRITELN('Методом Хорд и Косательных найден X = ',Left:5:5);
	    WRITELN('Колличество интерраций (циклов) = ',Interr);
		{Вывод результата}
		READKEY;
	    end;

begin
	clrscr;
    {Стираем экран}
	Writeln('Введите ЦЕЛЫЕ кооффициенты от 32000 до -32000');
	Write('Введите кооффициент при Х в кубе ');
	readln(a);
	Write('Введите кооффициент при Х в квадрате ');
	readln(b);
	Write('Введите кооффициент при Х ');
	readln(c);
	Write('Введите свободный член ');
	readln(d);
    {Вводим кооффициенты}
	Writeln(a,', ',b,', ',c,', ',d);

	get_koren; {Вызываем функцию}
end.