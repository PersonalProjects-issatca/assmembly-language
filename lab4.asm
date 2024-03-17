assume cs:code, ds:data

;1. Se da un sir de octeti in segmentul 
;de date. Sa se afiseze elementele acestui sir la iesirea 
;standard (ecran) in baza 2.

data segment

sir db 1,2,3,4,5
ls equ $-sir ;lungime sir
ln db 10, 13, '$' ;linie noua
copie dw ?
data ends 

code segment

start:
mov ax, data
mov ds, ax

;afisare
mov cx, ls ;contor sir
mov si, offset sir ;indice sir

repeta:
	mov copie, cx ;cx se va modifica
	mov cx, 8
	clc 
	afisare:
		shl sir[si], 1 ;in cf bitul rotit
		jc cf1 ;cf = 1
		jnc cf0 ;cf = 0
		cf1:
			mov dl, 1
			add dl, '0'
			mov ah, 02h
			int 21h
			jmp afis
		cf0:
			mov dl, 0
			add dl, '0'
			mov ah, 02h
			int 21h
		afis:
	loop afisare
	;afisare linie noua
	mov dx, offset ln
	mov ah, 09h
	int 21h
	mov cx, copie
	inc si
loop repeta

mov ax, 4c00h
int 21h
code ends

end start
