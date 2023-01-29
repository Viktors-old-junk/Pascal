Program ddd;
uses graph, sgraph, interobj, crt;
var
Bevel1,bevel2,bevel3 :tbevel;
panel1,panel2,panel3 :tpanel;
button1,button2,button3 :tbutton;
ch :char;

label
b1,b2,b3,dend;

procedure redraw;
begin
panel1.draw;
Panel2.draw;
panel3.draw;

bevel1.draw;
bevel2.draw;
bevel3.draw;

button1.draw;
button2.draw;
button3.draw;
end;

procedure SelColor1;
begin
Panel2.Setcolors(random(255),random(255),random(255),random(255));
redraw;
end;

Procedure SelColor2;
begin
Button1.Setcolors(random(255),random(255),random(255),random(255));
redraw;
end;

begin
randomize;
initsgraph('800x600');
Bevel1.create(42,54,757,557,'RAISED');
Bevel2.create(62,72,737,537,'LOWERED');
Bevel3.create(82,92,717,517,'RAISED');

panel1.create(2,2,797,697,'LOWERED','');
panel2.create(22,22,777,42,'LOWERED','This is DEMO program INTEROBJ Module');
panel3.create(22,44,777,577,'RAISED','');

button1.create(102,112,697,202,'Color 1',True);
button2.create(102,212,697,302,'Color 2',False);
button3.create(102,312,697,402,'Exit',False);

redraw;

b1:
Button1.select;
ch := Button1.use;
case ch of
#13: begin selcolor1; goto b1 end;
#32: begin selcolor1; goto b1 end;
 #9: goto b2;
#72: goto b3;
#80: goto b2;
end;

goto b1;

b2:
Button2.select;
ch := Button2.use;
case ch of
#13: begin selcolor2; goto b2 end;
#32: begin selcolor2; goto b2 end;
 #9: goto b3;
#72: goto b1;
#80: goto b3;
end;

goto b2;

b3:
Button3.select;
ch := Button3.use;
case ch of
#13: exit;
#32: exit;
 #9: goto b1;
#72: goto b2;
#80: goto b1;
end;


dend:
{readkey;}
closegraph;
end.