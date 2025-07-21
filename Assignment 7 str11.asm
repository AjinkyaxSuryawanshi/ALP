data segment public
str3 db 25 dup("$")
data ends			;end of data segment

prompt macro msg		;printing msgs
        mov ah,09h
        lea dx,msg
        int 21h
endm			;end of macro
extrn msg2 :byte		
extrn msg3:byte
extrn msg4 :byte		
extrn msg5:byte
extrn msg6:byte
extrn msg7:byte
extrn str2 :byte		
extrn str1:byte
code segment
assume cs:code,ds:data
start:mov ax,data
      mov ds,ax
      mov es,ax
  		

public cont
cont proc far
prompt msg6
prompt msg2
mov ah,0ah
lea dx, str1   ; taking first string
int 21h

prompt msg3
mov ah,0ah
lea dx, str2 ; taking second string
int 21h

lea di,str3  ;pointing the destination as new string
lea si,str1+2   
mov cl,str1+1
repz movsb   ;moving first string in third string

lea si,str2+2  ;only set the sourse index si to str2 and di will be unchanged
mov cl,str2+1 ;taking length of second string
repz movsb  ;moving from string 2 to str3
prompt msg7
prompt str3  
ret
cont endp   


       mov ah,4ch
       int 21h

code ends			;end of code segment
end start

        
