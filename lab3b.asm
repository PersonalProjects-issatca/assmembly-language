; set B 1.

ASSUME cs:text_,ds:data_

data_ SEGMENT
s dw -22,145,-48,127
ls equ ($-s)/2
d db ls dup(0) ; d = 3, 3, 5, 7 
copie dw ?

data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax

mov si,0; parcurgerea lui s
mov di,0; parcurgerea lui d 
mov cx,ls;
repeta:
	mov dl,0; valoarea pe care o calculam
	mov copie,cx; salvare cx pentru a-l folosi la alta bucla 
	mov cx,15; cele 15 rotiri ramase pt contorizarea valorii dorite
	mov ax,s[si] ; elementul curent
	clc; cf = 0
	rcl ax,1 ; se stocheaza in cf val bitului de semn
	jc nr_negativ
	jnc nr_pozitiv
	nr_pozitiv:
		repetap:
			rcl ax,1
			jc eticheta_thenp
			jnc eticheta_elsep
			eticheta_thenp:
				add dl,1
			eticheta_elsep:
		loop repetap
		jmp endpb
	nr_negativ:
		repetan:
			rcl ax,1
			jc eticheta_elsen
			jnc eticheta_thenn
			eticheta_thenn:
				add dl,1
			eticheta_elsen:
		loop repetan
	endpb:
	mov d[di],dl
	add si,2
	add di,1
	mov cx,copie
loop repeta
		

mov ax, 4c00h
int 21h
text_ ENDS

END start