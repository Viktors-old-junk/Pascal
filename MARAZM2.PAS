 Program Sveta_8;
   var s:real;
       b:boolean;
   const n=10;
	       a=6;
   Type TMas=array[1..n] of real;
   var Mas:TMas;
   Procedure Input(var v:TMas; n:byte);
     var i:byte;
   begin
     writeln('Вводим элементы массива');
     for i:=1 to n do
       readln(v[i]);
   end;
    Procedure Output (const v:TMas;n:byte);
      var i:byte;
    begin
      writeln('Введенный массив');
      b:=false;
      for i:=1 to n do
			  begin
        write(v[i]:0:2,', ');
        s:=s+v[i];
        if v[i]=6 then  b:=true;
        end;
        writeln;
        if b=false then s:=-10;
        writeln('s=',s:1:3);
    end;
  begin
    input(Mas,n);
    output(Mas,n);
    readln;
  end.


