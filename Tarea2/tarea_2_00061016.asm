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

	;Ejercicio 2
	org 100h;

    ;Ejercicio 2
	mov     ax, 4h	;Numero con el que iniciamos la serie
	mov		bx, 0d	;indexador	

	;Operacion para cuando el numero es menor de 100h
covid1:	mov 	[210h + bx], ax	;asignando en la primera direccion de memoria el valor de AX
		mov 	cx,2h	;duplicador de la serie
		mul	cx	
		inc	bx
		cmp	ax, 100h ;Comparando el valor de ax con 100h 	
		jb	covid1  ;saltando hacia la funcion 1

	;Operacion para cuando el numero es mayor que 100h
covid2:	mov 	[210h + bx], ax
	mov 	cx,2h
	mul	cx
	inc	bx ;en este caso incrementamos dos veces por la naturaleza de los numeros
	inc	bx
	cmp	ax, 4097d ;le pongo un numero mayor para que lo escriba
	jb	covid2


 ;Ejercicio 3

	mov	ax, 0000h	;variable auxiliar
	mov	bx, 0000h	;indice
	mov	cx, 0000h	;F[n-2]
	mov	dx, 0000h	;F[n-1]

	mov	bl, 2d	;indice = 2
	mov 	dl, 1d 	;F[1] = 1
	mov	[220h], cl	;guardar F[0]
	mov	[221h], dl	;guardar F[1]

fibonacci:	mov	ax, dx	;AX = F[n-1]
	add	ax, cx	;AX += F[n-2]
	mov	[220h+bx], ax 	;guardar en la direccion correspondiente el valor de AX
	mov	cx, dx	;F[n-2] = F[n-1]
	mov	dx, ax 	;F[n-1] = AX
	inc 	bl 	;incrementamos bl

	cmp	bl, 14d	
	jb	fibonacci	;realizamos salto a fibonacci

;solo el ultimo termino pasa de 255 por lo tanto solo hay una ejecucion 
;realizamos lo mismo de arriba pero ponemos los bits altos y luego los bajos
	mov	ax, dx	
	add	ax, cx	
	mov	[220h+bx], ah
	inc 	bl 	
	mov	[220h+bx], al
	mov	cx, dx	
	mov	dx, ax 


	int 20h

