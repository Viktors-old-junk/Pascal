Program error;
uses crt;
  Procedure OutErrorMessageWithSound(TxtBack,TxtColor,X,Y,SHz,SLong :integer);
  const
    LineCol = 6;
		ErrMsg :Array[1..LineCol] of string =
 			('лллллллл  лл  лл  лл  лл    лл  лллллллл  лл    лл    лллллл',
 			 'лл    лл  лл  лл  лл  лл    лл  лл        лл  лл     лл   лл',
 			 'лл    лл  лл  лл  лл  лл  лллл  лллллллл  лллл      лл    лл',
 			 'лл    лл  лл  лл  лл  лллл  лл  лл    лл  лл  лл    лллллллл',
 			 'лллллллл  лллллллллл  лл    лл  лллллллл  лл    лл  лл    лл',
 			 '                                                (C) VKS Inc.');
	var
		OldX,OldY,Dx :byte;
	begin
		TextBackground(TxtBack);
		TextColor(TxtColor);
		ClrScr;
		For dx := 1 to LineCol do
		begin
    gotoxy(x,y+dx-1);
		Write(' '+ErrMsg[dx]);
    end;
    gotoxy(80,25);
		Sound(SHz);
		Delay(SLong);
		NoSound;
	end;
	var
  dxx :byte;
begin
  dxx := 1;
  Repeat
  	OutErrorMessageWithSound( 4,5,10,dxx,100*dxx,8000);
    inc(dxx);
    If dxx > 19 then dxx := 1;
		OutErrorMessageWithSound( 5,4,10,dxx, 50*dxx,8000);
    inc(dxx);
    If dxx > 19 then dxx := 1;
	Until Keypressed;
end.