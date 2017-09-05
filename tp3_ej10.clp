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