(deftemplate Destino
	(slot nombre)
	(multislot tipo (type SYMBOL)
		(allowed-values Familiares Jovenes Tercera_Edad Solas_y_Solos Culturales Relax Fiesta Intermedios Gasoleros Lujosos Aventura NoSe)
		(default NoSe))
)

(deftemplate Viajero
	(slot edad)
	(slot dinero)
	(slot acompaniantes
		(allowed-values Familia Amigos Pareja Solo NoSe))
)

(deftemplate Actividad
	(slot culturales
		(allowed-values Museos Lugares_Historicos Fotografia Conocer_Ciudad Gastronomia NoSe))
	(slot aventura
		(allowed-values Acuaticas Treking Cabalgata Buceo NoSe))
	(slot relax
		(allowed-values Descanso Pesca Gastronomia Fotografia NoSe))
	(slot fiesta
		(allowed-values Nocturna Gastronomia NoSe))		
)
(deftemplate Mes_Viaje)
	(slot nombre (type SYMBOL)
		(allowed-values Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre NoSe)
		(default NoSe))
)

(deftemplate Presupuesto
	(slot alcance
		(allowed-values Bajo Moderado Alto NoSe))
)

(deftemplate Temporada
	(slot tipo 
		(allowed-values Alta Media Baja NoSe))
)

;; Me define la edad del viajero en función de su rango de edad
(deftemplate Viajero_Edad
	(slot categoria
		(allowed-values Joven Adulto Mayor NoSe))
)

;; R.1
;; R.1.1
(defrule R_TEMPORADA_ALTA
	(Mes_Viaje
		(nombre Noviembre))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Alta))
)

;; R.1.2
(defrule R_TEMPORADA_ALTA
	(Mes_Viaje
		(nombre Diciembre))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Alta))
)

;; R.1.3
(defrule R_TEMPORADA_ALTA
	(Mes_Viaje
		(nombre Enero))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Alta))
)

;; R.1.4
(defrule R_TEMPORADA_ALTA
	(Mes_Viaje
		(nombre Febrero))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Alta))
)

;; R.1.5
(defrule R_TEMPORADA_ALTA
	(Mes_Viaje
		(nombre Marzo))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Alta))
)

;; Fin R.1

;; R.2
;; R.2.1
(defrule R_TEMPORADA_MEDIA
	(Mes_Viaje
		(nombre Abril))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Media))
)

;; R.2.2
(defrule R_TEMPORADA_MEDIA
	(Mes_Viaje
		(nombre Octubre))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Media))
)

;; Fin R.2

;; R.3
;; R.3.1
(defrule R_TEMPORADA_BAJA
	(Mes_Viaje
		(nombre Mayo))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Baja))
)

;; R.3.2
(defrule R_TEMPORADA_BAJA
	(Mes_Viaje
		(nombre Junio))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Baja))
)

;; R.3.3
(defrule R_TEMPORADA_BAJA
	(Mes_Viaje
		(nombre Julio))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Baja))
)

;; R.3.4
(defrule R_TEMPORADA_BAJA
	(Mes_Viaje
		(nombre Agosto))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Baja))
)

;; R.3.5
(defrule R_TEMPORADA_BAJA
	(Mes_Viaje
		(nombre Septiembre))
	?a <- (Temporada (tipo NoSe))	
	->	(Modify ?a (tipo Baja))
)

;; Fin R.3


;; R.4
;; R.4.1
(defrule R_PRESUPUESTO_BAJO
	(Viajero
		(dinero ?d
			(test 
				&:(>= ?d 5000) (<= ?d 10000)
			)
		)
	)
	?a <- (Presupuesto (alcance NoSe))	
	->	(Modify ?a (alcance Baja))
)

;; R.4.2
(defrule R_PRESUPUESTO_MEDIO
	(Viajero
		(dinero ?d
			(test 
				&:(>= ?d 10001)  (<= ?d 20000)
			)
		)
	)
	?a <- (Presupuesto (alcance NoSe))	
	->	(Modify ?a (alcance Medio))
)

;; R.4.3
(defrule R_PRESUPUESTO_ALTO
	(Viajero
		(dinero ?d
			(test 
				(>= ?d 20001) 
			)
		)
	)
	?a <- (Presupuesto (alcance NoSe))	
	->	(Modify ?a (alcance Alto))
)

;; R.5
;; R.5.1
(defrule R_EDAD_JOVEN
	(Viajero
		(edad ?e
			(test 
				&:(>= ?e 18) (<= ?e 35) 
			)
		)
	)
	?a <- (Viajero_Edad (categoria NoSe))	
	->	(Modify ?a (categoria Joven))
)

;; R.5.2
(defrule R_EDAD_ADULTO
	(Viajero
		(edad ?e
			(test 
				&:(> ?e 35) (<= ?e 50) 
			)
		)
	)
	?a <- (Viajero_Edad (categoria NoSe))	
	->	(Modify ?a (categoria Adulto))
)

;; R.5.3
(defrule R_EDAD_ADULTO
	(Viajero
		(edad ?e
			(test 
				(> ?e 50)
			)
		)
	)
	?a <- (Viajero_Edad (categoria NoSe))	
	->	(Modify ?a (categoria Mayor))
)

;; Fin R.5

;; R.6
;; R.6.1
(defrule R_DESTINOS_FAMILIARES
	(Viajero_Edad
		(categoria ?c
			(test 
				|:(eq ?c Adulto) (eq ?c Mayor)
			)
		)
	)
	(Viajero
		(acompaniantes ?a
			(test
				|:(eq ?c Familia) (eq ?c Pareja)
			)
		)
	)
	?b <- (Destino (tipo NoSe))	
	->	(Modify ?b (tipo Familiares))
)

;; R.6.2
(defrule R_DESTINOS_JOVENES
	(Viajero_Edad
		(categoria ?c
			(test 
				|:(eq ?c Joven) (eq ?c Mayor)
			)
		)
	)
	(Viajero
		(acompaniantes ?a
			(test
				|:(eq ?c Solo) (eq ?c Amigos)
			)
		)
	)
	?b <- (Destino (tipo NoSe))	
	->	(Modify ?b (tipo Jovenes))
)

;; R.6.3
(defrule R_DESTINOS_3ERA_EDAD
	(Viajero_Edad
		(categoria ?c
			(test 
				(eq ?c Mayor)
			)
		)
	)
	(Viajero
		(acompaniantes ?a
			(test
				(eq ?c Pareja)
			)
		)
	)
	?b <- (Destino (tipo NoSe))	
	->	(Modify ?b (tipo Tercera_Edad))
)

;; R.6.4
(defrule R_DESTINOS_SOLAS_Y_SOLOS
	(Viajero_Edad
		(categoria ?c
			(test 
				|:(eq ?c Adulta) (eq ?c Mayor)
			)
		)
	)
	(Viajero
		(acompaniantes ?a
			(test
				(eq ?c Solo)
			)
		)
	)
	?b <- (Destino (tipo NoSe))	
	->	(Modify ?b (tipo Solas_y_Solos))
)

;; R.6.5
(defrule R_DESTINOS_AVENTURAS	
	(Actividad
		(aventura ?a
			(test 
				|:(eq ?a Acuaticas) (eq ?a Treking) (eq ?a Cabalgata)
			)
		)
	)
	?b <- (Destino (tipo NoSe))	
	->	(Modify ?b (tipo Aventura))
)






