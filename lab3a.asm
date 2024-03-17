;set A 1.

ASSUME cs:text_,ds:data_

data_ SEGMENT
s db 1,2,3,4
ls equ $-s 
d dw ls dup(0); d = 1*2,2*3,3*4
data_ ENDS

text_ SEGMENT

start:
mov ax,data_
mov ds,ax

mov si,offset s ; parcurgerea lui s
mov di, offset d ; parcurgerea lui d 
cld ; directia de parcurgere ->
mov cx, ls-1
lodsb ; al=s[si],si+=1
mov bl,al ; bl = s[0]
repeta:
	lodsb ; al=s[si],si+=1
	mov dl,al; dl = s[si+1], pregatire pentru urmatoarea parcurgere
	imul bl ; ax=s[si]*s[si+1]
	mov bl,dl; bl=s[si+1] la urm parcurgere se inmulteste cu succesorul sau  
	stosw ; d[di]=ax, di+=2
loop repeta

mov ax, 4c00h
int 21h
	
text_ ENDS
END start
