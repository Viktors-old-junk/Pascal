 uses Graph,Sgraph;

var
  grDriver: Integer;
  grMode: Integer;
  ErrCode: Integer;


  procedure testgraph;
  var
  tx,ty :integer;
  strr :string[8];
  begin

  for tx := getmaxcolor+1 downto  0  do
  begin
  setfillstyle(1,tx);
  bar(0,0,round((getmaxx+1)/(getmaxcolor+1))*(tx+1),round((getmaxy+1)/(getmaxcolor+1))*tx);
  end;

  ty := 30;
  for tx := 0 to getmaxcolor+1 do
  begin
  ty := ty + 10;
  if ty = 200 then ty := 10;

  str(tx,strr);
  setcolor(tx+100);
  outtextxy(round((getmaxx+1)/(getmaxcolor+1))*tx+1,ty,strr);
  end;
  end;

  procedure linet(x1,x2,x3,xc1,yc1,xc2,yc2 :integer);
  begin
  setcolor(x1);
  RECTANGLE(XC1-1,YC1-1,XC2-1,YC2-1);
  setcolor(x2);
  RECTANGLE(XC1,YC1,XC2,YC2);

  setcolor(x3);
  RECTANGLE(XC1+1,YC1+1,XC2+1,YC2+1);
  end;

begin
grDriver := 9;
{InitGraph(grDriver, grMode,'');}

  initsgraph('640x480');

{  testgraph;}
    Readln;
    CloseGraph;
end.
