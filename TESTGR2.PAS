Program sss;
Uses Crt, Graph, SGraph;
Var
f :String;
k :LongInt;
Begin
  InitSGraph(gr640l);
  TestGraph;
  ReadKey;
  TestGraph2;
  SetColor(15);
  OutTextXY(110,200,'Try to edit string!');
  ShadowText(110,210,'Enter Text:',0,5);
  SetColor(15);
  F := ReadString(206 ,210, 10);
  BevelText(110,220,'Text:',7,0,4);
  ShadowText(158,220,F,1,15);
  BloodText(110,230,'Enter Digits:',7,6);
  SetColor(15);
  k := ReadInt(222,230,0,2000000000);
  BevelText(110,240,'Digits:',8,1,5);
  SetColor(15);
  OutInt(174,240,K,0);
  ReadKey;
	CloseGraph;
End.