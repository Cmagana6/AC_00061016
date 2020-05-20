org 	100h

;Carlos Roberto Magaña 00061016
section .text

	call 	texto	
	call 	cursor
	call 	frase1
	call 	frase2
	call 	frase3
	call	waitkb

	int 	20h

texto:	
    mov 	ah, 00h
	mov	    al, 02h
	int 	10h
	ret

cursor: 
    mov	    ah, 01h
	mov 	ch, 59H
	mov 	cl, 3CH;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

waitkb: 
    mov 	ax, 0000h
	int 	16h
	ret

m_cursr:
    mov 	ah, 02h
	mov 	dx, di 	;columna
	mov 	dh, 2d 	;fila
	mov 	bh, 0h
	int 	10h
	ret


m_cursr2:
    mov 	ah, 02h
	mov 	dx, di  
	mov 	dh, 12d 
	mov 	bh, 0h
	int 	10h
	ret


m_cursr3:
    mov 	ah, 02h
	mov 	dx, di  
	mov 	dh, 24d 
	mov 	bh, 0h
	int 	10h
	ret

frase1:	
        mov 	di, 2d
escribo:	
    mov 	cl, [msg+di-2d]
	call    m_cursr
	call 	w_char
	inc 	di
	cmp 	di, len
	jb		escribo
	ret

frase2:	
        mov 	di, 10d
escribo2:	
    mov 	cl, [msg2+di-10d]
	call    m_cursr2
	call 	w_char
	inc	    di
	cmp 	di, len2
	jb	escribo2
	ret

frase3:	
        mov 	di, 16d
escribo3:	
    mov 	cl, [msg3+di-16d]
	call    m_cursr3
	call 	w_char
	inc	    di
	cmp 	di, len3
	jb		escribo3
	ret

section .data
msg		db 	"Hoy voy a beber"
len 	equ	$-msg+2

msg2	db 	"y se que voy a enloquecer"
len2	equ	$-msg2+10

msg3	db 	"y te llamare"
len3 	equ	$-msg3+16
