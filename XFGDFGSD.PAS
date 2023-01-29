Program Matrix;
const
  maxX = 2;
  maxY = 4;
var
  Ar :Array[0..maxX,0..MaxY] of integer;
  Max, LineMax, Min, LineMin, sum :longint;
  i, j :Integer;
Begin
  For j := 0 to MaxY do
	For i := 0 to MaxX do
  Begin
    Write('VVedite element [',i,', ',j,'] = ');
    Readln(Ar[i,j]);
  End;

  For j := 0 to MaxY do
  Begin
    Sum := 0;
	  For i := 0 to MaxX do
      Sum := Sum + ar[i,j];

    If j = 0 then
    Begin
      Max := Sum;
      Min := Sum;
      LineMax := j;
      LineMin := j;
    End else
    Begin
      if sum > Max then
      Begin
        Max := Sum;
        LineMax := j;
      End;
      if sum < Min then
      Begin
        Min := Sum;
        LineMin := j;
      End;
    End;
  End;

  WriteLn('Maksimalnii element v stroke #',LineMax,' ee summa = ',Max);
  Write('Maksimalnaia stroka: ');
	For i := 0 to MaxX do
    Write(Ar[i,LineMax],' ');
  Writeln;

  WriteLn('Min element v stroke #',LineMin,' ee summa = ',Min);
  Write('Minimalnaia stroka: ');
	For i := 0 to MaxX do
    Write(Ar[i,LineMin],' ');
  Readln;
End.