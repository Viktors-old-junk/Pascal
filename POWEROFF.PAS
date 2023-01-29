Program PowerOff;
Begin
asm
mov       ax,05301H
mov       bx,00000H
int       015h
mov       ax,05307h
mov       bx,00001h
mov       cx,00003h
int       015h
mov       ax,05304h
mov       bx,00000h
int       015h
ret
end;
end.