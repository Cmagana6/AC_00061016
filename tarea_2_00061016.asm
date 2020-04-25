	org 	100h;

	;EJERCICIO 1 
	;Procederemos a calcular el promedio

	;Mi carnet es 61016 lo que representa mis notas

	;guardando notas en las celdas 210

	mov al, 6d
	mov ah, 1d
	mov bl, 0d
	mov bh, 1d
	mov cl, 6d

	mov [210h], al
	mov [211h], ah
	mov [212h], bl
	mov [213h], bh
	mov [214h], cl

	;limpiando ax, bx,cx,dx
	mov	ax, 0d
	mov	bx, 0d
	mov	cx, 0d
	mov	dx, 0d

	;valores que nos serviran para la operación suma
	mov	ax, 5d	;condicion de paro
	mov	bx, 0d	;bandera para desplazamiento
	mov	cx, 0d	;guarda lo que hay en las direcciones	
	mov 	dx, 0d	;acumulador

suma:	mov 	cx, [210h + bx] ;asignamos el numero correspondiente a cx
	add 	dl,cl		;le sumamos a dl lo que hay en cl (partes bajas de los
				;registros cx dx)
	inc 	bx		;incrementamos bx en 1
	cmp	ax,bx
	ja 	suma

	mov	[27Ah], dl ;Resultado de la suma de notas
	mov	ax, 0000h
	
	mov	al, dl
	
	DIV 	bl

	mov	[27Bh],al ;resultado de la operacion promedio

	;una vez obtenido el resultado me dio 2 por lo tanto mi cadena es
	;2 = “Aun se pasa”

	mov word [201h], "AU"
	mov word [203h], "N"

	mov word [205h], "SE"

	mov word [208h], "PA"

	mov word [20Ah], "SA"

	int 20h

