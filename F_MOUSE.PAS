{==============} UNIT F_Mouse; {===============}
{+---------------------------------------------+
 |  ? ?⮬ ???㫥 ᮡ࠭? ???楤??? ? ?㭪樨, |
 |    ???ᯥ稢??騥 ࠡ??? ???ன?⢠ ?????   |
 |                ⨯? ????                    |
 +---------------------------------------------+}
                  INTERFACE

{??????騩 ⨯ ?ᯮ???????? ??? ??।??????
 ??????⮢, ?롨ࠥ??? ????? (??.SetMouseOption)}
type
  MouseItemType = record
    X1,Y1,X2,Y2: Integer;  {???न???? ???????}
    Butt: Word;            {?᫮??? ?맮??}
    Key : Word             {????-??? ???????}
  end;

{??? MouseHandlerType ??।????? ???楤???
??ࠡ?⪨ ᮡ?⨩ ?? ????}
type
  MouseHandlerType = Procedure(Mask,Buttons, 					X,Y,DX,DY: Integer);
{????⠭?? ?롮?? ?????? ????}
const
  LeftButton   = 1;   		{????? ??????}
  RightButton  = 2;   		{?ࠢ?? ??????}
  CenterButton = 4;   		{?।??? ??????}
  AnyButton    = 7;   		{?? ??????}
{??????樥??? ????????? ????㠫???? ???न??? ? ⥪?⮢??}
const
  TextRatioX: Byte = 8;
  TextRatioY: Byte = 8;
{+---------------------------------------------+
 |                ???樠??? ????               |
 +---------------------------------------------+}
Function IsMouse: Boolean;
  {??????頥? TRUE, ?᫨ ???? ????㯭?}

Function InitMouse: Boolean;
  {???樠??? ????}

Procedure SetMousePage(Page: Byte);
  {??⠭???????? ??࠭??? ??? 㪠??⥫? ????}

Function GetMousePage: Byte;
  {??????頥? ????? ??࠭??? ? 㪠??⥫??}

Procedure SetStepToPixel(Hor,Ver: Integer);
  {??⠭???????? ????⢨⥫쭮??? ????}

Procedure GetStepToPixel(var Hor,Ver: Integer);
  {??????頥? ????⢨⥫쭮??? ????}

Procedure SetDoubleSpeed(Speed: Word);
 {??⠭???????? ??ண 㤢????? ᪮????? ??६?饭?? 㪠??⥫?}

Function GetDoubleSpeed: Word;
  {??????頥? ??ண 㤢????? ᪮?????}
{+---------------------------------------------+
 |                  ???न????                 |
 ----------------------------------------------+}
Function MouseTextCooX(X: Integer): Byte;
  {??????頥? ⥪?⮢?? ???न???? ?? ???????? ????㠫쭮?}

Function MouseTextCooY(Y: Integer): Byte;
  {??????頥? ⥪?⮢?? ???न???? ?? ???????? ????㠫쭮?}

Function MouseGraphCooX(X: Byte): Integer;
  {??????頥? ????㠫???? ???न???? ?? ???????? ⥪?⮢??}

Function MouseGraphCooY(Y: Byte): Integer;
  {??????頥? ????㠫???? ???न???? ?? ???????? ⥪?⮢??}

Procedure MouseWhereXY(var X,Y: Integer);
  {??????頥? ????㠫???? ???न???? ????}

Procedure MouseGotoXY(X,Y: Integer);
  {??ॢ???? 㪠??⥫? ???? ? ????? ?????????
   X,Y - ????㠫???? ???न????}

Function MouseWhereX: Byte;
 {??????頥? ??ਧ??⠫???? ⥪?⮢?? ???न????}

Function MouseWhereY: Byte;
  {??????頥? ???⨪?????? ⥪?⮢?? ???न????}

Function MouseIn(X1,Y1,X2,Y2: Integer): Boolean;
  {??????頥? TRUE, ?᫨ 㪠??⥫? ??室????
   ? ???????? ??אַ㣮?쭨??}
{+---------------------------------------------+
 |             ?????ﭨ? ??????                |
 +---------------------------------------------+}
Function NumButton: Byte;
  {??????頥? ???????⢮ ?????? ????}

Procedure GetMouseState(var Butt,X,Y: Integer);
  {??????頥? ⥪?饥 ?????ﭨ? ????:
   BUTT - 䫠? ?????ﭨ? ??????;
   X,Y  - ⥪?騥 ????㠫???? ???न????}

Function MousePressed: Boolean;
  {??????頥? TRUE, ?᫨ ?????? ?? ??????}

Procedure MouseButtPressed(Butt: Integer;
                   var Stat,Count,X,Y: Integer);
  {??????頥? ????ଠ??? ? ????⮩ ???????:
   BUTT - 䫠? ?롮?? ???????;
   STAT - ?????ﭨ? ??????;
   COUNT - ???????⢮ ????⨩, X,Y - ???न????}

Procedure MouseButtReleased(Butt: Integer;
                   var Stat,Count,X,Y: Integer);
  {??????頥? ????ଠ??? ?? ????饭??? ???????:
   BUTT - 䫠? ?롮?? ???????;
   STAT - ?????ﭨ? ??????;
   COUNT - ???????⢮ ????᪠???;
   X,Y - ???न????}
{+---------------------------------------------+
 |                   ????                      |
 +---------------------------------------------+}
Procedure MouseWindow(X1,Y1,X2,Y2: Integer);
  {?????? ???न???? ??????? ??६?饭??
  㪠??⥫?. X1...Y2 - ????㠫???? ???न????}

Procedure MouseScreen;
  {??⠭???????? ???? ?? ???? ??࠭}
{+---------------------------------------------+
 |             ??ଠ 㪠??⥫?                 |
 +---------------------------------------------+}
Procedure ShowMouse;
  {???????? 㪠??⥫? ????}

Procedure HideMouse;
  {?????? 㪠??⥫? ????}

Procedure MouseTextCursor(ScrMask,CurMask: Word);
  {??⠭???????? ????? ??? ⥪?⮢??? 㪠??⥫?}

Procedure MouseBlink(YUp,YDn: Byte);
  {?????? ?????????? ?????? ?㦭??? ࠧ????}

Procedure MouseGraphCursor(var ScrCurMask;X,Y: Byte);
  {?????? ??? ???????᪮?? 㪠??⥫?}
{+---------------------------------------------+
 |     ???࠭????/????⠭??????? ?????ﭨ?     |
 +---------------------------------------------+}
Function MouseBuffSize: Word;
  {??????頥? ????? ?????? ??? ???࠭???? ??ࠬ??஢}

Procedure SaveMouse(var Buff);
  {???࠭??? ? ?????? ⥪?饥 ?????ﭨ? ????}

Procedure RestoreMouse(var Buff);
  {????⠭???????? ???࠭????? ?????ﭨ? ????}
{+---------------------------------------------+
 |              ???????? ??????????            |
 +---------------------------------------------+}
Procedure SetMouseItem(NItem: Byte; var Items);
  {??⠭???????? ???????? ??? ?롮?? ?????:
   NItem - ???????⢮ ??????⮢;
   Items - array [1..NItem] of MouseItemType;
   ?????? ??⠭???? ?????뢠????}

Procedure AddMouseItem(Item: MouseItemType);
  {????????? ??? ???? ??????? ??? ?롮?? ?????.
   ?????? ??⠭???? ???࠭?????}

Procedure ClearMouseItems;
  {?????뢠?? ࠭?? ??⠭???????? ????????}

Procedure GetMouseItem(var NItem: Byte; var Items);
  {??????頥? ??⠭???????? ????????}

Function KeyOrMousePressed: Boolean;
  {??????頥? TRUE, ?᫨ ?????? ??????? ??? ??⨢?? ????}

Function ReadKeyOrMouse: Char;
  {??????頥? ᨬ??? ????⮩ ??????? ??? ???࠭??? ??樨}
{+---------------------------------------------+
 |        ??ࠡ?⪠ ᮡ?⨩ ?? ????            |
 +---------------------------------------------+}
Procedure SetMouseHandler(Mask: Word; Proc: MouseHandlerType);
  {??⠭???????? ????? ? ?᫮??? ?맮?? ??ࠡ??稪?}

Procedure ChangeMouseHandler(Mask: Word;  Proc: MouseHandlerType;
                        	var OldMask: Word; var OldProc: Pointer);
  {???????? ?????? ??ࠡ??稪 ?????}

Procedure ClearMouseHandler;
  {??????? ??ࠡ??稪 ᮡ?⨩}

                 IMPLEMENTATION
{+---------------------------------------------+
 |               ???樠??? ????                |
 +---------------------------------------------+}
Uses DOS,CRT;
type
  MouseItems = array [1..2*MaxInt div
         SizeOf(MouseItemType)] of MouseItemType;
  PMouseIt =^MouseItems;
const
  MousePresent: Boolean = False; 	{?ਧ??? ??????? ????}
  ItemsList   : PMouseIt = NIL;  	{???ᨢ ??????⮢ ?롮??}
  NMouseItem  : Byte = 0;        	{???????⢮ ??????⮢ ?롮??}
  MouseVisible: Boolean = False; 	{?ਧ??? ???????? 㪠??⥫?}
  x1m: Integer = 0;       	        {???न???? ???????}
  y1m: Integer = 0;       	        {??६?饭?? 㪠??⥫?}
  x2m: Integer = 639;
  y2m: Integer = 199;
  Speed2: Word = 128;   		{??ண 㤢????? ᪮?????}
  VerRat: Integer = 8;  		{????⢨⥫쭮??? ????}
  HorRat: Integer = 8;
  NButton: Byte = 0;    		{???????⢮ ?????? ????}
var
  Reg: registers;

Function IsMouse: Boolean;
  {??????頥? TRUE, ?᫨ ???? ????㯭?}
var
  p    : Pointer;
  k,x,y: Integer;
  Is   : Boolean;
begin
  if NButton=0 then
    begin
      GetIntVec($33,p);
      Is := p<>NIL;
      if Is then with Reg do
        begin
          ax := $3;
          bx := $FFFF;
          Intr($33,Reg);
          Is := bx<>$FFFF
        end;
      MousePresent := Is
    end;
  IsMouse := MousePresent
end;   {IsMouse}
{-----------------------}
Function InitMouse: Boolean;
  {???樠??? ????}
begin
  with Reg do
    begin
      ax := 0;
      Intr($33,Reg);
      MousePresent := ax=$FFFF;
      NButton := bx
    end;
  ClearMouseItems;
  SetMousePage(0);
  HideMouse;
  MouseScreen
end;   {InitMouse}
{-----------------------}
Procedure SetMousePage(Page: Byte);
  {??⠭???????? ??࠭??? ??? 㪠??⥫? ????}
begin
  with Reg do
    begin
      ax := $1D;
      bl := Page;
      bh := 0;
      Intr($33,Reg)
    end
end;   {SetMousePage}
{-----------------------}
Function GetMousePage: Byte;
  {??????頥? ????? ??࠭??? ? 㪠??⥫??}
begin
  with Reg do
    begin
      ax := $1E;
      Intr($33,Reg);
      GetMousePage := bl
    end
end;   {GetMousePage}
{-----------------------}
Procedure SetStepToPixel(Hor,Ver: Integer);
  {??⠭???????? ????⢨⥫쭮??? ????}
begin
  if IsMouse then with Reg do
    begin
      ax := $0F;
      cx := Hor and $7FFF;
      dx := Ver and $7FFF;
      HorRat := cx;
      VerRat := dx;
      Intr($33,Reg)
    end
end;   {SetStepToPixel}
{-----------------------}
Procedure GetStepToPixel(var Hor,Ver: Integer);
  {??????頥? ????⢨⥫쭮??? ????}
begin
  if IsMouse then with Reg do
    begin
      Hor := HorRat;
      Ver := VerRat
    end
end;   {GetStepToPixel}
{-----------------------}
Procedure SetDoubleSpeed(Speed: Word);
 {??⠭???????? ??ண 㤢????? ᪮????? ??६?饭?? 㪠??⥫?}
begin
  if IsMouse then with Reg do
    begin
      ax := $13;
      dx := Speed;
      Speed2 := Speed;
      Intr($33,Reg);
    end
end;   {SetDoubleSpped}
{-----------------------}
Function GetDoubleSpeed: Word;
  {??????頥? ??ண 㤢????? ᪮?????}
begin
  GetDoubleSpeed := Speed2
end;   {GetDoubleSpped}
{+---------------------------------------------+
 |                  ???न????                 |
 +---------------------------------------------+}
Function MouseTextCooX(X: Integer): Byte;
  {??????頥? ⥪?⮢?? ???न???? ?? ???????? ????㠫쭮?}
begin
  MouseTextCooX := X div TextRatioX+1
end;   {MouseTextCooX}
{-----------------------}
Function MouseTextCooY(Y: Integer): Byte;
  {??????頥? ⥪?⮢?? ???न???? ?? ???????? ????㠫쭮?}
begin
  MouseTextCooY := Y div TextRatioY+1
end;   {MouseTextCooY}
{-----------------------}
Function MouseGraphCooX(X: Byte): Integer;
  {??????頥? ????㠫???? ???न???? ?? ???????? ⥪?⮢??}
begin
  MouseGraphCooX := (X-1)*TextRatioX
end;   {MouseGraphCooX}
{-----------------------}
Function MouseGraphCooY(Y: Byte): Integer;
  {??????頥? ????㠫???? ???न???? ?? ???????? ⥪?⮢??}
begin
  MouseGraphCooY := (Y-1)*TextRatioY
end;   {MouseGraphCooY}
{-----------------------}
Procedure MouseWhereXY(var X,Y: Integer);
  {??????頥? ????㠫???? ???न???? ????}
begin
  if IsMouse then with Reg do
    begin
      ax := $3;
      Intr($33,Reg);
      X := cx;
      Y := dx
    end
  else
    begin
      X := -1;
      Y := -1
    end
end;   {MouseWhereXY}
{-----------------------}
Procedure MouseGotoXY(X,Y: Integer);
  {??ॢ???? 㪠??⥫? ???? ? ????? ?????????
   X,Y - ????㠫???? ???न????}
begin
  if IsMouse then with Reg do

    begin
      ax := $4;
      cx := X;
      dx := Y;
      Intr($33,Reg)
    end
end;   {MouseGotoXY}
{-----------------------}
Function MouseWhereX: Byte;
 {??????頥? ??ਧ??⠫???? ⥪?⮢?? ???न????}
begin
  if IsMouse then with Reg do
    begin
      ax := $3;
      Intr($33,Reg);
      MouseWhereX := MouseTextCooX(cx)
    end
  else
    MouseWhereX := 0
end;   {MouseWhereX}
{-----------------------}
Function MouseWhereY: Byte;
  {??????頥? ⥪?⮢?? ???न???? ?? ???⨪???}
begin
  if IsMouse then with Reg do
    begin
      ax := $3;
      Intr($33,Reg);
      MouseWhereY := MouseTextCooY(dx)
    end
  else
    MouseWhereY := 0
end;   {MoueseWhereY}
{-----------------------}
Function MouseIn(X1,Y1,X2,Y2: Integer): Boolean;
  {??????頥? TRUE, ?᫨ 㪠??⥫? ??室????
   ? ???????? ??אַ㣮?쭨??}
begin
  if IsMouse then with Reg do
    begin
      ax := $3;
      Intr($33,Reg);
      MouseIn := (cx>=X1) and (cx<=X2) and
                 (dx>=Y1) and (dx<=Y2)
    end
  else
    MouseIn := False
end;   {MouseIn}
{+--------------------------------------------+
 |            ?????ﭨ? ??????                |
 +--------------------------------------------+}
Function NumButton: Byte;
  {??????頥? ???????⢮ ?????? ????}
begin
  NumButton := NButton
end;   {NumButton}
{----------------------}
Procedure GetMouseState(var Butt,X,Y: Integer);
  {??????頥? ⥪?饥 ?????ﭨ? ????:
   BUTT - 䫠? ?????ﭨ? ??????;
   X,Y  - ⥪?騥 ????㠫???? ???न????}
begin
  if IsMouse then with Reg do
    begin
      ax := $3;
      Intr($33,Reg);
      Butt := bx;
      X := cx;
      Y := dx
    end
  else
    begin
      Butt := 0;
      X := 0;
      Y := 0
    end
end;   {GetMouseState}
{-----------------------}
Function MousePressed: Boolean;
  {??????頥? TRUE, ?᫨ ?????? ?? ??????}
begin
  if IsMouse then with Reg do
    begin
      ax := $3;
      Intr($33,Reg);
      MousePressed := bx<>0
    end
  else
    MousePressed := False
end;   {MousePressed}
{-----------------------}
Procedure MouseButtPressed(Butt: Integer;
                   var Stat,Count,X,Y: Integer);
  {??????頥? ????ଠ??? ? ????⮩ ???????:
   BUTT - 䫠? ?롮?? ???????;
   STAT - ?????ﭨ? ??????;
   COUNT - ???????⢮ ????⨩, X,Y - ???न????}
begin
  if IsMouse then with Reg do
    begin
      ax := $5;
      bx := Butt;
      Intr($33,Reg);
      Count := bx;
      X := cx;
      Y := dx;
      Stat := bx
    end
  else
end;   {MouseButtPressed}
{-----------------------}
Procedure MouseButtReleased(Butt: Integer;
                   var Stat,Count,X,Y: Integer);
  {??????頥? ????ଠ??? ?? ????饭??? ???????:
   BUTT - 䫠? ?롮?? ???????;
   STAT - ?????ﭨ? ??????;
   COUNT - ???????⢮ ????᪠???;
   X,Y - ???न????}
begin
  if IsMouse then with Reg do
    begin
      ax := $6;
      bx := Butt;
      Intr($33,Reg);
      Count := bx;
      X := cx;
      Y := dx;
      Stat := bx
    end
  else
end;   {MouseButtReleased}
{+---------------------------------------------+
 |                   ????                      |
 +---------------------------------------------+}
Procedure MouseWindow(X1,Y1,X2,Y2: Integer);
  {?????? ???न???? ??????? ??६?饭?? 㪠??⥫?.
	X1...Y2 - ????㠫???? ???न????}
begin
  if IsMouse then
    begin
      x1m := X1;
      y1m := Y1;
      x2m := X2;
      y2m := Y2;
      with Reg do
        begin
          ax := $7;
          cx := X1;
          dx := X2;
          Intr($33,Reg);
          ax := $8;
          cx := Y1;
          dx := Y2;
          Intr($33,Reg)
        end
    end
end;   {MouseWindow}
{-----------------------}
Procedure MouseScreen;
  {??⠭???????? ???? ?? ???? ??࠭}
var
  x2,y2: Integer;
begin
  if IsMouse then with Reg do
    begin
      ah := $F;
      Intr($10,Reg);
      case al of
      1,4,5,13: begin
                  x2 := 319;
                  y2 := 199
                end;
      15,16: begin
               x2 := 639;
               y2 := 349
             end;
      17,18: begin
               x2 := 639;
               y2 := 479
             end;
      else
        x2 := 639;
        y2 := 199
      end
    end;
  MouseWindow(0,0,x2,y2)
end;   {MouseScreen}
{+---------------------------------------------+
 |             ??ଠ 㪠??⥫?                 |
 +---------------------------------------------+}
Procedure ShowMouse;
  {???????? 㪠??⥫? ????}
begin
  if IsMouse and not MouseVisible then
    with Reg do begin
      ax := $1;
      Intr($33,Reg);
      MouseVisible := True
    end
end;   {ShowMouse}
{-----------------------}
Procedure HideMouse;
  {?????? 㪠??⥫? ????}
begin
  if IsMouse and MouseVisible then with Reg do
    begin
      ax := $2;
      Intr($33,Reg);
      MouseVisible := False
    end
end;   {HideMouse}
{-----------------------}
Procedure MouseTextCursor(ScrMask,CurMask: Word);
  {??⠭???????? ????? ??? ⥪?⮢??? 㪠??⥫?}
begin
  if IsMouse then with Reg do
    begin
      ax := $A;
      bx := 0;
      cx := ScrMask;
      dx := CurMask;
      Intr($33,Reg)
    end
end;   {MouseTextCursor}
{-----------------------}
Procedure MouseBlink(YUp,YDn: Byte);
  {?????? ?????????? ?????? ?㦭??? ࠧ????}
begin
  if IsMouse then with Reg do
    begin
      ax := $A;
      bx := 1;
      cx := YUp;
      dx := YDn;
      Intr($33,Reg)
    end
end;   {MouseBlink}
{-----------------------}
Procedure MouseGraphCursor(var ScrCurMask;X,Y: Byte);
  {?????? ??? ???????᪮?? 㪠??⥫?}
begin
  if IsMouse then with Reg do
    begin
      ax := $9;
      bx := X;
      cx := Y;
      es := seg(ScrCurMask);
      dx := ofs(ScrCurMask);
      Intr($33,Reg)
    end
end;   {MouseGraphCursor}
{+---------------------------------------------+
 |    ???࠭????/????⠭??????? ?????ﭨ?      |
 +---------------------------------------------+}
Function MouseBuffSize: Word;
  {??????頥? ????? ?????? ??? ???࠭???? ??ࠬ??஢}
begin
  if IsMouse then with Reg do
    begin
      ax := $15;
      bx := 0;
      Intr($33,Reg);
      MouseBuffSize := bx
    end
  else
    MouseBuffSize := 0
end;   {MouseBuffSize}
{-----------------------}
Procedure SaveMouse(var Buff);
  {???࠭??? ? ?????? ⥪?饥 ?????ﭨ? ????}
begin
  if IsMouse then with Reg do
    begin
      ax := $16;
      es := seg(Buff);
      dx := ofs(Buff);
      Intr($33,Reg)
    end
end;   {SaveMouse}
{-----------------------}
Procedure RestoreMouse(var Buff);
  {????⠭???????? ???࠭????? ?????ﭨ? ????}
begin
  if IsMouse then with Reg do
    begin
      ax := $17;
      es := seg(Buff);
      dx := ofs(Buff);
      Intr($33,Reg)
    end
end;   {RestoreMouse}
{+---------------------------------------------+
 |              ???????? ??????????            |
 +---------------------------------------------+}
const
  DoubleChars: Boolean = False;
var
  SecChar: Char;

Procedure SetMouseItem(NItem: Byte; var Items);
  {??⠭???????? ???????? ??? ?롮?? ?????:
   NItem - ???????⢮ ??????⮢;
   Items - array [1..NItem] of MouseItemType;
   ?????? ??⠭???? ?????뢠????}
begin
  if IsMouse then
    begin
      ClearMouseItems;
      GetMem(ItemsList,NItem*SizeOf(MouseItemType));
      Move(Items,ItemsList^,NItem*SizeOf(MouseItemType));
      NMouseItem := NItem
    end
end;   {SetMouseItem}
{---------------------}
Procedure AddMouseItem(Item: MouseItemType);
  {????????? ??? ???? ??????? ??? ?롮?? ?????.
   ?????? ??⠭???? ???࠭?????}
var
  p: PMouseIt;
  k: Byte;
begin
  if IsMouse then
    begin
      k := NMouseItem;
      GetMem(P,(k+1)*SizeOf(MouseItemType));
      Move(ItemsList^,P^,k*SizeOf(MouseItemType));
      Move(Item,P^[k+1],SizeOf(MouseItemType));
      ClearMouseItems;
      NMouseItem := k+1;
      ItemsList := P
    end
end;   {AddMouseItem}
{-----------------------}
Procedure ClearMouseItems;
  {?????뢠?? ࠭?? ??⠭???????? ????????}
begin
  if IsMouse and (NMouseItem <>0) then
    begin
      FreeMem(ItemsList,NMouseItem*SizeOf(MouseItemType));
      NMouseItem := 0
    end
end;   {ClearMouseItem}
{-----------------------}
Procedure GetMouseItem(var NItem: Byte; var Items);
  {??????頥? ??⠭???????? ????????}
begin
  if IsMouse and (NMouseItem<>0) then
    begin
      NItem := NMouseItem;
      Move(ItemsList^,Items,NMouseItem*SizeOf(MouseItemType))
    end
end;   {GetMouseItem}
{-----------------------}
Function KeyOrMousePressed: Boolean;
  {??????頥? TRUE, ?᫨ ?????? ???????
   ?????????? ??? ?????? ????}
var
  b,k: Integer;
  MouseActive: Boolean;
begin
{???砫? ?஢??塞 ??????????}
  if KeyPressed then
    KeyOrMousePressed := True
{?᫨ ?? ?????? ??????? ???????, ?஢??塞 ????⨥ ?????? ????}
  else with Reg do
    begin
      ax := $3;
      Intr($33,Reg);
      if (bx<>0) and (NMouseItem<>0) then
{??, ?????? ??????.
 ?࣠???㥬 横? ?஢?ન ?? ?ᥬ ??????⠬}
        begin
          MouseActive := False;
          for k := 1 to NMouseItem do
          if not MouseActive then
            with ItemsList^[k] do
	   begin
              case Butt of
                LeftButton  : b :=bx and LeftButton;
                RightButton : b :=bx and RightButton;
                CenterButton: b :=bx and CenterButton;
                AnyButton   : b := bx
              else
                b := 0;
              end;  {case}
              MouseActive := (b<>0) and
                MouseIn(MouseGraphCooX(X1),MouseGraphCooY(Y1),
                        MouseGraphCooX(X2),MouseGraphCooY(Y2))
            end;  {for,if}
          KeyOrMousePressed := MouseActive
        end  {if (bx<>0) and...}
{?᫨ ?? ??⨢?? ?????????? ??? ?? ???࠭ ???????, ??????頥? False}
      else  {bx=0 ??? NMouseItem=0}
        KeyOrMousePressed := False
    end {with Reg}
end;   {KeyOrMousePressed}
{-----------------------}
Function ReadKeyOrMouse: Char;
  {??????頥? ᨬ??? ????⮩ ??????? ??? ???࠭???? ????????}
var
  k: Byte;
  b,bb: Word;
  MouseActive: Boolean;
label
  loop;
begin
{???砫? ?஢??塞 ????⨥ ???????}
loop:
  if not IsMouse or KeyPressed then
    ReadKeyOrMouse := ReadKey
{?????? ?஢?ਬ ???????? ??㦥???? ???????}
  else if DoubleChars then
    begin
      DoubleChars := False;
      ReadKeyOrMouse := SecChar
    end
{?஢??塞 ????室?????? ????஫?
 ??????⮢ ??࠭? ??? ?????樨 ??????????}
  else if NMouseItem<>0 then with Reg do
    begin  {??, ?㦭? ?஢?ઠ}
      MouseActive := False;
{????஫??㥬 ?롮? ????? ?????? ?? ??????⮢}
      ax := $3;
      Intr($33,Reg); {????砥? ?????? ??????}
      bb := bx;      {?????????? ??? ? bb}
      if bb<>0 then  {?᫨ ?????? ?? ??????, ?? ?࣠???㥬 ?஢???? ???? 
                     ??????⮢ ?? ?㦭??? (ActiveMouse ?⠭?? True)}
      for k := 1 to NMouseItem do
        if not MouseActive then
          with ItemsList^[k] do begin
            case Butt of
              LeftButton  : b :=bb and LeftButton;
              RightButton : b :=bb and RightButton;
              CenterButton: b :=bb and CenterButton;
              AnyButton   : b := bb;
            else
              b := 0;
            end;
            if (b<>0) and MouseIn(
                   MouseGraphCooX(X1),MouseGraphCooY(Y1),
                   MouseGraphCooX(X2),MouseGraphCooY(Y2)) then
              begin              {?????? ?⬥祭??? ???????}
                MouseActive := True;
                ReadKeyOrMouse := Char(Lo(Key));
                if Lo(Key)=0 then
                  begin          {??????????㦥???? ???????}
                    DoubleChars := True;
                    SecChar := chr(Hi(Key))
                  end
              end
          end;  {for ... if not MouseActive}
{?᫨ ???? ?? ?⬥⨫? ???????, ??????塞 ? ??砫?}
      if not MouseActive then
        goto loop
    end {if NMouseItem<>0}
{?᫨ ?? ??⠭????? ?? ???? ??????? ??? ????,
 ???? ??????? ?? ???????}
  else
    ReadKeyOrMouse := ReadKey
end;   {ReadKeyOrMouse}
{+---------------------------------------------+
 |        ??ࠡ?⪠ ᮡ?⨩ ?? ????            |
 +---------------------------------------------+}
const
  OldUserProc: Pointer = NIL;
var
  UserProc: MouseHandlerType absolute OldUserProc;
  OldAX: Word;

Procedure MouseHandler; Far; Assembler;
  {??ᥬ??????? ?????䥩? ??? ?맮?? ??ࠡ??稪?}
ASM
{???࠭塞 ? ?⥪? ॣ?????}
  push bp
  push ds
  push es
  push ax
  mov  ax,SEG @DATA
  mov  ds,ax
  pop  ax
  mov  OldAX,ax
{?஢??塞 ?᫮??? ?맮??}
  mov  ax,Word ptr [OldUserProc]   {ax = ᥣ???⠤????}
  or   ax,Word ptr [OldUserProc+2] {????? = NIL?}
  jz   @                       	   {?? - ?? ???뢠??}
{??⮢?? ?맮? ???楤??? ???짮??⥫?}
  mov  ax,OldAX
  push ax  			{Mask := ax}
  push bx  			{Buttons := bx}
  push cx  			{X := cx}
  push dx  			{Y := dx}
  push di  			{DX := di}
  push si  			{DY := si}
{???뢠?? ???楤??? ???짮??⥫?}
  call [UserProc]
{??室 ?? ???楤???: ????⠭???????? ॣ?????}
@:  pop  es
  pop  ds
  pop  bp
  ret  far
end;  {MouseHandler}
{---------------------}
Procedure SetMouseHandler(Mask: Word; Proc: MouseHandlerType);
  {??⠭???????? ????? ? ?᫮??? ?맮?? ??ࠡ??稪?}
begin
  if IsMouse then with Reg do
    begin
      UserProc := Proc;
      ax := $0C;
      cx := Mask;
      es := seg(MouseHandler);
      dx := ofs(MouseHandler);
      Intr($33,Reg)
    end
end;   {SetMouseHandler}
{-----------------------}
Procedure ChangeMouseHandler(Mask: Word;
	Proc: MouseHandlerType;	var OldMask: Word; var OldProc: Pointer);
  {???????? ?????? ??ࠡ??稪 ?????}
begin
  if IsMouse then with Reg do
    begin
      OldProc := OldUserProc;
      ax := $14;
      cx := Mask;
      es := seg(MouseHandler);
      dx := ofs(MouseHandler);
      Intr($33,Reg);
      OldMask := cx
    end
end;   {ChangeMouseHandler}
{------------------------}
Procedure ClearMouseHandler;
  {??????? ??ࠡ??稪 ᮡ?⨩}
begin
  if IsMouse then with Reg do
    begin
      ax := $0C;
      cx := 0;
      es := 0;
      dx := 0;
      Intr($33,Reg)
    end;
end;   {ClearMouseHandler}
{==============} end. {F_Mouse} {===============}
