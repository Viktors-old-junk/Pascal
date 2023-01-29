Program aaa;
Var
  text: Array[0..19] of string[80];
  i, j :integer;
  Words :Integer;
  ch :Char;
Begin
  WriteLn('Please enter text (20 lines, 80 chars in line maximum)');
  For i := 0 to 19 do Readln(Text[i]);
  Words := 0;
  ch := chr(0);
  For i := 0 to 19 do
  Begin
    If length(text[i]) > 0 then
    begin
      For j := 1 to length(text[i]) do
      begin
        If ((Text[i][j] = #32) or (j = Length(text[i]))) and (ch <> #32) then inc(Words);
        ch := Text[i][j];
      End;
    End;
  End;
  WriteLn('Words: ',Words);
  Readln;
End.

