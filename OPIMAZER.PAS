Program Optimizer;
{*******************************************************************}
{                                                                   }
{   Программа предназначена для упращения матриц по методу Гаусса.  }
{ В частности для решения систем линейных уравнений.                }
{   Для решения системы нужно ввести в программу матрицу состоящую  }
{ из соответственных коофициентов при незвестных и правой части.    }
{   Програма не приводит систему к диаганальному виду, но упращает  }
{ её (систему) на столько, что приведение не составляет особенного  }
{ труда.                                                            }
{                                                                   }
{-------------------------------------------------------------------}
{  Вы можете использовать эти исходные коды в любых некоммерчиских  }
{  целях, при публикации в любом виде, ссылка обязательна.          }
{*******************************************************************}
Uses crt;
Const
  MX = 10;
  MY = 10;
Type
  MArray = record
    X,Y :byte;
    AR  :Array[1..MX,1..MY] of longint;
  End;

  Procedure GetMatrix(Var IM :MArray);
  Var
  I, J :LongInt;
  Begin
    For I := 1 to MX Do
    For J := 1 To MY Do
      IM.Ar[I,J] := 0;
    Clrscr;
    Write('Please enter number of matrix columns : ' );
    Readln(IM.X);
    Write('Please enter number of matrix lines: ' );
    Readln(IM.Y);
    Writeln('Enter matrix elements, firsts - columns');
    Window(1,4,80,4);
    For I := 1 to IM.X Do
    For J := 1 To IM.Y Do
    Begin
      Write('Please enter matrix element №[',I,',',J,']: ');
      Readln(IM.AR[I,J]);
    End;
    Window(1,1,80,25);
  End;

  Procedure OutMatrix(IM :MArray);
  Var
    I, J,x :LongInt;
  Begin
  clrscr;
  x := WhereY;
  Window(1,X,80,X+im.y);
    For I := 1 to IM.X Do
    For J := 1 to IM.Y Do
    Begin
      GotoXY((I-1)*8+1,J);
      Write(IM.AR[I,J]:0{:4});
    End;
  Window(1,1,80,25);
  GotoXy(1,X+im.y);
  End;

  Procedure Opimize(Var IM :MArray);
  Var
    I, J, K, L, S, Y, O :LongInt;
    K1, K2, K3, MN :Longint;
    Flag,F2 :Boolean;
  Begin
    For K := 1 to IM.X-1 do
    Begin
      S := 0;
      Y := 1;
      For L := IM.Y DownTo 1 do If IM.Ar[K,L] <> 0 Then
      Begin
        Flag := True;
        If K > 0 Then
          For J := 1 To K - 1 Do
            If IM.AR[J,L] <> 0 Then Flag := False;
        If Flag Then Y := L;
  			Inc(S);
      End;
      If S > 1 Then
      begin
        Flag := True;
        If K > 1 Then
        Begin
          For J := 1 To K - 1 Do
            If IM.AR[J,Y] <> 0 Then Flag := False;
        End;
        If Flag Then
        Begin
          For J := 1 to IM.Y Do
          Begin
{          WriteLn('J=Y');
          ReadLn;}
            If J = Y Then Continue;
            K1 := IM.AR[K,J];
            K2 := IM.AR[K,Y]*-1;
            For L := 1 To IM.X Do
              IM.AR[L,J] := IM.AR[L,Y]*K1+IM.AR[L,J]*K2;

            MN := Maxlongint;
            For L := 1 To IM.X Do
              If IM.AR[L,J] <> 0 then
                If ABS(IM.AR[L,J]) < MN Then MN := ABS(IM.AR[L,J]);
            For L := MN downto 1 do
            Begin
              F2 := True;
              For O := 1 to IM.X do
                If IM.AR[O,J] <> 0 then
                  If ABS(IM.AR[O,J]) mod L <> 0 Then
									  F2 := false;
              If F2 Then
                If IM.AR[O,J] <> 0 then
                  For O := 1 to IM.X do IM.AR[O,J] := IM.AR[O,J] div L;
            End;

{           Clrscr;}
            OutMatrix(IM);
            readLn;
          End;
        End Else
        Begin
{          WriteLn('Flag=false');
          ReadLn;}
        End;
      End;
    End;
{    For L := 1 To IM.Y Do
    Begin
{      K3 := IM.AR[1,Y];}
{      For J := 1 To IM.X Do
        If IM.AR[J,L] <> 0 Then
        Begin
          K3 := IM.AR[J,L];
          Break;
        End;
      For J := 1 To IM.X Do
        IM.AR[J,L] := IM.AR[J,L] / K3;
    End}
  End;

Var
  Matrix :MArray;
Begin
  Getmatrix(Matrix);
  ClrScr;
  Opimize(Matrix);
  WriteLn('THe eND!');
{  ClrScr;
  Outmatrix(Matrix);}
  ReadLn;
End.
