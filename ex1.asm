assume cs:text, ds:data

data segment
a db 5
b db 4
rez dw ?

data ends

text segment
start:
mov ax, data
mov ds, ax

;z=1/(a*a+b*b-5)+2/(a*a-b*b+4)

;1/(a*a+b*b-5)
mov al, a ;al=a
mul a ;ax=a*a
mov bx, ax ;bx = a*a

mov al, b ;al=b
mul b ; ax =b*b

add ax, bx ;ax=a*a+b*b
sub ax, 5 ;ax = a*a+b*b-5
mov bx, ax ;bx = a*a+b*b-5

mov ax, 1 
mov dx, 0
div bx ;ax - catul lui 1/(a*a+b*b-5)
mov cx, ax ;cx = 1/(a*a+b*b-5)

;2/(a*a-b*b+4)
mov al, a
mul a ;ax = a*a
mov bx, ax ;bx=a*a

mov al, b
mul b ;ax = b*b

sub bx, ax ;bx = a*a - b*b
add bx, 4 ;bx = a*a - b*b + 4

mov ax, 2
mov dx, 0
div bx ; ax = 2/(a*a-b*b+4)

add ax, cx ; ax = z
mov rez, ax ;rez=z

mov ax, 4c00h
int 21h
text ends
