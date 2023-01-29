Program raedras;
var
min,min1,min2,hour,hour1,hour2,cd :integer;
str,str2 :string;
ff :text;
const
fname = 'ras.txt';
begin
assign(ff,fname);
reset(ff);

{Считываем название}

readln(ff,str);

{Считываем рабочую сторку и разбиваем ее на часы и минуты}

readln(ff,str);
str2 := copy(str,26,5);
delete(str2,3,3);
val(str2,hour,cd);
str2 := copy(str,29,2);
val(str2,min,cd);

{Считываем третью сторку и разбиваем ее на часы и минуты}

readln(ff,str);
str2 := copy(str,26,5);
delete(str2,3,3);
val(str2,hour2,cd);
str2 := copy(str,29,2);
val(str2,min2,cd);

{Если время рабочей сторки больше чем второй}
{записываем рабочую строку на место второй, а вторую на место первой}

if (hour > hour2) or (hour = hour2) AND (min > min2) then
begin
hour1 := hour2;
hour2 := hour;
min1 := min2;
min2 := min;
end;

{Если время рабочей сторки меньше чем второй}
{записываем рабочую строку на место первой}

if (hour < hour2) or (hour = hour2) AND (min < min2) then
begin
hour1 := hour;
min1 := min;
end;

repeat

{Начинаем цикл}
{Считываем рабочую строку и разбиваем ее на часы и минуты}

readln(ff,str);
str2 := copy(str,26,5);
delete(str2,3,3);
val(str2,hour,cd);
str2 := copy(str,29,2);
val(str2,min,cd);

{Если время рабочей сторки больше чем второй}
{записываем рабочую строку на место второй}

if (hour > hour2) or (hour = hour2) and (min > min2) then
begin
hour2 := hour;
min2 := min;
end;

{Если время рабочей сторки меньше чем первой}
{записываем рабочую строку на место первой}

if (hour < hour1) or (hour = hour2) and (min < min2) then
begin
hour1 := hour;
min1 := min;
end;

{Если фаил кончился то закончить цикл}

until eof(ff) = true;

{Находим наибольший интервал}

if min2 > min1 then
begin
hour := hour2-hour1;
min := min2-min1;
end

else
begin
min := 60-(min1-min2);
hour := hour2-hour1-1;
end;

{Выводим ответ}

writeln('"Вариант 1. Экзаменационный лист 000"');
writeln('"Наибольший интервал в движении поездов ',hour,' ч. ',min,' м."');
writeln(hour1,'.',min1,' - ',hour2,'.',min2);
readln;
close(ff);
end.