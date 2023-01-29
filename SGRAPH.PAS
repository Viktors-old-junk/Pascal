UNIT SGRAPH;
INTERFACE
USES GRAPH,crt;

Type
TResolution = Byte;

Const
{TResolution consts}
gr320  = 0;
gr640l = 1;
gr640h = 2;
gr800  = 3;
gr1024 = 4;

PROCEDURE INITSGRAPH(SCRR: TResolution);
PROCEDURE SELCOLOR(COLOR :BYTE);
PROCEDURE SELFILL(FILL: BYTE);
PROCEDURE SETBKCOLOR(X1 :WORD);
PROCEDURE OUTREAL(X1,Y1 :INTEGER; DIGIT :REAL; Width,Decimals :integer);
PROCEDURE OUTINT(X1,Y1 :INTEGER; DIGIT :LONGINT; Width :integer);
FUNCTION  READINT(X1,Y1 :INTEGER; MIN,MAX :LONGINT) :LONGINT;
FUNCTION  READREAL(X1,Y1 :INTEGER; MIN,MAX :REAL) :REAL;
Function  ReadString(X1, Y1 :Integer; MaxLength :Byte) :String;
Procedure testgraph;
Procedure testGraph2; {Номер цвета рисуется своим цветом.}
Procedure ShadowText(x,y :Integer; Text :String; Scolor, Color :Byte);
Procedure BloodText(x,y :Integer; Text :String; Scolor, Color :Byte);
Procedure BevelText(x,y :Integer; Text :String; FColor, SColor, Color :Byte);

VAR
S_COLOR,S_FILL :WORD;
SGDriver,SGMode :Integer;

IMPLEMENTATION

FUNCTION readREAL;
VAR
STOPF :BOOLEAN;
PKEY :CHAR;
STRDIG,STRDIG1 :STRING[7];
DIGIT :REAl;
CODEX,SIZE :INTEGER;
CONTROLD :REAL;
IMGSAVE :POINTER;
BEGIN
STOPF := FALSE;
STRDIG := '';
PKEY := '0';
SIZE := IMAGESIZE(X1,Y1,X1+56,Y1+8);
GETMEM(IMGSAVE,SIZE);
GETIMAGE(X1,Y1,X1+56,Y1+8,IMGSAVE^);
REPEAT
PKEY := READKEY;

IF PKEY = #13 THEN STOPF := TRUE;
IF (PKEY = '1') OR (PKEY = '2') OR (PKEY = '3') OR (PKEY = '4') OR (PKEY = '5') OR (PKEY = '6') OR (PKEY = '7')
OR (PKEY = '8') OR (PKEY = '9') OR (PKEY = '0') OR (PKEY = '.')THEN
BEGIN
STRDIG := STRDIG + PKEY;
END;

IF (PKEY = #8) AND (LENGTH(STRDIG) > 0) THEN
BEGIN
DELETE(STRDIG,LENGTH(STRDIG),1);
END;

VAL(STRDIG,DIGIT,CODEX);
PUTIMAGE(X1,Y1,IMGSAVE^,0);
OUTTEXTXY(X1,Y1,STRDIG);
UNTIL STOPF;

VAL(STRDIG,CONTROLD,CODEX);
IF CONTROLD > MAX THEN STR(MAX,STRDIG);
IF CONTROLD < MIN THEN STR(MIN,STRDIG);
If Codex <> 0 then strdig := '';

VAL(STRDIG,DIGIT,CODEX);
PUTIMAGE(X1,Y1,IMGSAVE^,0);
OUTTEXTXY(X1,Y1,STRDIG);

Release(Imgsave);

READreal := DIGIT;
END;


FUNCTION READINT;
VAR
STOPF :BOOLEAN;
PKEY :CHAR;
STRDIG,STRDIG1 :STRING[7];
DIGIT :LONGINT;
CODEX,SIZE :INTEGER;
CONTROLD :REAL;
IMGSAVE :POINTER;
BEGIN
STOPF := FALSE;
STRDIG := '';
PKEY := '0';
SIZE := IMAGESIZE(X1,Y1,X1+56,Y1+8);
GETMEM(IMGSAVE,SIZE);
GETIMAGE(X1,Y1,X1+56,Y1+8,IMGSAVE^);
REPEAT
PKEY := READKEY;

IF PKEY = #13 THEN STOPF := TRUE;
IF (PKEY = '1') OR (PKEY = '2') OR (PKEY = '3') OR (PKEY = '4') OR (PKEY = '5') OR (PKEY = '6') OR (PKEY = '7')
OR (PKEY = '8') OR (PKEY = '9') OR (PKEY = '0') THEN
BEGIN
STRDIG := STRDIG + PKEY;
END;

IF (PKEY = #8) AND (LENGTH(STRDIG) > 0) THEN
BEGIN
DELETE(STRDIG,LENGTH(STRDIG),1);
END;

VAL(STRDIG,DIGIT,CODEX);
PUTIMAGE(X1,Y1,IMGSAVE^,0);
OUTTEXTXY(X1,Y1,STRDIG);
UNTIL STOPF;

VAL(STRDIG,CONTROLD,CODEX);
IF CONTROLD > MAX THEN STR(MAX,STRDIG);
IF CONTROLD < MIN THEN STR(MIN,STRDIG);
If Codex <> 0 then strdig := '';

VAL(STRDIG,DIGIT,CODEX);
PUTIMAGE(X1,Y1,IMGSAVE^,0);
OUTTEXTXY(X1,Y1,STRDIG);

Release(Imgsave);

READINT := DIGIT;
END;

Function ReadString(X1, Y1 :Integer; MaxLength :Byte) :String;
VAR
STOPF :BOOLEAN;
PKEY :CHAR;
STR1,STR2 :STRING;
ResString :String;
CODEX,SIZE :INTEGER;
CONTROLD :REAL;
IMGSAVE :POINTER;
BEGIN
STOPF := FALSE;
Str1 := '';
PKEY := '0';
SIZE := IMAGESIZE(X1,Y1,X1+MaxLength*8,Y1+8);
GETMEM(IMGSAVE,SIZE);
GETIMAGE(X1,Y1,X1+MaxLength*8,Y1+8,IMGSAVE^);

REPEAT
  PKEY := READKEY;
  IF PKEY = #13 THEN STOPF := TRUE;
  If (PKey in [#32..#255]) And (Length(Str1) < MaxLength) Then STR1 := STR1 + PKEY;

  IF (PKEY = #8) AND (LENGTH(STR1) > 0) THEN
  BEGIN
    DELETE(STR1,LENGTH(STR1),1);
  END;

  PUTIMAGE(X1,Y1,IMGSAVE^,0);
  OUTTEXTXY(X1,Y1,STR1);
UNTIL STOPF;

PUTIMAGE(X1,Y1,IMGSAVE^,0);
OUTTEXTXY(X1,Y1,STR1);

Release(Imgsave);

READString := Str1;
END;

PROCEDURE OUTINT;
{Вывод целого числа}
VAR
OUTSTRING :STRING;
BEGIN
STR(DIGIT:Width,OUTSTRING);
OUTTEXTXY(X1,Y1,OUTSTRING);
END;

PROCEDURE OUTREAL;
{Вывод дробного числа}
VAR
OUTSTRING :STRING;
BEGIN
STR(DIGIT:Width:Decimals,OUTSTRING);
OUTTEXTXY(X1,Y1,OUTSTRING);
END;

PROCEDURE INITSGRAPH;
{Инициализация 256-и цветного графического ражима}
BEGIN

IF Scrr = gr320  THEN SGMODE := 0;
IF Scrr = gr640l THEN SGMODE := 1;
IF Scrr = gr640h THEN SGMODE := 2;
IF Scrr = gr800  THEN SGMODE := 3;
IF Scrr = gr1024 THEN SGMODE := 4;

INITGRAPH(SGDRIVER,SGMODE,'');
END;

PROCEDURE SELFILL;
BEGIN
S_FILL := FILL;
SETFILLSTYLE(S_FILL,S_COLOR);
END;

PROCEDURE SELCOLOR;
{Глобальная установка цвета}
BEGIN
SETCOLOR(S_COLOR);
SETFILLSTYLE(S_FILL,S_COLOR);
END;

PROCEDURE SETBKCOLOR;
BEGIN
SETFILLSTYLE(1,X1);
BAR(0,0,GETMAXX,GETMAXY);
END;

  procedure testgraph;
  var
  tx,ty :integer;
  strr :string[8];
  begin

  for tx := getmaxcolor+1 downto  0  do
  begin
  setfillstyle(1,tx);
  Bar(0,0,Round((GetMaxX / GetMaxColor)*Tx),Round((GetMaxY / GetMaxColor)*(Tx+1)))
  end;

  ty := 30;
  for tx := 0 to getmaxcolor do
  begin
  ty := ty + 10;
  if ty = 200 then ty := 10;

  str(tx,strr);
  setcolor(tx+100);
  outtextxy(round((getmaxx+1)/(getmaxcolor+1))*tx+1,ty,strr);
  setcolor(15);
  OutInt(83,1,GetMaxColor,0);
    OutInt(1,1,GetMaxX,0);
      OutInt(41,1,GetMaxY,0);
        OutInt(127,1,GetMaxMode,0);
  Outtextxy(147,1,'Super Graph Module  Copyright 2001 VKS');
  end;
  end;

  Procedure testGraph2;
  var
    tx,ty :integer;
    strr :string[8];
  Begin
    Ty := 0;
    For Tx := 0 To GetMaxColor Do
    Begin
      SetFillStyle(1,GetMaxColor-Tx);
      Bar(Round((GetMaxX / GetMaxColor)*Tx),0,Round((GetMaxX / GetMaxColor)*(Tx+1)),GetMaxY)
    End;
    For Tx := 0 to GetMaxColor Do
    Begin
      str(tx,strr);
      setcolor(tx);
      outtextxy(round((getmaxx)/(getmaxcolor))*(tx),ty,strr);
      Inc(ty,10);
      if ty = 190 then ty := 0;
    End
  End;

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

BEGIN
SGDriver := InstallUserDriver('VESA', nil);
END.