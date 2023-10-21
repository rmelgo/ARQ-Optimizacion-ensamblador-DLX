; TRABAJO DLX

	.data	0x00001000
; Espacio de datos 

; VARIABLES DE ENTRADA: NO MODIFICAR ORDEN (Se pueden modificar los valores)
;lista1:	.float 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
;lista2:	.float 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
;lista3:	.float 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
;lista4:	.float 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
;lista5:	.float 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
lista1:	.float 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
lista2:	.float 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
lista3:	.float 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
lista4:	.float 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
lista5:	.float 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
;lista1:	.float 12, 1,15, 1,15,13, 1,14, 1,14,14, 1,13, 1,13,15, 1,12, 1,12
;lista2:	.float 2,22,25,25, 2, 2,23,24,24, 2, 2,24,23,23, 2, 2,25,22,22, 2
;lista3:	.float 3, 3,32, 3, 3, 3, 3,33, 3, 3, 3, 3,34, 3, 3, 3, 3,35, 3, 3
;lista4:	.float 4,45,45,42, 4, 4,44,44,43, 4, 4,43,43,44, 4, 4,42,42,45, 4
;lista5:	.float 55, 5,55, 5,52,54, 5,54, 5,53,53, 5,53, 5,54,52, 5,52, 5,55

tamano:	.word 20
uno:	.float 1 

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
	lw	r2,tamano(r0) ;cargamos en r2 el tamaño de la listas
	lf	f21,uno(r0) ;cargamos en f21 el valor 1 almacenado en la variable uno
	movi2fp	f22,r2
	addi	r11,r0,#4 ;cargamos en los siguientes registros valores para recorrer las listas desde 4 hasta 76 en r11-r29
	cvti2f	f22,f22
	addi	r12,r0,#8
	eqf	f22,f0 ;comprobacion del dividendo antes de realizar la division
	bfpt	fin
	addi	r13,r0,#12
	addi	r14,r0,#16
	addi	r15,r0,#20
	addi	r16,r0,#24
	addi	r17,r0,#28
	addi	r18,r0,#32
	addi	r19,r0,#36
	addi	r20,r0,#40
	addi	r21,r0,#44
	addi	r22,r0,#48
	addi	r23,r0,#52
	addi	r24,r0,#56
	addi	r25,r0,#60
	lf	f1, lista1(r0) ;aprovechamos para cargar el primer valor de la lista1 en el registro f1
	lf	f8, lista3(r11) ;aprovechamos para cargar el segundo valor de la lista3 en el registro f8
	lf	f7, lista2(r11) ;aprovechamos para cargar el segundo valor de la lista2 en el registro f7
	lf	f9, lista4(r11) ;aprovechamos para cargar el segundo valor de la lista4 en el registro f9
	lf	f5, lista5(r11) ;aprovechamos para cargar el segundo valor de la lista5 en el registro f5
	lf	f4, lista4(r0) ;cargamos el primer valor de la lista4 en f4
	subi	r2,r2,#20 
	divf	f20,f21,f22 ;division 1/tamano para multiplicar a la hroa de calcualr las medias de las litas y ahorrar ciclos
	addi	r28,r0,#72

	beqz	r2,tamano20 ;condicionales para cada tamaño posible
	addi	r2,r2,#5
	lf	f28,lista3(r15) ;cargamos en f28 el contenido de los valores de lista3
	beqz	r2,tamano15
	addi	r2,r2,#5
	lf	f29,lista3(r17) ;cargamos en f29 el contenido de los valores de lista3
	beqz	r2,tamano10
	addi	r2,r2,#5
	lf	f6, lista1(r11) ;aprovechamos para cargar el segundo valor de la lista1 en el registro f6
	beqz	r2,tamano5

	;Finaliza la ejecucion
	trap 0

tamano20:

	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 1
	lf	f28,lista3(r15) ;cargamos en f28 el contenido de los valores de lista3
	lf	f29,lista3(r17) ;cargamos en f29 el contenido de los valores de lista3
	lf	f15,lista3(r28) ;cargamos en f15 el contenido de los valores de lista3
	lf	f26,lista2(r15) ;cargamos en f26 el contenido de los valores de lista2
	lf	f27,lista2(r28) ;cargamos en f27 el contenido de los valores de lista2
	lf	f23,lista2(r17) ;cargamos en f27 el contenido de los valores de lista2
	lf	f30,lista4(r15) ;cargamos en f30 el contenido de los valores de lista4
	lf	f31,lista4(r17) ;cargamos en f31 el contenido de los valores de lista4
	lf	f10,lista4(r28) ;cargamos en f10 el contenido de los valores de lista4

	addi	r26,r0,#64
	addi	r27,r0,#68
	addi	r29,r0,#76 ;suma del ultimo valor posible para el tamaño 20

	lf	f19, lista4(r27) ;cargamos en f19 el contenido de los valores de lista4

	
	lf	f6, lista1(r11) ;aprovechamos para cargar el segundo valor de la lista1 en el registro f6

	lf	f11,lista1(r12) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido de los dos primeros elementos de la lista1

	lf	f6,lista1(r13) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r14) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r15) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado


	lf	f11,lista1(r16) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r17) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r18) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r19) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r20) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado


	lf	f6,lista1(r21) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r22) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r23) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r24) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r25) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado


	lf	f11,lista1(r26) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r27) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r28) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r29) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f3, lista3(r0) ;aprovechamos para cargar el primer valor de la lista3 en el registro f3
	addf	f1,f6,f1 ;sumamos el ultimo valor de la lista1




	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 3
	lf	f13,lista3(r12) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido de los dos primeros elementos de la lista3


	lf	f8,lista3(r13) ;cargamos en f8 el contenido de los valores de lista3
	multf	f11,f1,f20 ;guardamos en f11 la multiplicacion de la lista1 por 1/contador
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f13,lista3(r14) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f0,lista3(r29) ;cargamos en f0 el contenido del último valor de la lista3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	multf	f24,f11,f11 ;hacemos a1^2

	addf	f3,f28,f3 ;sumamos el contenido x de la lista3 al total acumulado
	lf	f13,lista3(r16) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f29,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f8,lista3(r18) ;cargamos en f8 el contenido de los valores de lista3
	addf	f3,f15,f3	;sumamos el contenido x de la lista3 al total acumulado
	multf	f25,f24,f11 ;hacemos a1^3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f13,lista3(r19) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado
	addf	f3,f0,f3 ;sumamos el ultimo valor de lista3

	lf	f8,lista3(r20) ;cargamos en f8 el contenido de los valores de lista3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado


	lf	f13,lista3(r21) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f8,lista3(r22) ;cargamos en f8 el contenido de los valores de lista3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f13,lista3(r23) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f8,lista3(r24) ;cargamos en f8 el contenido de los valores de lista3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f13,lista3(r25) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado


	lf	f8,lista3(r26) ;cargamos en f8 el contenido de los valores de lista3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f13,lista3(r27) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f2, lista2(r0) ;aprovechamos para cargar el primer valor de la lista2 en el registro f2
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado




	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 2
	lf	f12,lista2(r12) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido de los dos primeros elementos de la lista2


	lf	f7,lista2(r13) ;cargamos en f7 el contenido de los valores de lista2
	addf	f16,f1,f3; ;sumamos lista1 y lista3 y lo guardamos en f16
	multf	f13,f3,f20 ;multiplicamos la lista3 por 1/contador y lo guardamos en f13

	lf	f0,lista2(r29) ;cargamos en f0 el último valor de lista2
	eqf		f16,f18  ;comprobacion de que no haya divisiones por 0
	bfpt	fin

	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado

	multf	f28,f13,f13 ;hacemos a3^2

	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado
	lf	f12,lista2(r14) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f27,f2 ;sumamos el contenido x de la lista2 al total acumulado
	lf	f7,lista2(r16) ;cargamos en f7 el contenido de los valores de lista2
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado

	multf	f29,f28,f13 ;hacemos a3^3

	addf	f2,f0,f2 ;sumamos el ultimo elemento de lista2
	lf	f12,lista2(r18) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado
	lf	f7,lista2(r19) ;cargamos en f7 el contenido de los valores de lista2	
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado
	
	divf	f17,f21,f16 ;1/la suma de lista1 y lista3
	addf	f2,f26,f2 ;sumamos el contenido x de la lista2 al total acumulado

	lf	f12,lista2(r20) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado


	lf	f7,lista2(r21) ;cargamos en f7 el contenido de los valores de lista2
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado

	lf	f12,lista2(r22) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado

	lf	f7,lista2(r23) ;cargamos en f7 el contenido de los valores de lista2
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado

	lf	f12,lista2(r24) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado

	lf	f7,lista2(r25) ;cargamos en f7 el contenido de los valores de lista2
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado


	lf	f12,lista2(r26) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado

	lf	f7,lista2(r27) ;cargamos en f7 el contenido de los valores de lista2
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado

	lf	f21, lista4(r26) ;aprovechamos para cargar un valor de la lista4 en el registro f21
	addf	f2,f23,f2 ;sumamos el contenido x de la lista2 al total acumulado

	




	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 4
	lf	f14,lista4(r12) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido de los dos primeros elementos de la lista4


	lf	f9,lista4(r13) ;cargamos en f9 el contenido de los valores de lista4
	multf	f12,f2,f20 ;multiplicamos la lista2 por 1/contador
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f14,lista4(r14) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f0,lista4(r29) ;cargamos en f0 el último valor de lista4
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f26,f12,f12 ;hacemos a2^2

	addf	f4,f30,f4 ;sumamos el contenido x de la lista4 al total acumulado
	lf	f14,lista4(r16) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f31,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f9,lista4(r18) ;cargamos en f9 el contenido de los valores de lista4
	addf	f4,f10,f4
	multf	f27,f26,f12 ;hacemos a2^3
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f14,lista4(r19) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f9,lista4(r20) ;cargamos en f9 el contenido de los valores de lista4
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f23,f13,f11 ;multiplicamos los valores dividos de lista1 y lista3 (a1 y a3)
	addf	f4,f19,f4	;sumamos el contenido x de la lista4 al total acumulado

	lf	f14,lista4(r21) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f9,lista4(r22) ;cargamos en f9 el contenido de los valores de lista4
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f23,f23,f12 ;el total de antes de la multiplicacion de a1 por a3 ahora por a2
	addf	f4,f0,f4 ;sumamos el ultimo elemento de lista4

	lf	f14,lista4(r23) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f21,f4	;sumamos el contenido x de la lista4 al total acumulado
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f9,lista4(r24) ;cargamos en f9 el contenido de los valores de lista4
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f14,lista4(r25) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado


	lf	f5, lista5(r0) ;aprovechamos para cargar el primer valor de la lista5 en el registro f5
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado





;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTAS 5
	lf	f10, lista5(r11) ;aprovechamos para cargar el segundo valor de la lista5 en el registro f10
	addf	f18,f2,f4 ;suma de lista2 y lista4

	;A PARTIR DE AQUI EL FACTOR ESTA CALCULADO

	lf	f15,lista5(r12) ;cargamos en f15 el contenido de los valores de lista5
	multf 	f19,f18,f17 ;factor de la derecha del calculo

	addf	f5,f10,f5 ;sumamos el contenido de los dos primeros elementos de la lista5
	lf	f10,lista5(r13) ;cargamos en f10 el contenido de los valores de lista5
	lf	f16,lista5(r14) ;cargamos en f16 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f14,f4,f20 ;lista4 por 1/contador

	lf	f15,lista5(r15) ;cargamos en f15 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f10,lista5(r16) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f16,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f30,f14,f14 ;calculamos a4^2

	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f15,lista5(r17) ;cargamos en f15 el contenido de los valores de lista5
	lf	f16,lista5(r18) ;cargamos en f16 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f31,f30,f14 ;calculamos a4^3

	lf	f10,lista5(r19) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f15,lista5(r20) ;cargamos en f15 el contenido de los valores de lista5
	addf	f5,f16,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f0,f19,f11 ;guardamos en f0 la multiplicacion de a1 con el factor

	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f10,lista5(r21) ;cargamos en f10 el contenido de los valores de lista5
	lf	f16,lista5(r22) ;cargamos en f16 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f1,f19,f24 ;guardamos en f1 la multiplicacion del factor con a1^2

	lf	f15,lista5(r23) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f10,lista5(r24) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f16,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f2,f19,f25 ;calculamos a1^3 por el factor de la derecha y lo guardamos en f2

	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f15,lista5(r25) ;cargamos en f10 el contenido de los valores de lista5
	lf	f16,lista5(r26) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f3,f19,f12 ;multiplicacion de a2 con el factor

	lf	f10,lista5(r27) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f15,lista5(r28) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f16,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f4,f19,f26 ;multiplicacion de a2^2 con el factor

	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f10,lista5(r29) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado
	sf	M(r0), f19 ;guardamos los valores de la matriz, los de la columna izquierda son todos el factor de la derecha
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f6,f19,f27 ;multiplicacion de a2^3 con el factor


	subf	f21,f21,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r11), f0 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f0,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r12), f1 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f1,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f7,f19,f13 ;multiplicacion de a3 con el factor

	addf	f21,f2,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r13), f2 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f3,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r14), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f4,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f8,f19,f28 ;multiplicacion de a3^2 con el factor

	addf	f21,f6,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r15), f3 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f7,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r16), f4 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f9,f19,f29 ;multiplicacion de a3^3 con el factor

	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r17), f6 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r18), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f16,f19,f14 ;multiplicacion de a4 con el factor

	divf	f15,f5,f22 ;division de lista5 por el contador
	sf	M(r19), f7 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r20), f8 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r21), f9 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz

	multf	f17,f19,f30 ;multiplicacion de a4^2 con el factor

	sf	M(r22), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r23), f16 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	a1(r0), f11 ;almacenamos los registros en sus variables correspondientes
	addf	f21,f16,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f18,f19,f31 ;multiplicacion de a4^3 con el factor

	addf	f21,f8,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	a2(r0), f12 ;almacenamos los registros en sus variables correspondientes
	addf	f21,f9,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	a3(r0), f13 ;almacenamos los registros en sus variables correspondientes
	addf	f21,f17,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f23,f23,f14 ;multiplicamos a1*a2*a3 ahora por a4

	sf	M(r24), f17 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f18,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r25), f18 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz

	multf	f23,f23,f15 ;multiplicamos a1*a2*a3*a4 ahora por a5

	sf	a4(r0), f14 ;almacenamos los registros en sus variables correspondientes
	sf	a5(r0), f15 ;almacenamos los registros en sus variables correspondientes
	sf	checkM(r0), f21 ;almacenamos la suma de los valores de la matriz en checkM
	sf	checkA(r0), f23 ;almacenamos la multiplicacion de a1*a2*a3*a4*a5 en checkA

	;Finaliza la ejecucion 
	trap 0


;A PARTIR DE AQUI ES EL CÁLCULO PARA LOS DISTINTOS TAMAÑOS POSIBLES DE LAS LISTAS
;EL CODIGO ES IGUAL QUE PARA TAMAÑO 20 PERO CAMBIANDO UN POCO ALGUNOS ÓRDENES
;LOS CALCULOS Y REGISTROS USADOS SON LOS MISMOS

tamano15:
	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 1
	lf	f29,lista3(r17) ;cargamos en f29 el contenido de los valores de lista3
	lf	f15,lista3(r23) ;cargamos en f15 el contenido de los valores de lista3
	lf	f26,lista2(r15) ;cargamos en f26 el contenido de los valores de lista2
	lf	f27,lista2(r23) ;cargamos en f27 el contenido de los valores de lista2
	lf	f23,lista2(r17) ;cargamos en f23 el contenido de los valores de lista2
	lf	f30,lista4(r15) ;cargamos en f30 el contenido de los valores de lista4
	lf	f31,lista4(r17) ;cargamos en f31 el contenido de los valores de lista4
	lf	f10,lista4(r23) ;cargamos en f10 el contenido de los valores de lista4


	lf	f19, lista4(r22) ;cargamos en f19 el contenido de los valores de lista4

	
	lf	f6, lista1(r11) ;aprovechamos para cargar el segundo valor de la lista1 en el registro f6

	lf	f11,lista1(r12) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido de los dos primeros elementos de la lista1

	lf	f6,lista1(r13) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r14) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r15) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado


	lf	f11,lista1(r16) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r17) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r18) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r19) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r20) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado


	lf	f6,lista1(r21) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r22) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r23) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r24) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f3, lista3(r0) ;aprovechamos para cargar el primer valor de la lista3 en el registro f3
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado




	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 3
	lf	f13,lista3(r12) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido de los dos primeros elementos de la lista3


	lf	f8,lista3(r13) ;cargamos en f8 el contenido de los valores de lista3
	multf	f11,f1,f20 ;guardamos en f11 la multiplicacion de la lista1 por 1/contador
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f13,lista3(r14) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f0,lista3(r24) ;cargamos en f0 el contenido de los valores de lista3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	multf	f24,f11,f11 ;hacemos a1^2

	addf	f3,f28,f3 ;sumamos el contenido x de la lista3 al total acumulado
	lf	f13,lista3(r16) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f29,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f8,lista3(r18) ;cargamos en f8 el contenido de los valores de lista3
	addf	f3,f15,f3 ;sumamos el contenido x de la lista3 al total acumulado
	multf	f25,f24,f11 ;hacemos a1^3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f13,lista3(r19) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado
	addf	f3,f0,f3 ;sumamos el ultimo valor de lista3

	lf	f8,lista3(r20) ;cargamos en f8 el contenido de los valores de lista3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado


	lf	f13,lista3(r21) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f8,lista3(r22) ;cargamos en f8 el contenido de los valores de lista3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f2, lista2(r0) ;aprovechamos para cargar el primer valor de la lista1 en el registro f2
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado




	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 2
	lf	f12,lista2(r12) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido de los dos primeros elementos de la lista2


	lf	f7,lista2(r13) ;cargamos en f7 el contenido de los valores de lista2
	addf	f16,f1,f3; ;sumamos lista1 y lista3 y lo guardamos en f16
	multf	f13,f3,f20 ;multiplicamos la lista3 por 1/contador y lo guardamos en f13

	lf	f0,lista2(r24) ;cargamos en f0 el contenido de los valores de lista2
	eqf		f16,f18 ;comprobacion de division entre 0
	bfpt	fin

	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado

	multf	f28,f13,f13 ;hacemos a3^2

	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado
	lf	f12,lista2(r14) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f27,f2 ;sumamos el contenido x de la lista2 al total acumulado
	lf	f7,lista2(r16) ;cargamos en f7 el contenido de los valores de lista2
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado

	multf	f29,f28,f13 ;hacemos a3^3

	addf	f2,f0,f2 ;sumamos el ultimo elemento de lista2
	lf	f12,lista2(r18) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado
	lf	f7,lista2(r19) ;cargamos en f7 el contenido de los valores de lista2	
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado
	
	divf	f17,f21,f16 ;1/la suma de lista1 y lista3
	addf	f2,f26,f2 ;sumamos el contenido x de la lista2 al total acumulado

	lf	f12,lista2(r20) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado


	lf	f7,lista2(r21) ;cargamos en f7 el contenido de los valores de lista2
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado

	lf	f12,lista2(r22) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado

	lf	f21, lista4(r21) ;aprovechamos para cargar el primer valor de la lista4 en el registro f21
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado
	addf	f2,f23,f2 ;sumamos el contenido x de la lista2 al total acumulado

	




	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 4
	lf	f14,lista4(r12) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido de los dos primeros elementos de la lista4


	lf	f9,lista4(r13) ;cargamos en f9 el contenido de los valores de lista4
	multf	f12,f2,f20 ;multiplicamos la lista2 por 1/contador
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f14,lista4(r14) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f0,lista4(r24) ;cargamos en f0 el contenido de los valores de lista4
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f26,f12,f12 ;hacemos a2^2

	addf	f4,f30,f4 ;sumamos el contenido x de la lista4 al total acumulado
	lf	f14,lista4(r16) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f31,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f9,lista4(r18) ;cargamos en f9 el contenido de los valores de lista4
	addf	f4,f10,f4
	multf	f27,f26,f12 ;hacemos a2^3
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f14,lista4(r19) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado
	

	lf	f9,lista4(r20) ;cargamos en f9 el contenido de los valores de lista4
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f23,f13,f11 ;multiplicamos los valores dividos de lista1 y lista3 (a1 y a3)
	addf	f4,f19,f4 ;sumamos el contenido x de la lista4 al total acumulado



	multf	f23,f23,f12 ;el total de antes de la multiplicacion de a1 por a3 ahora por a2
	addf	f4,f0,f4 ;sumamos el ultimo elemento de lista4

	
	addf	f4,f21,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f5, lista5(r0) ;aprovechamos para cargar el primer valor de la lista5 en el registro f5
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado







;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTAS 5
	lf	f10, lista5(r11) ;aprovechamos para cargar el segundo valor de la lista5 en el registro f10
	addf	f18,f2,f4 ;suma de lista2 y lista4

	;A PARTIR DE AQUI EL FACTOR ESTA CALCULADO

	lf	f15,lista5(r12) ;cargamos en f15 el contenido de los valores de lista5
	multf 	f19,f18,f17 ;factor de la derecha del calculo

	addf	f5,f10,f5 ;sumamos el contenido de los dos primeros elementos de la lista5
	lf	f10,lista5(r13) ;cargamos en f10 el contenido de los valores de lista5
	lf	f16,lista5(r14) ;cargamos en f16 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f14,f4,f20 ;lista4 por 1/contador

	lf	f15,lista5(r15) ;cargamos en f15 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f10,lista5(r16) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f16,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f30,f14,f14 ;calculamos a4^2

	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f15,lista5(r17) ;cargamos en f15 el contenido de los valores de lista5
	lf	f16,lista5(r18) ;cargamos en f16 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f31,f30,f14 ;calculamos a4^3

	lf	f10,lista5(r19) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f15,lista5(r20) ;cargamos en f15 el contenido de los valores de lista5
	addf	f5,f16,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f0,f19,f11 ;guardamos en f0 la multiplicacion de a1 con el factor

	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f10,lista5(r21) ;cargamos en f10 el contenido de los valores de lista5
	lf	f16,lista5(r22) ;cargamos en f16 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f1,f19,f24 ;guardamos en f1 la multiplicacion del factor con a1^2

	lf	f15,lista5(r23) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado
	lf	f10,lista5(r24) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f16,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f2,f19,f25 ;calculamos a1^3 por el factor de la derecha y lo guardamos en f2

	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f3,f19,f12 ;multiplicacion de a2 con el factor

	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f4,f19,f26 ;multiplicacion de a2^2 con el factor

	sf	M(r0), f19 ;guardamos los valores de la matriz, los de la columna izquierda son todos el factor de la derecha

	multf	f6,f19,f27 ;multiplicacion de a2^2 con el factor


	subf	f21,f21,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r11), f0 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f0,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r12), f1 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f1,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f7,f19,f13 ;multiplicacion de a3 con el factor

	addf	f21,f2,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r13), f2 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f3,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r14), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f4,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f8,f19,f28 ;multiplicacion de a3^2 con el factor

	addf	f21,f6,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r15), f3 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f7,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r16), f4 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f9,f19,f29 ;multiplicacion de a3^3 con el factor

	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r17), f6 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r18), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f16,f19,f14 ;multiplicacion de a4 con el factor

	divf	f15,f5,f22 ;division de lista5 por el contador
	sf	M(r19), f7 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r20), f8 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r21), f9 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz

	multf	f17,f19,f30 ;multiplicacion de a4^2 con el factor

	sf	M(r22), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r23), f16 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	a1(r0), f11 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f16,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f18,f19,f31 ;multiplicacion de a4^3 con el factor

	addf	f21,f8,f21
	sf	a2(r0), f12
	addf	f21,f9,f21
	sf	a3(r0), f13
	addf	f21,f17,f21

	multf	f23,f23,f14 ;multiplicamos a1*a2*a3 ahora por a4

	sf	M(r24), f17 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f18,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r25), f18 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz

	multf	f23,f23,f15 ;multiplicamos a1*a2*a3*a4 ahora por a5

	sf	a4(r0), f14 ;almacenamos los registros en sus variables correspondientes
	sf	a5(r0), f15 ;almacenamos los registros en sus variables correspondientes
	sf	checkM(r0), f21 ;almacenamos la suma de los valores de la matriz en checkM
	sf	checkA(r0), f23 ;almacenamos la multiplicacion de a1*a2*a3*a4*a5 en checkA

	;Finaliza la ejecucion
	trap 0

;A PARTIR DE AQUI ES EL CÁLCULO PARA LOS DISTINTOS TAMAÑOS POSIBLES DE LAS LISTAS
;EL CODIGO ES IGUAL QUE PARA TAMAÑO 20 PERO CAMBIANDO UN POCO ALGUNOS ÓRDENES
;LOS CALCULOS Y REGISTROS USADOS SON LOS MISMOS

tamano10:
	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 1
	lf	f15,lista3(r18) ;cargamos en f15 el contenido de los valores de lista3
	lf	f26,lista2(r15) ;cargamos en f26 el contenido de los valores de lista2
	lf	f27,lista2(r17) ;cargamos en f27 el contenido de los valores de lista2
	lf	f23,lista2(r18) ;cargamos en f23 el contenido de los valores de lista2
	lf	f30,lista4(r15) ;cargamos en f30 el contenido de los valores de lista4
	lf	f31,lista4(r17) ;cargamos en f31 el contenido de los valores de lista4
	lf	f10,lista4(r18) ;cargamos en f10 el contenido de los valores de lista4

	
	lf	f6, lista1(r11) ;aprovechamos para cargar el segundo valor de la lista1 en el registro f6

	lf	f11,lista1(r12) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido de los dos primeros elementos de la lista1

	lf	f6,lista1(r13) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r14) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r15) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado


	lf	f11,lista1(r16) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r17) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r18) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f6,lista1(r19) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f3, lista3(r0) ;aprovechamos para cargar el primer valor de la lista3 en el registro f3
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado




	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 3
	lf	f13,lista3(r12) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido de los dos primeros elementos de la lista3


	lf	f8,lista3(r13) ;cargamos en f8 el contenido de los valores de lista3
	multf	f11,f1,f20 ;guardamos en f11 la multiplicacion de la lista1 por 1/contador
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f13,lista3(r14) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado

	lf	f0,lista3(r19) ;cargamos en f8 el contenido de los valores de lista3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	multf	f24,f11,f11 ;hacemos a1^2

	addf	f3,f28,f3 ;sumamos el contenido x de la lista3 al total acumulado
	lf	f13,lista3(r16) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f29,f3 ;sumamos el contenido x de la lista3 al total acumulado
	addf	f3,f15,f3 ;sumamos el contenido x de la lista3 al total acumulado

	multf	f25,f24,f11 ;hacemos a1^3

	addf	f3,f0,f3 ;sumamos el ultimo valor de lista3
	lf	f2, lista2(r0) ;aprovechamos para cargar el primer valor de la lista2 en el registro f2
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado




	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 2
	lf	f12,lista2(r12) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido de los dos primeros elementos de la lista2


	lf	f7,lista2(r13) ;cargamos en f7 el contenido de los valores de lista2
	addf	f16,f1,f3 ;sumamos lista1 y lista3 y lo guardamos en f16
	multf	f13,f3,f20 ;multiplicamos la lista3 por 1/contador y lo guardamos en f13

	lf	f0,lista2(r19) ;cargamos en f0 el contenido de los valores de lista2
	eqf		f16,f18 ;comprobacion de que no haya divisiones por 0
	bfpt	fin

	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado

	multf	f28,f13,f13 ;hacemos a3^2

	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado
	lf	f12,lista2(r14) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f27,f2 ;sumamos el contenido x de la lista2 al total acumulado
	lf	f7,lista2(r16) ;cargamos en f7 el contenido de los valores de lista2
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado

	multf	f29,f28,f13 ;hacemos a3^3

	addf	f2,f0,f2 ;sumamos el ultimo elemento de lista2


	divf	f17,f21,f16 ;1/la suma de lista1 y lista3
	addf	f2,f26,f2 ;sumamos el contenido x de la lista2 al total acumulado


	lf	f21, lista4(r16) ;aprovechamos para cargar el primer valor de la lista4 en el registro f16
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado
	addf	f2,f23,f2 ;sumamos el contenido x de la lista2 al total acumulado

	



	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 4
	lf	f14,lista4(r12) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido de los dos primeros elementos de la lista4


	lf	f9,lista4(r13) ;cargamos en f9 el contenido de los valores de lista4
	multf	f12,f2,f20 ;multiplicamos la lista2 por 1/contador
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f14,lista4(r14) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado

	lf	f0,lista4(r19) ;cargamos en f9 el contenido de los valores de lista4
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f26,f12,f12 ;hacemos a2^2

	addf	f4,f30,f4 ;sumamos el contenido x de la lista4 al total acumulado
	addf	f4,f31,f4 ;sumamos el contenido x de la lista4 al total acumulado

	

	multf	f27,f26,f12 ;hacemos a2^3

	addf	f4,f10,f4 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f23,f13,f11 ;multiplicamos los valores dividos de lista1 y lista3 (a1 y a3)

	addf	f4,f0,f4 ;sumamos el ultimo elemento de lista4
	lf	f5, lista5(r0) ;aprovechamos para cargar el primer valor de la lista5 en el registro f5

	multf	f23,f23,f12 ;el total de antes de la multiplicacion de a1 por a3 ahora por a2

	addf	f4,f21,f4 ;sumamos el contenido x de la lista4 al total acumulado
	







;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTAS 5
	lf	f10, lista5(r11) ;aprovechamos para cargar el segundo valor de la lista10 en el registro f10
	addf	f18,f2,f4 ;suma de lista2 y lista4

	;A PARTIR DE AQUI EL FACTOR ESTA CALCULADO

	lf	f15,lista5(r12) ;cargamos en f15 el contenido de los valores de lista5
	multf 	f19,f18,f17 ;factor de la derecha del calculo
	addf	f5,f10,f5 ;sumamos el contenido de los dos primeros elementos de la lista5

	lf	f10,lista5(r13) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado


	lf	f15,lista5(r14) ;cargamos en f15 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado
	
	multf	f14,f4,f20 ;lista4 por 1/contador

	lf	f10,lista5(r15) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado


	lf	f15,lista5(r16) ;cargamos en f15 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f30,f14,f14 ;calculamos a4^2

	lf	f10,lista5(r17) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado

	lf	f15,lista5(r18) ;cargamos en f15 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f31,f30,f14 ;calculamos a4^3

	lf	f10,lista5(r19) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f0,f19,f11 ;guardamos en f0 la multiplicacion de a1 con el factor



	multf	f1,f19,f24 ;guardamos en f1 la multiplicacion del factor con a1^2



	multf	f2,f19,f25 ;calculamos a1^3 por el factor de la derecha y lo guardamos en f2



	multf	f3,f19,f12 ;multiplicacion de a2 con el factor



	multf	f4,f19,f26 ;multiplicacion de a2^2 con el factor



	sf	M(r0), f19
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f6,f19,f27 ;multiplicacion de a2^2 con el factor


	subf	f21,f21,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r11), f0 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f0,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r12), f1 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f1,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f7,f19,f13 ;multiplicacion de a3 con el factor

	addf	f21,f2,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r13), f2 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f3,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r14), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f4,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f8,f19,f28 ;multiplicacion de a3^2 con el factor

	addf	f21,f6,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r15), f3 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f7,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r16), f4 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f9,f19,f29 ;multiplicacion de a3^3 con el factor

	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r17), f6 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r18), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f16,f19,f14 ;multiplicacion de a4 con el factor

	divf	f15,f5,f22 ;division de lista5 por el contador
	sf	M(r19), f7 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r20), f8 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r21), f9 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz

	multf	f17,f19,f30 ;multiplicacion de a4^2 con el factor

	sf	M(r22), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r23), f16 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	a1(r0), f11 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f16,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f18,f19,f31 ;multiplicacion de a4^3 con el factor

	addf	f21,f8,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	a2(r0), f12 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f9,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	a3(r0), f13 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f17,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f23,f23,f14 ;multiplicamos a1*a2*a3 ahora por a4

	sf	M(r24), f17 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f18,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r25), f18 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz

	multf	f23,f23,f15 ;multiplicamos a1*a2*a3*a4 ahora por a5

	sf	a4(r0), f14 ;almacenamos los registros en sus variables correspondientes
	sf	a5(r0), f15 ;almacenamos los registros en sus variables correspondientes
	sf	checkM(r0), f21 ;almacenamos la suma de los valores de la matriz en checkM
	sf	checkA(r0), f23 ;almacenamos la multiplicacion de a1*a2*a3*a4*a5 en checkA

	;Finaliza la ejecucion
	trap 0


;A PARTIR DE AQUI ES EL CÁLCULO PARA LOS DISTINTOS TAMAÑOS POSIBLES DE LAS LISTAS
;EL CODIGO ES IGUAL QUE PARA TAMAÑO 20 PERO CAMBIANDO UN POCO ALGUNOS ÓRDENES
;LOS CALCULOS Y REGISTROS USADOS SON LOS MISMOS

tamano5:
	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 1	
	lf	f11,lista1(r12) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido de los dos primeros elementos de la lista1

	lf	f6,lista1(r13) ;cargamos en f6 el contenido de los valores de lista1
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f11,lista1(r14) ;cargamos en f11 el contenido de los valores de lista1
	addf	f1,f6,f1 ;sumamos el contenido x de la lista1 al total acumulado

	lf	f3,lista3(r0) ;aprovechamos para cargar el primer valor de la lista3 en el registro f3
	addf	f1,f11,f1 ;sumamos el contenido x de la lista1 al total acumulado




	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 3
	lf	f13,lista3(r12) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido de los dos primeros elementos de la lista3

	multf	f11,f1,f20 ;guardamos en f11 la multiplicacion de la lista1 por 1/contador

	lf	f8,lista3(r13) ;cargamos en f8 el contenido de los valores de lista3
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado

	multf	f24,f11,f11 ;hacemos a1^2

	lf	f13,lista3(r14) ;cargamos en f13 el contenido de los valores de lista3
	addf	f3,f8,f3 ;sumamos el contenido x de la lista3 al total acumulado

	multf	f25,f24,f11 ;hacemos a1^3

	lf	f2, lista2(r0) ;aprovechamos para cargar el primer valor de la lista2 en el registro f2
	addf	f3,f13,f3 ;sumamos el contenido x de la lista3 al total acumulado




	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 2
	lf	f12,lista2(r12) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido de los dos primeros elementos de la lista2
	

	multf	f13,f3,f20 ;multiplicamos la lista3 por 1/contador y lo guardamos en f13

	addf	f16,f1,f3 ;sumamos lista1 y lista3 y lo guardamos en f16
	lf	f7,lista2(r13) ;cargamos en f7 el contenido de los valores de lista2
	eqf		f16,f18 ;comprobacion de que no haya divisiones por 0

	multf	f28,f13,f13 ;hacemos a3^2

	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado
	lf	f12,lista2(r14) ;cargamos en f12 el contenido de los valores de lista2
	addf	f2,f7,f2 ;sumamos el contenido x de la lista2 al total acumulado

	multf	f29,f28,f13 ;hacemos a3^3

	bfpt	fin
	addf	f2,f12,f2 ;sumamos el contenido x de la lista2 al total acumulado
	divf	f17,f21,f16 ;1/la suma de lista1 y lista3
	


	

	;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTA 4
	lf	f14,lista4(r12) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido de los dos primeros elementos de la lista4

	multf	f12,f2,f20 ;multiplicamos la lista2 por 1/contador

	lf	f9,lista4(r13) ;cargamos en f9 el contenido de los valores de lista4
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f26,f12,f12 ;hacemos a2^2

	lf	f14,lista4(r14) ;cargamos en f14 el contenido de los valores de lista4
	addf	f4,f9,f4 ;sumamos el contenido x de la lista4 al total acumulado


	multf	f27,f26,f12 ;hacemos a2^3

	lf	f5, lista5(r0) ;aprovechamos para cargar el primer valor de la lista5 en el registro f5
	addf	f4,f14,f4 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f23,f13,f11 ;multiplicamos los valores dividos de lista1 y lista3 (a1 y a3)


	multf	f23,f23,f12 ;el total de antes de la multiplicacion de a1 por a3 ahora por a2


	





;CALCULO DE LA SUMA DE LOS ELEMENTOS DE LAS LISTAS 5
	lf	f10, lista5(r11) ;aprovechamos para cargar el segundo valor de la lista5 en el registro f10
	addf	f18,f2,f4 ;suma de lista2 y lista4

	;A PARTIR DE AQUI EL FACTOR ESTA CALCULADO

	lf	f15,lista5(r12) ;cargamos en f15 el contenido de los valores de lista5
	multf 	f19,f18,f17 ;factor de la derecha del calculo
	addf	f5,f10,f5 ;sumamos el contenido de los dos primeros elementos de la lista5

	lf	f10,lista5(r13) ;cargamos en f10 el contenido de los valores de lista5
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado


	lf	f15,lista5(r14) ;cargamos en f15 el contenido de los valores de lista5
	addf	f5,f10,f5 ;sumamos el contenido x de la lista5 al total acumulado
	
	multf	f14,f4,f20 ;lista4 por 1/contador



	multf	f30,f14,f14 ;calculamos a4^2



	multf	f31,f30,f14 ;calculamos a4^3



	multf	f0,f19,f11 ;guardamos en f0 la multiplicacion de a1 con el factor



	multf	f1,f19,f24 ;guardamos en f1 la multiplicacion del factor con a1^2



	multf	f2,f19,f25 ;calculamos a1^3 por el factor de la derecha y lo guardamos en f2



	multf	f3,f19,f12 ;multiplicacion de a2 con el factor



	multf	f4,f19,f26 ;multiplicacion de a2^2 con el factor



	sf	M(r0), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f5,f15,f5 ;sumamos el contenido x de la lista5 al total acumulado

	multf	f6,f19,f27 ;multiplicacion de a2^2 con el factor


	subf	f21,f21,f21 ;sumamos el contenido x de la lista4 al total acumulado
	sf	M(r11), f0 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f0,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M
	sf	M(r12), f1 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f1,f21 ;usaremos f21 para ir sumando los valores almacenados en la matriz M

	multf	f7,f19,f13 ;multiplicacion de a3 con el factor

	addf	f21,f2,f21 ;sumamos el contenido x de la lista4 al total acumulado
	sf	M(r13), f2 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f3,f21 ;sumamos el contenido x de la lista4 al total acumulado
	sf	M(r14), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f4,f21 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f8,f19,f28 ;multiplicacion de a3^2 con el factor

	addf	f21,f6,f21 ;sumamos el contenido x de la lista4 al total acumulado
	sf	M(r15), f3 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f7,f21 ;sumamos el contenido x de la lista4 al total acumulado
	sf	M(r16), f4 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f9,f19,f29 ;multiplicacion de a3^3 con el factor

	addf	f21,f19,f21 ;sumamos el contenido x de la lista4 al total acumulado
	sf	M(r17), f6 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;sumamos el contenido x de la lista4 al total acumulado
	sf	M(r18), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f19,f21 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f16,f19,f14 ;multiplicacion de a4 con el factor

	divf	f15,f5,f22 ;division de lista5 por el contador
	sf	M(r19), f7 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r20), f8 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r21), f9 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz

	multf	f17,f19,f30 ;multiplicacion de a4^2 con el factor

	sf	M(r22), f19 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	M(r23), f16 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	sf	a1(r0), f11 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f16,f21 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f18,f19,f31 ;multiplicacion de a4^3 con el factor

	addf	f21,f8,f21 ;sumamos el contenido x de la lista4 al total acumulado
	sf	a2(r0), f12 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f9,f21 ;sumamos el contenido x de la lista4 al total acumulado
	sf	a3(r0), f13 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f17,f21 ;sumamos el contenido x de la lista4 al total acumulado

	multf	f23,f23,f14 ;multiplicamos a1*a2*a3 ahora por a4

	sf	M(r24), f17 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz
	addf	f21,f18,f21 ;sumamos el contenido x de la lista4 al total acumulado
	sf	M(r25), f18 ;vamos almacenando los valores almacenados en su celda correspondiente de la matriz

	multf	f23,f23,f15 ;multiplicamos a1*a2*a3*a4 ahora por a5

	sf	a4(r0), f14 ;almacenamos los registros en sus variables correspondientes
	sf	a5(r0), f15 ;almacenamos los registros en sus variables correspondientes
	sf	checkM(r0), f21 ;almacenamos la suma de los valores de la matriz en checkM
	sf	checkA(r0), f23 ;almacenamos la multiplicacion de a1*a2*a3*a4*a5 en checkA

	;Finaliza la ejecucion
	trap 0

fin:

	;Finaliza la ejecucion 
	trap 0
