org     100h

section .text
	call 	chart
	xor 	si, si
	xor 	di, di
	mov 	bx, 100d
	mov 	si, 25d
	mov 	di, 25d
	call 	horizontalLine
	mov 	si, 25d
	mov 	di, 125d 
	call 	horizontalLine
	mov 	bx, 125d
	mov	    si, 25d 
	mov 	di, 25d 
	call 	verticalLine
	mov 	bx, 45d 
	mov	    si, 100d
	mov 	di, 25d
	call 	verticalLine
	mov 	bx, 126d
	mov	    si, 100d
	mov 	di, 105d
	call 	verticalLine
	mov 	bx, 101d
	mov 	si, 45d 
	mov 	di, 45d 
	call 	horizontalLine
	mov 	si, 45d 
	mov 	di, 105d
	call 	horizontalLine
	mov 	bx, 105d 
	mov	    si, 45d 
	mov 	di, 45d
	call 	verticalLine
	call 	kbWait		
	int 	20h

chart:
    mov	    ah, 00h
	mov	    al, 13h
	int 	10h
	ret

pixel:	
    mov	    ah, 0Ch
	mov	    al, 1010b
	int 	10h
	ret

horizontalLine: 
horizontalLoop:	    
    mov 	cx, 0d
	add 	cx, si
	mov	    dx, di
	call 	pixel
	inc 	si
	cmp 	si, bx
	jne 	horizontalLoop
	ret

verticalLine:
verticalLoop:	
    mov 	cx, si
	mov	    dx, 0d
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bx
	jne 	verticalLoop
	ret

kbWait: 	
    mov	    ah, 00h
	int 	16h
	ret