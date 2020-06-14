org 	100h

<<<<<<< HEAD
=======
;Carlos Roberto Magaña 00061016
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde
section .text

	call 	texto	
	call 	cursor
<<<<<<< HEAD
	call 	phrase
	call 	phrase2
	call 	phrase3
	call	kbwait
=======
	call 	frase1
	call 	frase2
	call 	frase3
	call	waitkb
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde

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

<<<<<<< HEAD
kbwait: 
=======
waitkb: 
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde
    mov 	ax, 0000h
	int 	16h
	ret

m_cursr:
    mov 	ah, 02h
<<<<<<< HEAD
	mov 	dx, di  ; columna
	mov 	dh, 2d ; fila
=======
	mov 	dx, di 	;columna
	mov 	dh, 2d 	;fila
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde
	mov 	bh, 0h
	int 	10h
	ret


m_cursr2:
    mov 	ah, 02h
<<<<<<< HEAD
	mov 	dx, di  ; columna
	mov 	dh, 12d ; fila
=======
	mov 	dx, di  
	mov 	dh, 12d 
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde
	mov 	bh, 0h
	int 	10h
	ret


m_cursr3:
    mov 	ah, 02h
<<<<<<< HEAD
	mov 	dx, di  ; columna
	mov 	dh, 24d ; fila
=======
	mov 	dx, di  
	mov 	dh, 24d 
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde
	mov 	bh, 0h
	int 	10h
	ret

<<<<<<< HEAD
phrase:	
        mov 	di, 10d
lupi:	
    mov 	cl, [msg+di-10d]
=======
frase1:	
        mov 	di, 2d
escribo:	
    mov 	cl, [msg+di-2d]
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde
	call    m_cursr
	call 	w_char
	inc 	di
	cmp 	di, len
<<<<<<< HEAD
	jb	lupi
	ret

phrase2:	
        mov 	di, 16d
escribir1:	
    mov 	cl, [msg2+di-16d]
=======
	jb		escribo
	ret

frase2:	
        mov 	di, 10d
escribo2:	
    mov 	cl, [msg2+di-10d]
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde
	call    m_cursr2
	call 	w_char
	inc	    di
	cmp 	di, len2
<<<<<<< HEAD
	jb	escribir1
	ret

phrase3:	
        mov 	di, 2d
escribir2:	
    mov 	cl, [msg3+di-2d]
=======
	jb	escribo2
	ret

frase3:	
        mov 	di, 16d
escribo3:	
    mov 	cl, [msg3+di-16d]
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde
	call    m_cursr3
	call 	w_char
	inc	    di
	cmp 	di, len3
<<<<<<< HEAD
	jb	escribir2
=======
	jb		escribo3
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde
	ret

section .data
msg		db 	"Hoy voy a beber"
<<<<<<< HEAD
len 	equ	$-msg+10

msg2	db 	"y se que voy a enloquecer"
len2	equ	$-msg2+16

msg3	db 	"y te llamare"
len3 	equ	$-msg3+2
=======
len 	equ	$-msg+2

msg2	db 	"y se que voy a enloquecer"
len2	equ	$-msg2+10

msg3	db 	"y te llamare"
len3 	equ	$-msg3+16
>>>>>>> 89555371366be711c44a54dc754c176be8fc6bde
