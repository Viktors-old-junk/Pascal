uses crt;
var
B:String[2];
i:Integer;
TF:Text;
begin
Assign(TF,'COM3');
Rewrite(TF);
Delay(10000);

repeat
WriteLn(TF,'ATZ');
delay(65535);
read(TF,b);
WriteLn(b);
delay(65535);
WriteLn(TF,'ATH1');
delay(65535);
WriteLn(TF,'ATDT100');
delay(65535);
delay(65535);
delay(65535);
delay(65535);
delay(65535);
WriteLn(TF,'ATH0');
delay(65535);
until keypressed;

close(tf);
end.

