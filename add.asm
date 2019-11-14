.model small
.stack 100h
.data
num1 dw 1111h, 1111h
num2 dw 1111h, 1111h
result dw 2 dup(?)
.code
.startup

  mov ax, num1[0]
  add ax, num2[0]
  mov result[0], ax
  
  mov ax, num1[1]
  adc ax, num2[1]
  mov result[1], ax
  
  mov bl, 00h
  adc bl, 0
  mov dl, bl
  cmp dl, 0
  je L
  add dl, 30h
  mov ah, 02
  int 21h
  
 L: mov bx, result[1]
  mov cx, 4
  output1: rol bx, 4
        mov dx, bx
        and dx, 000fh
        cmp dl, 9
        jbe L1
        add dl, 7h
        L1:add dl, 30h
        mov ah, 02
        int 21h
        loop output1
        
  mov bx, result[0]
  mov cx, 4  
  output2: rol bx, 4
        mov dx, bx
        and dx, 000fh
        cmp dl, 9
        jbe L2
        add dl, 7h
        L2:add dl, 30h
        mov ah, 02
        int 21h
        loop output2
  
  
.exit
end
