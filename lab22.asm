assume cs:code, ds:data

data segment
	a dw 0001101001010110b
	b dw 0
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov ax, a
	and ax, 0000000000001111b
	
	mov cl, al ; nr de poz pt rotire
	mov ax, a ; nr
	ror ax, cl ; rotirile specificate
	mov b, ax ; rezultatul

	mov ax, 4c00h
	int 21h
code ends
end start
