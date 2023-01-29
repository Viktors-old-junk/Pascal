{Помнишь конкурс?
Chijik writes:
      			THIS
			x				IS
			----------
					 **TOO
					HARD*
			----------
					******

 Каждая буква соответствует только одной цифре, * означает любое число,
 числа не могут начинаться с нуля.

 три чела её решили
 решение единственное:
 			       4379
			 x       79
			 ----------
			      39411
			     30653
			 ----------
			     345941


Эту задачу я решил так:}

Program ZADACH;
{Данный програмный прдукт не чем не охраняеться, на автор
не будет в восторге от нарушения его авторских прав!}
uses crt;
type
  rec1 = record
  dx :longint;
  this,i,s :integer;
  end;
var
  i,s :byte;
  This,is :longint;
	X1,x2,x4 :longint;
	st1,st2 :string;
	x3 :integer;
	Dx1 :array[0..1000] of rec1;
	Dx2 :array[0..1000] of rec1;
begin
	dx1[0].dx := 0;
	for this := 1000 to 9999 do
	begin
		str(this,st2);
		val(st2[4],s,x3);
		x1 := this*s;
		str(x1,st1);
		if (st1[3] <> st1[4]) and (s > 0) and (st1[3] = st2[1]) and
		   (length(st1) = 5)  and (st1[4]=st1[5]) then
		begin
			dx1[0].dx := dx1[0].dx + 1;
			dx1[dx1[0].dx].dx := x1;
      dx1[dx1[0].dx].this := this;
      dx1[dx1[0].dx].s := s;
      writeln(this,' * ',s,' = ',x1);
		end;
	end;
  readkey;
	dx2[0].dx := 0;
	for this := 1000 to 9999 do
	begin
		str(this,st2);
		val(st2[3],i,x3);
		x1 := this*i;
		str(x1,st1);
		if (st1[3] <> st1[4]) and (st1[2] <> st1[4]) and (st1[2] <> st1[3])	and
		   (st1[1] <> st1[4]) and (st1[1] <> st1[3]) and (st1[1] <> st1[2]) and
			 (i > 0)            and (st1[1] = st2[2])  and (length(st1) = 5) then
		begin
			dx2[0].dx := dx2[0].dx + 1;
			dx2[dx2[0].dx].dx := x1;
      dx2[dx2[0].dx].this := this;
      dx2[dx2[0].dx].i := i;
      writeln(this,' * ',i,' = ',x1);
		end;
	end;
  readkey;
  for x1 := 1 to dx1[0].dx do
    for x2 := 1 to dx2[0].dx do
    begin
      x4 := dx1[x1].dx + (dx2[x2].dx*10);
      str(x4,st1);
      if (length(st1) = 6) and (dx1[x1].this = dx2[x2].this) then
	      writeln(dx1[x1].this,' * ',dx2[x2].i,dx1[x1].s,' = ',dx1[x1].dx,
	      ' + ',dx2[x2].dx*10,' = ',x4);
    end;
end.