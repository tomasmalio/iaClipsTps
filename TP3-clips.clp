;;1.a

(assert (vector 3 4 5))


(defrule minimo
	(vector $? ?x $?)
	(not(vector $? ?y&:(< ?y ?x) $?))
	=>
	(assert(min ?x)))

(defrule maximo
	(vector $? ?x $?)
	(not(vector $? ?y&:(> ?y ?x) $?))
	=>
	(assert(max ?x)))

(defrule producto
	(min ?x) (max ?y)
	=>
	(printout t "El producto entre el minimo y el maximo es: " (* ?x ?y) crlf))


;;1.b

(assert (vector1 3 4 5))

(assert (vector2 3 4 5))

(defrule maximo1
	(vector1 $? ?x $?)
	(not(vector1 $? ?y&:(> ?y ?x) $?))
	=>
	(assert(max1 ?x)))

(defrule maximo2
	(vector2 $? ?x $?)
	(not(vector2 $? ?y&:(> ?y ?x) $?))
	=>
	(assert(max2 ?x)))

(defrule minimo1
	(max1 ?x) (max2 ?y)
	(test(<= ?x ?y))
	=>
	(printout t "El minimo entre el maximo de vector1 y el maximo de vector2 es " ?x crlf))

(defrule minimo2
	(max1 ?x) (max2 ?y)
	(test(> ?x ?y))
	=>
	(printout t "El minimo entre el maximo de vector1 y el maximo de vector2 es " ?y crlf))


;;1.c
(assert (numero 3.5))

(defrule parte_entera
	(numero ?x)
	=>
	(printout t "La parte entera de (14/4) es :" (- (/ 14 4) 0.5) crlf))



;;3
;;3.a
(assert (numeros 2 3))

(defrule sumarDosNumYDividirPorRestaDosNum (numeros ?x ?y) 
	=> (printout t "El resultado de (A+1) / (B-1) es: " (/ (+ ?x 1) (- ?y 1)) crlf))

;;3.b
(assert (numeros 4 3 5))

(defrule sumarDosNumPorUnNum (numeros ?x ?y ?z) 
	=> (printout t "El resultado de (A + B) * C es: " (* (+ ?x ?y) ?z) crlf))	

;;3.c
(assert (numeros 4 3 5))

(defrule unNumDivididoLaMultiplicacionDeOtrosDos (numeros ?x ?y ?z) 
	=> (printout t "El resultado de (R) / (D * E) es: " (/ ?x (* ?y ?z)) crlf))

;;3.d
(assert (numeros 6 4))

(defrule unNumDivididoLaMultiplicacionDeOtrosDos (numeros ?x ?y) 
	=> (printout t "El resultado de (4 * A * C) es: " (* 4 (* ?x ?y)) crlf))

;;3.e
(assert (numeros 4 3 5 6 2 1))

(defrule divisionDeUnaSumaConUNaMultiplicacion (numeros ?u ?v ?w ?x ?y ?z) 
	=> (printout t "El resultado de (A + B) / ((C + D) * (E + F)) es: " (/ (+ ?u ?v) (* (+ ?w ?x) (+ ?y ?z))) crlf))


;;4
(deftemplate auto
(slot marca (type STRING))
(slot modelo (type STRING))
(slot año_patentamiento (type NUMBER) (range 1900 2100))
(slot uso (type SYMBOL) (allowed-symbols Profesional Particular))
(slot radicado (type SYMBOL) (allowed-symbols Buenos_Aires Chubut Capital_Federal Santa_Fe Cordoba))
(slot patente (type STRING)))

(deftemplate impuesto_automotor_provincial
(slot patente (type STRING))
(slot Paga (type SYMBOL) (allowed-symbols SI NO)))}


(defrule paga_patente 
	(auto 
		(uso ?uso)
		(marca ?marca)
		(modelo ?modelo)
		(año_patentamiento ?año)
		(radicado ?provincia)
		(patente ?patente))
	
	(auto 
		(uso particular)
		(test (< ?año 2002))
		=> assert (impuesto_automotor_provincial(patente ?patente)(paga NO)))
		
	(auto
		(uso particular)
		(test (< ?año 2007))		
		(test (!= ?provincia chubut))
		=> assert (impuesto_automotor_provincial(patente ?patente)(paga NO)))
)

;;6
;;6.a
(deftemplate tiene_rango
	(slot nombre)
	(slot rango)
)

(deffacts base_de_rangos
	(tiene_rango (nombre "bush") (rango "coronel"))
	(tiene_rango (nombre "komehini") (rango "soldado"))
	(tiene_rango (nombre "kadafi") (rango "soldado"))
	(tiene_rango (nombre "fujimori") (rango "soldado"))
	(tiene_rango (nombre "gonzalez") (rango "capitan"))
	(tiene_rango (nombre "gorbachov") (rango "general"))
	(tiene_rango (nombre "chirac") (rango "cabo"))
	(tiene_rango (nombre "hussein") (rango "sargento"))
	(tiene_rango (nombre "ford") (rango "teniente"))
	(tiene_rango (nombre "arafat") (rango "mayor"))
)

(defrule identificar-rango 
	(tiene_rango (nombre $?nombre-buscar) (rango $?rango))
	(test (subsetp $?nombre-buscar $?nombre))
	=> 
	(printout t "La persona: " ?nombre-buscar " tiene el siguiente rango: " ?rango crlf)
)


;;10

(deftemplate especie_pajaro
	(slot nombre_especie)
	(slot sexo)
	(slot colorAlas)
	(slot colorCabeza)
	(slot colorPecho)
	(slot colorCola)
	(slot long-min-max)
	(slot enverg-min-max))

(deftemplate subespecie_pajaro
	(slot nombre_especie)
	(slot sexo)
	(slot partColorAlas)
	(slot partColorCabeza)
	(slot partColorPecho)
	(slot partColorCola))


(deffacts especies_pajaros
	(especie_pajaro
		(nombre_especie Jilguero)
		(sexo Macho)
		(colorAlas Amarillo_olivaceo)
		(colorCabeza Amarillo_olivaceo)
		(colorPecho Amarillo_olivaceo)
		(colorCola Amarillo_olivaceo)
		(long-min-max 13)
		(enverg-min-max 23))
	(especie_pajaro
		(nombre_especie Cardenal)
		(sexo Macho)
		(colorAlas Negro)
		(colorCabeza Rojo)
		(colorPecho Blanco)
		(colorCola Negro)
		(long-min-max 13)
		(enverg-min-max 23))

)



(deffacts subespecies_pajaros
	(subespecie_pajaro
		(nombre_especie Jilguero_dorado)
		(sexo Macho)
		(partColorAlas Oscuro)
		(partColorCabeza Intenso)
		(partColorPecho Oscuro)
		(partColorCola Intenso)))



(defrule esp_jilguero
	(especie_pajaro
		(nombre_especie ?nombre) 
		(sexo ?sexo)
		(colorAlas ?colorAlas)
		(colorCabeza ?colorCabeza)
		(colorPecho ?colorPecho)
		(colorCola ?colorCola)
		(long-min-max ?long)
		(enverg-min-max ?enverg))

	(especie_pajaro(sexo Macho) 
		(colorAlas Amarillo_olivaceo) 
		(colorCabeza Amarillo_olivaceo)
		(colorPecho Amarillo_olivaceo) 
		(colorCola Amarillo_olivaceo))
	(test (> ?long 12))
	(test (< ?long 13.5))
	(test (> ?enverg 21)) 
	(test (< ?enverg 25)) 

	=>
	(assert(especie Jilguero)))

(defrule subesp_jilguero
	(subespecie_pajaro
		(nombre_especie ?nombre)
		(sexo ?sexo)
		(partColorAlas ?partColorAlas)
		(partColorCabeza ?partColorCabeza)
		(partColorPecho ?partColorPecho)
		(partColorCola ?partColorCola))
	
	(subespecie_pajaro
		(sexo Macho)
		(partColorAlas Oscuro)
		(partColorCabeza Intenso)
		(partColorPecho Oscuro)
		(partColorCola Intenso))

	(especie Jilguero)
	=>
	(assert(subespecie Jilguero_dorado)))


(defrule mostrar_resultado
	(subespecie ?x)
	=>
	(printout t "La subespecie es :" ?x crlf))