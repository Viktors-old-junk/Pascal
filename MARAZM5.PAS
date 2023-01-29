Program Marazm5;
  type TMas=array[0..12] of integer;
  var
  s,t,q:integer;
  a :TMas;
  summ :real;
 Function p (x:integer):real;
   var i,k:integer;
       pp,b:real;
   begin
     pp := 0;
     for i := 0 to 12 do
     begin
       b := 1;
       for k := 1 to i do
         b := b*x;
       pp := pp + a[i]*b
     end;
     p := pp;
   end;
 begin
 writeln('Введите S  и  T ');
 Readln(s,t);
 for q:=0 to 12 do begin
  write('Введите элемент №',q,' = ');
  readln(a[q]);
  end;
 summ := p(1)-p(t)+sqr(p(s-t))-sqr(p(1))*p(1);
 writeln(summ:0:2);
 readln;
end.