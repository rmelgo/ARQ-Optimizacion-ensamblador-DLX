; TRABAJO DLX

	.data	0x00001000
; Espacio de datos

; VARIABLES DE ENTRADA: NO MODIFICAR ORDEN (Se pueden modificar los valores)
;lista1:	.float 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
;lista2:	.float 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
;lista3:	.float 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
;lista4:	.float 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
;lista5:	.float 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
lista1: .float 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,18,19,20
lista2: .float 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,18,19,20
lista3: .float 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,18,19,20
lista4: .float 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,18,19,20
lista5: .float 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,18,19,20
;lista1:	.float 12, 1,15, 1,15,13, 1,14, 1,14,14, 1,13, 1,13,15, 1,12, 1,12
;lista2:	.float 2,22,25,25, 2, 2,23,24,24, 2, 2,24,23,23, 2, 2,25,22,22, 2
;lista3:	.float 3, 3,32, 3, 3, 3, 3,33, 3, 3, 3, 3,34, 3, 3, 3, 3,35, 3, 3
;lista4:	.float 4,45,45,42, 4, 4,44,44,43, 4, 4,43,43,44, 4, 4,42,42,45, 4
;lista5:	.float 55, 5,55, 5,52,54, 5,54, 5,53,53, 5,53, 5,54,52, 5,52, 5,55

tamano:	.word 20

multf	f11,f1,f2 ;multiplicacion a1xa2
	multf   f12,f11,f3 ;multiplicacion xa3
	multf	f13,f12,f4 ;multiplicacion xa4
	multf	f14,f13,f5 ;multiplicacion xa5:

;;;;; VARIABLES DE SALIDA: NO MODIFICAR ORDEN
; m11, m12, m13, m14
; m21, m22, m23, m24
; m31, m32, m33, m34
; m41, m42, m43, m44
M:	.float 0.0, 0.0, 0.0, 0.0
	.float 0.0, 0.0, 0.0, 0.0
	.float 0.0, 0.0, 0.0, 0.0
	.float 0.0, 0.0, 0.0, 0.0
checkM:	.float 0.0

; Medias

a1:	.float 0.0
a2:	.float 0.0
a3:	.float 0.0
a4:	.float 0.0
a5:	.float 0.0
checkA:	.float 0.0
;;;;; FIN NO MODIFICAR ORDEN

	.text
; Espacio de codigo
	.global main

main:
	lw r1,tamano(r0) 	;cargamos en r1 el tamaño
	movi2fp	f0,r1       ;movemos el tamano a f0
	cvti2f	f0,f0
	addi r2,r0,#4		;sumamos 4 a r2
	mult r1,r1,r2       ;multiplicamos el tamaño por 4
	
	beqz	r1,fin

loop:
	subi	r1,r1,#4 ;restamos r1 en 4 unidades

	lf	f6,lista1(r1) ;cargamos en f6 el contenido de los valores de lista1
	lf	f7,lista2(r1) ;cargamos en f7 el contenido de los valores de lista2
	lf	f8,lista3(r1) ;cargamos en f8 el contenido de los valores de lista3
	lf	f9,lista4(r1) ;cargamos en f9 el contenido de los valores de lista4
	lf	f10,lista5(r1) ;cargamos en f10 el contenido de los valores de lista5

	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado
	

	bnez	r1,loop

	eqf	f0,f30 ;comprobacion del dividendo antes de realizar la division
	bfpt	fin
	divf	f1,f1,f0 ;dividimos el contenido de f1 (que contiene la suma de todos los elementos de la lista1 y lo dividimos entre f0 que vale 20/15/10/5)
	divf	f2,f2,f0 ;dividimos el contenido de f2 (que contiene la suma de todos los elementos de la lista2 y lo dividimos entre f0 que vale 20/15/10/5)
	divf	f3,f3,f0 ;dividimos el contenido de f3 (que contiene la suma de todos los elementos de la lista3 y lo dividimos entre f0 que vale 20/15/10/5)
	divf	f4,f4,f0 ;dividimos el contenido de f4 (que contiene la suma de todos los elementos de la lista4 y lo dividimos entre f0 que vale 20/15/10/5)
	divf	f5,f5,f0 ;dividimos el contenido de f5 (que contiene la suma de todos los elementos de la lista5 y lo dividimos entre f0 que vale 20/15/10/5)

	multf	f11,f1,f2 ;multiplicacion a1xa2
	multf   f12,f11,f3 ;multiplicacion xa3
	multf	f13,f12,f4 ;multiplicacion xa4
	multf	f14,f13,f5 ;multiplicacion xa5

	eqf	f5,f30 ;comprobacion del dividendo antes de realizar la division
	bfpt	fin
	divf	f15,f2,f5 ;division a2/a5
	divf	f16,f4,f5 ;division a4/a5
	divf	f17,f1,f5 ;division a1/a5
	divf	f18,f3,f5 ;division a3/a5

	addf	f19,f15,f16 ;guardamos en f19 la suma de a2+a4
	addf	f20,f17,f18 ;guardamos en f20 la suma de a2+a3

	divf	f21,f19,f20 ;division total de la derecha

	sf	a1(r0),f1 ;alcenamos en a1 el resultado de la media
	sf	a2(r0),f2 ;alcenamos en a2 el resultado de la media
	sf	a3(r0),f3 ;alcenamos en a3 el resultado de la media
	sf	a4(r0),f4 ;alcenamos en a4 el resultado de la media
	sf	a5(r0),f5 ;alcenamos en a5 el resultado de la media
	sf	checkA(r0), f14 ;almacenamos en checkA el resultado de las listas

	lf	f1, a1 ;cargamos en f1 el resultado de la media de a1
	lf	f2, a2 ;cargamos en f2 el resultado de la media de a2
	lf	f3, a3 ;cargamos en f3 el resultado de la media de a3
	lf	f4, a4 ;cargamos en f4 el resultado de la media de a4
	lf	f5, a5 ;cargamos en f5 el resultado de la media de a5
	

	addi r5,r0,#0 ;usamos r5-r20 para viajar por las celdas de la matriz M
	sf M(r5),f21 ;almacenamos en M el primer valor de la matriz
		
	addi r6,r0,#4
	multf f11,f1,f21 ;calculamos el valor fila1 columna2
	sf M(r6),f11 ;lo almacenamos en M

	addi r7,r0,#8
	multf f12,f1,f1 ;hacemos a1²
	multf f12,f12,f21 ;calculamos el valor fila1 columna3
	sf M(r7),f12 ;lo almacenamos en M

	addi r8,r0,#12
	multf f13,f1,f1
	multf f13,f13,f1 ;hacemos a1³
	multf f13,f13,f21 ;calculamos el valor fila1 columna4
	sf M(r8),f13 ;lo almacenamos en M
	;primera fila de la matriz m

	addi r9,r0,#16 
	sf M(r9),f21 ;empezamos a almacenar en M los valores de fila2

	addi r10,r0,#20
	multf f11,f2,f21 ;calculamos el valor fila2 columna2
	sf M(r10),f11 ;lo almacenamos en M

	addi r11,r0,#24
	multf f12,f2,f2 ;hacemos a2²
	multf f12,f12,f21 ;calculamos el valor fila2 columna3
	sf M(r11),f12 ;lo almacenamos en M
	
	addi r12,r0,#28
	multf f13,f2,f2
	multf f13,f13,f2 ;hacemos a2³
	multf f13,f13,f21 ;calculamos el valor fila2 columna4
	sf M(r12),f13 ;lo almacenamos en M
	;segunda fila de la matriz m

	addi r13,r0,#32
	sf M(r13),f21 ;empezamos a almacenar los valores de la fila3

	addi r14,r0,#36
	multf f11,f3,f21 ;calculamos el valor fila3 columna2
	sf M(r14),f11 ;lo almacenamos en M

	addi r15,r0,#40
	multf f12,f3,f3 ;hacemos a3²
	multf f12,f12,f21 ;calculamos el valor fila3 columna3
	sf M(r15),f12 ;lo almacenamos en M

	addi r16,r0,#44
	multf f13,f3,f3
	multf f13,f13,f3 ;hacemos a3³
	multf f13,f13,f21 ;calculamos el valor fila3 columna4
	sf M(r16),f13 ;lo almacenamos en M
	;tercera fila de la matriz m

	addi r17,r0,#48
	sf M(r17),f21 ;empezamos a almacenar los valores de la fila4
	
	addi r18,r0,#52
	multf f11,f4,f21 ;calculamos el valor fila4 columna2
	sf M(r18),f11 ;lo almacenamos en M

	addi r19,r0,#56
	multf f12,f4,f4 ;hacemos a4²
	multf f12,f12,f21 ;calculamos el valor fila4 columna3
	sf M(r19),f12 ;lo almacenamos en M

	addi r20,r0,#60
	multf f13,f4,f4
	multf f13,f13,f4 ;hacemos a4³
	multf f13,f13,f21 ;calulamos el valor fila4 columna4
	sf M(r20),f13 ;lo almacenamos en M
	;cuarta fila de la matriz m
	;ya tenemos almacenada la matriz m

	lf f11,M(r5)
	lf f12,M(r6)
	lf f13,M(r7)
	lf f14,M(r8)
	lf f15,M(r9)
	lf f16,M(r10)
	lf f17,M(r11)
	lf f18,M(r12)
	lf f19,M(r13)
	lf f20,M(r14)
	lf f22,M(r15)
	lf f23,M(r16)
	lf f24,M(r17)
	lf f25,M(r18)
	lf f26,M(r19)
	lf f27,M(r20) ;cargamos todos los valores de la matriz M en los registros de f11 a f27

	addf f28,f11,f12
	addf f28,f28,f13
	addf f28,f28,f14
	addf f28,f28,f15
	addf f28,f28,f16
	addf f28,f28,f17
	addf f28,f28,f18
	addf f28,f28,f19
	addf f28,f28,f20
	addf f28,f28,f22
	addf f28,f28,f23
	addf f28,f28,f24
	addf f28,f28,f25
	addf f28,f28,f26
	addf f28,f28,f27 ;vamos sumando todos los valores de la matriz M para almacenarlos en checkM
	
	sf checkM,f28 ;almacenamos en checkM el valor de la suma que calculamos antes en f28
	lf f28,checkM ;cargamos en f28 checkM para mostrarlo
	lf f29,checkA ;cargamos en f29 checkA para mostrarlo
	
fin:
	;Finaliza la ejecucion
	trap 0
