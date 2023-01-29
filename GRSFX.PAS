Program GraphSFX;
Uses Graph, SGraph;

Procedure ShadowText(x,y :Integer; Text :String; Scolor, Color :Byte);
Begin
  SetColor(SColor);
  OutTextXY(X+1,Y+1,Text);
  SetColor(Color);
  OutTextXY(X,Y,Text);
End;

Procedure BloodText(x,y :Integer; Text :String; Scolor, Color :Byte);
Begin
  SetColor(SColor);
  OutTextXY(X+1,Y,Text);
  OutTextXY(X-1,Y,Text);
  OutTextXY(X,Y+1,Text);
  OutTextXY(X,Y-1,Text);
  SetColor(Color);
  OutTextXY(X,Y,Text);
End;

Procedure BevelText(x,y :Integer; Text :String; FColor, SColor, Color :Byte);
Begin
  SetColor(SColor);
  OutTextXY(X+1,Y+1,Text);
  SetColor(FColor);
  OutTextXY(X-1,Y-1,Text);
  SetColor(Color);
  OutTextXY(X,Y,Text);
End;

Procedure Line2(X1,Y1,X2,Y2,Color :LongInt);
Var
  X, Y, Z :LongInt;
Begin
  SetColor(Color);
  PutPixel(X1,Y1,Color);
  For X := X1 To X2 Do
  Begin
    PutPixel(X,Round(Y1+((Y2-Y1)/(X2-X1))*X)-18,Color)
  End;
End;

Begin
  InitSGraph(gr640l);
  SetBkColor(25);
  ShadowText(10,10,'Shadow Text',0,5);
  BloodText(10,20,'Blood Text',7,6);
  BevelText(10,30,'BevelText',7,0,4);
  Line( 10,40,100,200);
  Line2(10,40,100,200,3);
  SetColor(5);
  Line(400,300,200,100);
  Line2(200,100,400,300,3);
  Readln;
  CloseGraph;
End.