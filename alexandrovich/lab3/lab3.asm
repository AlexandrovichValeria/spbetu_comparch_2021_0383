AStack SEGMENT  STACK
    DW 12 DUP(?)
AStack  ENDS
;������ ���������
DATA      SEGMENT
;��������� �������� ������
a      DW    0
b      DW    0
i      DW    0
k      DW    0
i1     DW    0
i2     DW    0

DATA      ENDS

; ��� ���������
CODE      SEGMENT
      ASSUME CS:CODE, DS:DATA, SS:AStack
	  
; �������� ���������
Main      PROC  FAR
      push  DS
      sub   AX,AX
      push  AX
      mov   AX,DATA
      mov   DS,AX
	  mov   CX, 0

	  mov a, 1
      mov b, 2
      mov i, 2
      mov k, 1
	  
	  ;���������� f1
	  mov cx, i
	  mov ax, cx
	  shl cx, 1
	  mov bx, b    ;
	  cmp a, bx    ; ��������� a � b
	  jle f1second
		neg cx
		add cx, 15
		jmp f1final
	  f1second:
		add cx, ax
		add cx, 4
	  f1final:
	  mov i1, cx
	  
	  ;���������� f2
	  mov cx, i
	  shl cx, 1
	  mov ax, cx
	  shl cx, 1
	  cmp a, bx
	  jle f2second
		add cx, 3
		neg cx
		jmp f2final
	  f2second:       
	    add cx, ax
		add cx, -10
	  f2final:
	  mov i2, cx
	  
	  ;������� res
	  mov bx, k
	  cmp bx, 0
	  jne resSecond
	    mov bx, i1
		cmp bx, i2
		jl max1
		  mov cx, i2
		  jmp MainFinal
		max1:
		  mov cx, bx
		  jmp MainFinal
	  resSecond:
	    mov bx, i1
		cmp bx, i2
		jl max2
		  mov cx, bx
		  jmp MainFinal
		max2:
		  mov cx, i2
		  jmp MainFinal
	  MainFinal:           ; � cx ����� �������� res
      ret
Main      ENDP
CODE      ENDS
END Main 