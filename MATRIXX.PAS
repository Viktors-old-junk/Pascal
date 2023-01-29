Program xMatrix;
Var
  Matrix :Array[0..4,0..4] of longint;
  i, j, s :integer;
  Number :LongInt;
  bestdiff, average, bestAverage :Real;
Begin
  For i := 0 to 4 do
  For j := 0 to 4 do
  Begin
	  Write('Enter matrix element [',i+1,', ',j+1,'] = ');
    ReadLn(Matrix[i,j]);
  End;

  Write('Enter your number ');
  ReadLn(Number);

  For i := 0 to 4 do
  Begin
	  For j := 0 to 4 do
  	Begin
		  Write(Matrix[i,j]:11);
	  End;
    Writeln;
  End;

  S := -1;
  bestdiff :=	2147483647;
	For i := 0 to 4 do
  begin
    Average := 0;
	  For j := 0 to 4 do
      Average := Average + Matrix[i,j];
    Average := Average/5;
    WriteLn('Average of line ',i+1,' = ',Average:0:1);
    If ABS(Average-Number) <= Bestdiff then
    begin
			s := i;
      BestDiff := ABS(Average-Number);
      BestAverage := Average;
    End;
  End;
  Writeln;
  WriteLN('Best fit line is: ',s+1,' average value is: ',BestAverage:0:1);
  Readln;
End.
