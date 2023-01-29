Program FunctionSearch;
uses crt;
{Подключаем CRT}
const
{Устанавливаем коофициенты уравнения}
{a = 8mod 3+1;
b = 5mod 5-6;
c = 0mod 6-4;
d = 9mod 7-4;
a = 1;
b = 1;
c = 1;
d = 1;}
		a = 1;
		b = 5.425;
		c = -2.823;
		d = -33.065;


function getFunct(X :real): real;
{Функция поиска F(x)}
	begin
	getFunct := a*x*x*x+b*x*x+c*x+d;
  end; {конец}

procedure message(X :real;Ki :integer);
{Вывод сообщения о том, что X найден}
	begin
	writeln('Найден Х = ',X:0:10,', Колличество интераций = ',Ki);
  	writeln(GetFunct(x));
	end; {конец}

procedure Metod1;
(*половинное деление*)
var
A1,Left,Center,Right :real;
{A1-Ответ Left-Левая, Center-Центр, Right-,Правая граница промежутка}
k :integer;
{k-Колличество интераций}
{Поиск X}
	begin
{Это начальное значение переменых}
	Left := -32768;
	Center := 0;
	Right := 32767;
	k := 0;

{Цикл поиска X}
		repeat
{Счетчик интераций}
		k := k + 1;
{Поиск X на границах и и в середине числового отрезка}
		if (getFunct(left) <= 0.000009) and (getFunct(left) >= -0.000009) then
			begin
{Если нашли X - записываем его, сообщаем об этом и выходим из циклал}
				A1 := Left;
				message(A1,k);
				exit;
		end;

		if (getFunct(center) <= 0.000009) and (getFunct(center) >= -0.000009) then
			begin
				A1 := center;
				message(A1,k);
				exit;
		end;

		if (getFunct(right) <= 0.000009) and (getFunct(right) >= -0.000009) then
			begin
				A1 := right;
				message(A1,k);
				exit;
			end;
{Проверили все точки}

{и}

{определили новые границы промежутка}
		if (getfunct(left) < 0) and (getfunct(center) > 0) then
			begin
				right := center;
				center := (left+center)/2;
			end;

		if (getfunct	(left) > 0) and (getfunct(center) < 0) then
			begin
				right := center;
				center := (left+center)/2;
			end;

		if (getfunct(right) < 0) and (getfunct(center) > 0) then
			begin
				left := center;
				center := (right+center)/2;
			end;

		if (getfunct(right) > 0) and (getfunct(center) < 0) then
			begin
				left := center;
				center := (right+center)/2;
			end;
{Закончили определять границы промежутка}

{Цикл выполняется до тех пор, пока}
	until (center <= 0.000009) and (center >= -0.000009);
{цетральная точка, по значению не станет меньше погрешности}
end;

procedure metod2;
(*хорд и/или косательных?*)
var
a1,b1,x1,x2,X,fa,f1a,fb :real;
k :INTEGER;
begin
a1 := -32768;
b1 := 32768;
k := 0;
repeat
k := k + 1;
fa := getfunct(a1);
fb := getfunct(b1);
f1a := 3*a*a1*a1+2*b*a1+c;
if fb - fa <> 0 then A1 := a1 - (((b1-a1)*fa)/(fb-fa));
B1 := a1 - (fa/f1a);
until (A1 <= B1+0.000009) AND (A1 >= B1-0.000009);
message(A1,k);
end;

procedure metod3;
var
a1,b1,x1,x2,X,fa,f1a,fb :real;
k :INTEGER;
begin
a1 := -32000;
b1 := 32000;
k := 0;
repeat
k := k + 1;
fa := getfunct(a1);
fb := getfunct(b1);

if fa - fb <> 0 then fa := ((b1*fa)-(a1*fb))/(fa-fb);

{if (x < - 0.2) or (x > 0.2) then}
a1 := a1/2;
b1 := b1/2;

until (x >= -0.00009) and (x <= 0.00009);

message(x,k);

end;

begin
	clrscr; {Сотрем экран}
	writeln(a:2,' ',b:2:5,' ',c:2:5,' ',d:2:5); {Выведем коофициенты}
	metod1; {Найдем X}
  metod2;
  metod3;


	readkey; {Ждем нажатия на клавишу}
end.