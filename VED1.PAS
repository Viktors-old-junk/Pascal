Program VED;
Uses Crt;
Type
  CT = Set Of #0..#255;
Const
  CodeTable :Array[0..63] of Char =
	  'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890+*';
	CodeSet   :CT = ['A'..'Z', 'a'..'z', '0'..'9','+','*'];
	Encode = '1';
	Decode = '2';
	Exit   = '3';

  Function GetNumber(InChr :Char) :Byte;
  Var
    Dx :Byte;
  Begin
    GetNumber := 0;
    For Dx := 0 to 63 do
      If CodeTable[Dx] = InChr then GetNumber := Dx;
  End;

  Procedure EncodeFile;
  Var
  	IFileName, OFileName :String;
    IFile :File of byte;
    IData :Byte;
    ISeek :LongInt;
    ISize :LongInt;
    OFile :Text;
		OData :String;
    X,Y,Z,Pr :LongInt;
  Begin
  		WriteLn('Please select INPUT file to Encode');
      ReadLn(IFileName);
  		WriteLn('Please select OUTPUT file to Encode');
  		ReadLn(OFileName);

    Assign(IFile,IFileName);
    Reset(IFile);
    ISize := FileSize(IFile);
    Pr := ISize Div 100;
    Assign(OFile,OFileName);
    ReWrite(OFile);
    OData := '';
    ClrScr;
    GotoXY(2,2);
    Write('Input file  - ',IFileName);
    GotoXY(2,3);
    Write('Output file - ',OFileName);
    GotoXY(2,4);
    Write('Operation   - Encode');
    GotoXY(2,5);
    Write('0%');
    For ISeek := 0 to ISize - 1 do
    Begin
      Seek(IFile,ISeek);
      Read(IFile,IData);
      X := IData;
      Y := X Div 64;
      Z := X Mod 64;
      OData := OData + CodeTable[Y] + CodeTable[Z];
      If (Length(OData) > 60) Or (ISeek = ISize-1) then
			Begin
        WriteLn(OFile,OData);
        OData := '';
		    GotoXY(2,5);
        Write(ISeek Div Pr,'%');
			End;
    End;
    GotoXY(2,7);
    Write('Encoding done.');
    Close(IFile);
    Close(OFile);
	End;

  Procedure DecodeFile;
  Var
  	IFileName, OFileName :String;
    IFile :File of Byte;
    IData :Byte;
    ISeek :LongInt;
    ISize :LongInt;
    OFile :File of Byte;
    OData :Byte;
    OSeek :LongInt;
    X,Y   :Char;
    Z,Pr  :LongInt;
  Begin
 		WriteLn('Please select INPUT file to Decode');
    ReadLn(IFileName);
 		WriteLn('Please select OUTPUT file to Decode');
 		ReadLn(OFileName);
    Assign(IFile,IFileName);
    Reset(IFile);
    ISize := FileSize(IFile);
    Pr := ISize Div 100;
    Assign(OFile,OFileName);
    ReWrite(OFile);
    OSeek := -1;
    X := #0;
    Y := #0;
    ClrScr;
    GotoXY(2,2);
    Write('Input file  - ',IFileName);
    GotoXY(2,3);
    Write('Output file - ',OFileName);
    GotoXY(2,4);
    Write('Operation   - Decode');
    GotoXY(2,5);
    WriteLn('0%');
    For ISeek := 0 To ISize - 1 Do
    Begin
      Seek(IFile,ISeek);
      Read(IFile,IData);
      If Chr(IData) In CodeSet then
      Begin
        If X = #0 Then
        Begin
        	X := Chr(IData);
				End Else
        Begin
        	Y := Chr(IData);
	        Inc(OSeek);
  	      Seek(OFile,OSeek);
    	    OData := GetNumber(X)*64+GetNumber(Y);
      	  Write(OFile,OData);
          X := #0;
          Y := #0;
          GotoXY(2,5);
          Write(ISeek Div Pr,'%');
        End;
      End;
    End;
    GotoXY(2,7);
    Write('Encoding done.');
    Close(IFile);
    Close(OFile);
  End;

  Procedure Menu;
  Var
  Operation :Char;
  Begin
    Repeat
    	ClrScr;
      WriteLn('VED Beta 0.1');
      WriteLn('Please select operation:');
  		WriteLn('1 - Encode file');
  		WriteLn('2 - Decode file');
  		WriteLn('3 - Exit');
      Operation := ReadKey;
      Case Operation Of
      	Encode :EncodeFile;
      	Decode :DecodeFile;
      End;
    Until Operation = Exit;
  End;

Begin
  Menu;
End.