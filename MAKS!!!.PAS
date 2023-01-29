program Hord_Cos;
	{Метод хорд и косательных}
var
	gran1,gran2,fun1,fun2,proisfun :real;
	{Границы промежутка, Функции от границ промежутка, Производная от функции}
	i :INTEGER;
	{Число циклов}
const
	a = 1000;
	b = 10;
	c = 1;
	d = 10;
	{Это кооффициенты кубического уравнения}
begin
	gran1 := -32000;
	gran2 := 32000;
	i := 0;
	{Начальные значения переменных}
	repeat
		i := i + 1; {Счетчик циклов}
		fun1 := a*gran1*gran1*gran1+b*gran1*gran1+c*gran1+d;
		fun2 := a*gran2*gran2*gran2+b*gran2*gran2+c*gran2+d;
		{Расчет значений функций}
		proisfun := 3*a*gran1*gran1+2*b*gran1+c;
		{Расчет производной функции}
		if fun2 - fun1 <> 0 then {Проверка знаменателя}
			gran1 := gran1 - (((gran2-gran1)*fun1)/(fun2-fun1));
			{Расчет новой нраницы 1}
		gran2 := gran1 - (fun1/proisfun);
		{Расчет новой границы 2}
	until (gran1 <= gran2+0.0009) AND (gran1 >= gran2-0.0009);
	{Если границы примерно равны, то конец цикла}
	WRiTELN('Найден X = ',gran1:5:5,', Колличество циклов = ',i);
	{Вывод результата}
	READLN;
end.