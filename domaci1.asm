;org 100h ide ili data segment ili ovo
 
data SEGMENT
    num1 dw 9
    num2 dw 9 ;igrati se s ovim brojevima radi testiranja
    
    data ENDS

stek SEGMENT STACK
    stek ENDS

code SEGMENT
    
    ASSUME cs:code, ss:stek, ds:data
          
    ;Definisemo vrednosti koje sabiramo i stavljamo ih na registre bx i cx
    
    mov bx,num1
    mov cx,num2
    
    add bx,num2  ;ovde vrsimo sabiranje vrednosti s bx (num1) s num2 i smestamo rezultat u bx
    
    mov cx,bx ;sada pomeramo bx na registar cx nakon cega cistimo bx registar
    
    xor bx,bx ;cistimo, tj. anuliramo registar bx
    
    mov ax,cx ;dalje pomeramo rezultat na ax
    
    ;Dalje bismo trebali da hendlujemo "cuvanje" parnosti, predstavlja glani deo ovog zadatka
    
    and cx,1 ;ovim proveravamo parnost naseg broja (ako je cx=1 i 1=1 onda je T, u svakom drugom slucaju je ne T) 
                                                                                                                 
    jz parnost ;koristeci jz, tj. jump(if)zero, smestamo jedinicu u si registar ukoliko ne bude poslednji bit cx registra 1
    
    jmp kraj  ;vracamo se na kraj
    
    
    parnost: mov si,1
    
    kraj: jmp kraj
          
                 
 code ENDS  

END  ; nisam siguran da li ima potrebe za ovim delom 

    
    