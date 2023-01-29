Program Proga1;
Const
  Nmax = 10;
  MMax = 10;
Var
  B :Array[1..NMax,1..MMax] of longint;
  i,j,Nt,Mt,iMax,iMin,eMax,eMin,Temp :longint;
Begin
  Write('Please enter number of rows in array "B" from 1 to ',MMax,': ');
  ReadLn(Mt);
  Write('Please enter number of columns in array "B" from 1 to ',NMax,': ');
  ReadLn(Nt);

  For i := 1 to Mt do
  For j := 1 to Nt do
  Begin
    Write('Please enter array element B[',j,',',i,']: ');
    Readln(B[j,i]);
  End;

  WriteLn('Your matrix before processing:');
  For i := 1 to Mt do
  Begin
	  For j := 1 to Nt do
  	Begin
      Write(B[j,i]:10);
  	End;
    WriteLn;
  End;

  For i := 1 to Mt do
  Begin
    eMax := B[1,i];
    eMin := B[1,i];
    iMax := 1;
    iMin := 1;
    For j := 1 to Nt do
  	Begin
      If B[j,i] >= eMax then
      Begin
        eMax := B[j,i];
        iMax := j;
      End;
      If B[j,i] <= eMin then
      Begin
        eMin := B[j,i];
        iMin := j;
      End;
  	End;
    Temp := B[1,i];
    B[1,i] := B[iMax,i];
    B[iMax,i] := Temp;
    Temp := B[Nt,i];
    B[Nt,i] := B[iMin,i];
    B[iMin,i] := Temp;
  End;

  WriteLn;
  WriteLn('Your matrix after processing:');
  For i := 1 to Mt do
  Begin
	  For j := 1 to Nt do
  	Begin
      Write(B[j,i]:10);
  	End;
    WriteLn;
  End;
  ReadLn;
End.
