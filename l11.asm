;z=1/(a*a+b*b-5)+2/(a*a-b*b+4)

assume cs:code, ds:data

data segment
a db 2
b db 3
z dw ?
data ends

code segment
start:
mov ax, data
mov ds, ax

; a*a
mov al, a
imul a ; ax = a*a (al*a)
mov bx, ax ; bx = a*a 

; b*b 
mov al, b 
imul b ; ax = b*b 

add bx, ax ; bx = a*a + b*b 
sub bx, 5 ; bx = a*a + b*b - 5
mov ax, 1
mov dx, 0 ; dx:ax = 1
idiv bx ; ax = catul, dx = restul => ax = 1/(a*a + b*b -5) 
mov cx, ax
 
mov al, a 
imul a ; ax = a*a 
mov bx, ax 
mov al, b 
imul b ; ax = b*b 
sub bx, ax ; bx = a*a - b*b 
add bx, 4 ; bx = a*a - b*b + 4
mov ax, 2
mov dx, 0 ; dx:ax = 2
idiv bx ; dx = restul, ax = 2/(a*a - b*b +4)
add ax, cx
mov z, ax 

mov ax, 4c00h
int 21h
code ends
end start 