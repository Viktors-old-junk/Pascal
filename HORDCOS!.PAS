program HC;
	{Решим уроавнение методом хорд и касательных}
var
	levo,pravo,f1,f2,proisvod :real;
	{Границы промежутка, Значение уравнения в границах промежутка,
	Производная от уравнения}
	cycl :INTEGER;
	{Число циклов}
const
	a = 1;
	b = 10;
	c = 1;
	d = 188;
	{Кооффициенты Уравнения}
begin
	cycl := 0;
    levo := -30000;
	pravo := 30000;
    {Начальные значения переменных}
    writeln(a,', ',b,', ',c,', ',d);

    {Пока хотябы одно условие выполнимо, цикл выполняется}
	while (levo - pravo >= 0.0001) or (levo - pravo <=  -0.0001) do
	begin
		cycl := cycl + 1; {Счетчик циклов}
		f1 := a*levo*levo*levo+b*levo*levo+c*levo+d;
		f2 := a*pravo*pravo*pravo+b*pravo*pravo+c*pravo+d;
		{Расчет значений функций}
		proisvod := 3*a*levo*levo+2*b*levo+c;
		{Расчет производной функции}
		if f2 - f1 <> 0 then {Проверка знаменателя}
			levo := levo - (((pravo-levo)*f1)/(f2-f1));
			{Расчет новой нраницы 1}
		pravo := levo - (f1/proisvod);
		{Расчет новой границы 2}
	end;
	WRiTELN('Найден X = ',levo:5:5,', Колличество циклов = ',cycl);
	{Вывод результата}
	READLN;
end.