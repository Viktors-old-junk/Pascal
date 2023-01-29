unit interobj;
interface
uses graph,crt;
type

TInterface = object
private
x1,y1,x2,y2,color1,color2,color3,colortext :integer;
public
constructor create(left,top,rigth,down :integer);
procedure draw; virtual;
procedure hide; virtual;
procedure setcolors(col1,col2,col3,colbk,coltext :integer);
function getcolors(num: byte) :integer;
end;

TBevel = object(TInterface)
private
Dcol1,Dcol3,Doldcol :integer;
Dstyle :string;
ONDraw :boolean;
styleb :string[8];
public
constructor create(left,top,rigth,down :integer; Style :string);
procedure draw; Virtual;
procedure hide; Virtual;
procedure setcolors(col1,col3 :integer);
function getcolors(num: byte) :integer;
procedure setcoords(left,top,rigth,down :integer);
function getcoords(num :byte) :integer;
procedure setstyle(style :string);
function getstyle :string;
end;

TPanel = object(TBevel)
private
Dcol2,Dtextcol,mX,mY :integer;
DText :string;
Public
constructor create(left,top,rigth,down :integer; Style,Text :string);
procedure draw; Virtual;
procedure hide; Virtual;
procedure setcolors(col1,col2,col3,textcol :integer);
function getcolors(num: byte) :integer;
procedure setcoords(left,top,rigth,down :integer);
function getcoords(num :byte) :integer;
procedure setstyle(style :string);
function getstyle :string;
Procedure Settext(text :string);
function gettext :string;
end;

TButton = object(TPanel)
private
Dselect,DPress :boolean;
points :array[1..6] of pointtype;
public
Timepress :word;
constructor create(left,top,rigth,down :integer; Text :string; selectb :boolean);
procedure draw; Virtual;
procedure hide; Virtual;
procedure setcolors(col1,col2,col3,textcol :integer);
function getcolors(num: byte) :integer;
procedure setcoords(left,top,rigth,down :integer);
function getcoords(num :byte) :integer;
Procedure Settext(text :string);
function gettext :string;
Procedure Select;
Procedure Unselect;
Procedure Press;
Procedure Unpress;
Function Getpress :boolean;
Function Getselect :boolean;
Procedure SetTimePress(timep :word);
Function GetTimePress :word;
function Use :char;
end;

implementation

constructor Tinterface.create;
begin
x1 := left;
y1 := top;
x2 := rigth;
y2 := down;
color1 :=15;
color2 :=7;
color3 :=8;
colortext := 15;
end;

procedure Tinterface.draw;
begin
end;

procedure Tinterface.hide;
begin
end;

procedure Tinterface.setcolors;
begin
color1 := col1;
color2 := col2;
color3 := col3;
coltext := colortext;
end;

function Tinterface.getcolors;
begin
case num of
1 :  getcolors := color1;
2 :  getcolors := color2;
3 :  getcolors := color3;
4 :  getcolors := colortext;
end;
end;

constructor Tbevel.create;
var
xn :byte;
begin
inherited create(left,top,rigth,down);
styleb := '';

for xn := 1 to length(style) do
styleb := styleb + upcase(style[xn]);

If styleb = 'RAISED' then Dstyle := 'RAISED';
If styleb = 'LOWERED' then Dstyle := 'LOWERED';
If (styleb <> 'LOWERED') and (styleb <> 'RAISED') then Dstyle := 'RAISED';

Dcol1 := color1;
Dcol3 := color3;
ondraw := false;
end;

procedure tbevel.draw;
begin
ondraw := true;
Doldcol := getpixel(x1,y1);

If Dstyle = 'RAISED' then
begin
setcolor(Dcol3);
line(x2,y2,x1,y2);
line(x2,y2,x2,y1);
setcolor(Dcol1);
line(x1,y1,x2,y1);
line(x1,y1,x1,y2);
end;

If Dstyle = 'LOWERED' then
begin
setcolor(Dcol1);
line(x2,y2,x1,y2);
line(x2,y2,x2,y1);
setcolor(Dcol3);
line(x1,y1,x2,y1);
line(x1,y1,x1,y2);
end;
end;

Procedure TBevel.hide;
begin
Ondraw := false;
setcolor(Doldcol);
rectangle(x1,y1,x2,y2);
end;

Procedure TBevel.Setcolors;
begin
Dcol1 := col1;
Dcol3 := col3;
If ONDraw =True then
begin
hide;
draw;
end;
end;

Function TBevel.Getcolors;
begin
case num of
1 :  getcolors := Dcol1;
2 :  getcolors := Dcol3;
end;
end;

Procedure TBevel.Setcoords;
begin
if ondraw = true then
begin
hide;
x1 := left;
y1 := top;
x2 := rigth;
y2 := down;
draw;
end
else
begin
x1 := left;
y1 := top;
x2 := rigth;
y2 := down;
end;
end;

Function TBevel.Getcoords;
begin
case num of
1: Getcoords := x1;
2: Getcoords := y1;
3: Getcoords := x2;
4: Getcoords := y2;
end;
end;

Procedure TBevel.Setstyle;
var
xn :byte;
begin
styleb := '';

for xn:= 1 to length(style) do
styleb := styleb + upcase(style[xn]);

If styleb = 'LOWERED' then
begin
Dstyle := styleb;
If ONDraw =True then
begin
hide;
draw;
end;
exit;
end;

If styleb = 'RAISED' then
begin
Dstyle := styleb;
If ONDraw =True then
begin
hide;
draw;
end;
exit;
end;
end;

Function TBevel.Getstyle;
begin
getstyle := Dstyle;
end;

Constructor TPanel.create;
begin
inherited create(left,top,rigth,down,style);
Dcol2 :=color2;
Dtextcol :=ColorText;
Dtext :=text;
If styleb = 'NON' then Dstyle := 'NON';
end;

Procedure TPanel.Draw;
begin
inherited draw;
Doldcol := getpixel(x1+2,y1+2);
setfillstyle(1,Dcol2);
bar(x1+1,y1+1,x2-1,y2-1);
mx := getmaxx;
my := getmaxy;
setviewport(x1+1,y1+1,x2-1,y2-1,true);
setcolor(dtextcol);
outtextxy((x2-x1-textwidth(dtext))div 2,(y2-y1-textheight(dtext))div 2,dtext);
setviewport(0,0,mx,my,true);
end;

Procedure TPanel.hide;
begin
Inherited hide;
setfillstyle(1,Doldcol);
bar(x1+1,y1+1,x2-1,y2-1);
end;

Procedure TPanel.setcolors;
begin
dcol2 :=col2;
dtextcol :=textcol;
inherited setcolors(col1,col3);
end;

Function TPanel.Getcolors;
begin
case num of
1: getcolors := Dcol1;
2: getcolors := Dcol2;
3: getcolors := Dcol3;
4: getcolors := dtextcol;
end;
end;

Procedure TPanel.Setcoords;
begin
inherited setcoords(left,top,rigth,down);
end;

Function TPanel.Getcoords;
begin
inherited getcoords(num);
end;

Procedure TPanel.setstyle;
begin
inherited setstyle(style);
if styleb = 'NON' then
begin
dstyle := 'styleb';
If ONDraw =True then
begin
hide;
draw;
end;
end;

end;

Function TPanel.Getstyle;
begin
inherited getstyle
end;

Procedure TPanel.Settext;
begin
Dtext := text;
If ONDraw =True then
begin
hide;
draw;
end;
end;

Function TPanel.Gettext;
begin
gettext := dtext;
end;

Constructor TButton.create;
begin
x1 := left;
y1 := top;
x2 := rigth;
y2 := down;
Dcol1 :=15;
Dcol2 :=7;
Dcol3 :=8;
Dtextcol := 15;
DText := text;
DSelect := selectb;
DPress := false;
TimePRESS := 5000;
end;

Procedure TButton.draw;
begin
Doldcol := getpixel(x1+2,y1+2);
ondraw := true;
setfillstyle(1,Dcol2);
bar(x1,y1,x2,y2);

setcolor(Dcol1);
rectangle(x1,y1,x2,y2);

points[1].x := x1+2;
points[1].y := y2-2;
points[2].x := x1+2;
points[2].y := y1+2;
points[3].x := x2-2;
points[3].y := y1+2;
points[4].x := x2-3;
points[4].y := y1+3;
points[5].x := x1+3;
points[5].y := y1+3;
points[6].x := x1+3;
points[6].y := y2-3;
setcolor(Dcol1);
fillpoly(6,points);

points[1].x := x2-2;
points[1].y := y1+3;
points[2].x := x2-2;
points[2].y := y2-2;
points[3].x := x1+3;
points[3].y := y2-2;
points[4].x := x1+4;
points[4].y := y2-3;
points[5].x := x2-3;
points[5].y := y2-3;
points[6].x := x2-3;
points[6].y := y1+3;
setcolor(Dcol3);
fillpoly(6,points);

setfillstyle(1,Dcol2);
bar(x1+4,y1+4,x2-4,y2-4);
mx := getmaxx;
my := getmaxy;
setviewport(x1+4,y1+4,x2-4,y2-4,true);
setcolor(dtextcol);
outtextxy((x2-x1-textwidth(dtext)-8)div 2,(y2-y1-textheight(dtext)-8)div 2,dtext);
setviewport(0,0,mx,my,true);

if DSelect = true then
begin
setcolor(0);
rectangle(x1+1,y1+1,x2-1,y2-1);
rectangle(x1+5,y1+5,x2-5,y2-5);
end;

end;

procedure TButton.hide;
begin
inherited hide;
end;

Procedure TButton.setcolors;
Begin
Inherited Setcolors(col1,col2,col3,textcol);
end;

Function TButton.getcolors;
begin
inherited getcolors(num);
end;

Procedure TButton.Setcoords;
begin
inherited setcoords(left,top,rigth,down);
end;

Function TButton.Getcoords;
begin
inherited getcolors(num);
end;

Procedure TButton.settext;
begin
inherited settext(text);
end;

Function TButton.gettext;
begin
inherited gettext;
end;

Procedure TButton.select;
begin
setcolor(0);
rectangle(x1+1,y1+1,x2-1,y2-1);
rectangle(x1+5,y1+5,x2-5,y2-5);
end;

Procedure TButton.unselect;
begin
setcolor(dcol2);
rectangle(x1+1,y1+1,x2-1,y2-1);
rectangle(x1+5,y1+5,x2-5,y2-5);
end;

Procedure TButton.Press;
begin
points[1].x := x1+2;
points[1].y := y2-2;
points[2].x := x1+2;
points[2].y := y1+2;
points[3].x := x2-2;
points[3].y := y1+2;
points[4].x := x2-3;
points[4].y := y1+3;
points[5].x := x1+3;
points[5].y := y1+3;
points[6].x := x1+3;
points[6].y := y2-3;

setcolor(Dcol3);
fillpoly(6,points);
DPress := true;
end;

Procedure TButton.unpress;
begin
points[1].x := x1+2;
points[1].y := y2-2;
points[2].x := x1+2;
points[2].y := y1+2;
points[3].x := x2-2;
points[3].y := y1+2;
points[4].x := x2-3;
points[4].y := y1+3;
points[5].x := x1+3;
points[5].y := y1+3;
points[6].x := x1+3;
points[6].y := y2-3;

setcolor(Dcol1);
fillpoly(6,points);
DPress := false;
end;

Function TButton.Getpress;
begin
Getpress := DPress;
end;

Function TButton.Getselect;
begin
Getselect := DSelect;
end;

Function TButton.use;
var
ch :char;
begin
if dselect = false then
select;

repeat
delay(100);
ch := readkey;
until (ch=#13) or (ch=#32) or (ch=#9) or (ch=#72) or (ch=#75) or (ch=#77) or (ch=#80);
if (ch = #13) or (ch = #32) then
begin
press;
delay(Timepress div 4);
delay(Timepress div 4);
delay(Timepress div 4);
delay(Timepress div 4);
unpress;
use := ch;
end;
if (ch=#9) or (ch=#72) or (ch=#75) or (ch=#77) or (ch=#80) then unselect;

end;

procedure tbutton.settimepress;
begin
timepress := timep;
end;

function tbutton.gettimepress;
begin
gettimepress := timepress;
end;
end.
