Program PolinomOfLagrange;
{********************************************
 ????᫥??? ???祭?? ?????童?? ???࠭??
 ??? ?㭪樨, ??।??????? ? n+1 㧫?
 ????௮??樨 x(i) (i-0,1...,n)
 *********************************************}
 uses crt;
 const
 	m=15;
    type
    	vector=array[0..m] of real;
        var
        	i,j,n :integer;
            	p,l,x1 :real;
                	x,y :vector;
                    	ch :char;

                        Procedure pausa;
                        begin
                        writeln;
                        writeln('Press any key...');
                        repeat ch := readkey until ch <> '';
                        end;

                        Begin
                        clrscr;
                        Writeln('??????? n - ???म? ?????童?? ???࠭?? ');
                        REad(n);
                        Writeln('??????? ???? ???祭?? xi, yi; i = 0,1...n');
                        for i := 0 to n do
                        begin
                        read(x[i],y[i]);
                        writeln;
                        end;
                        Writeln('??????? X');
                        read(x1);
                        l := 0;
                        for i := 0 to n do
                        begin
                        p := 1;
                        for j := 0 to n do
                        if j <> i then p := p*(x1-x[j])/(x[i]-x[j]);
                        l := l+y[i]*p
                        end;
                        Writeln('x = ',x1:8:4,'   l(x) = ',l:8:4);
                        pausa;
                        end.