assume cs:code, ds:data
; z=a+b*b-(2/(b*b)/(1+(2/(b*b)))

data segment
a db 2
b db 1
z dw ?
data ends

code segment
start:
mov ax,data
mov ds,ax
mov al, b
imul b ; ax = b*b 
mov bx, ax ; bx = b*b
mov ax, 2
mov dx, 0
idiv bx ; ax = 2/(b*b) 
mov bx, ax ; bx = 2/(b*b) 
add bx, 1 ; bx = 1 + 2/(b*b) 
mov dx, 0
idiv bx ; ax = (2/(b*b)) / (1+(2/(b*b)))
mov bx, ax 
mov al, b 
imul b ; ax = b*b 
sub ax, bx ; ax = b*b - (2/(b*b)) / (1+(2/(b*b)))
add ax, a
mov z, ax 

mov ax, 4c00h
int 21h
code ends
end start