(defglobal ?*ENCONTROCULTURAL* = FALSE)
(defglobal ?*ENCONTROAVENTURA* = FALSE)
(defglobal ?*ENCONTROFIESTA* = FALSE)
(defglobal ?*ENCONTRORELAX* = FALSE)
(defglobal ?*FILTRO* = FALSE)

(deftemplate subtipos
	(multislot valores)
)

(deftemplate filtro
	(multislot valores)
)

(deftemplate resultado
	(slot nombre)
	(slot lat)
	(slot lon)
)

(deftemplate Destino
	(slot nombre)
	(slot lat)
	(slot long)
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
	(multislot culturales
		(allowed-values Museos Lugares_Historicos Fotografia Conocer_Ciudad Gastronomia NoSe))
	(multislot aventura
		(allowed-values Acuaticas Treking Cabalgata Buceo NoSe))
	(multislot relax
		(allowed-values Descanso Pesca Gastronomia Fotografia NoSe))
	(multislot fiesta
		(allowed-values Nocturna Gastronomia NoSe))		
)
(deftemplate Mes_Viaje
	(slot nombre (type SYMBOL)
		(allowed-values Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre NoSe)
		(default NoSe))
)

(deftemplate Presupuesto
	(slot alcance (type SYMBOL)
		(allowed-values Bajo Moderado Alto NoSe))
)

(deftemplate Temporada
	(slot tipo (type SYMBOL)
		(allowed-values Alta Media Baja NoSe))
)

;; Me define la edad del viajero en función de su rango de edad
(deftemplate Viajero_Edad
	(slot categoria
		(allowed-values Joven Adulto Mayor NoSe))
)

;; R.1
;; R.1.1
(defrule R_TEMPORADA_ALTA_1
	(Mes_Viaje
		(nombre Noviembre))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Alta))
)

;; R.1.2
(defrule R_TEMPORADA_ALTA_2
	(Mes_Viaje
		(nombre Diciembre))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Alta))
)

;; R.1.3
(defrule R_TEMPORADA_ALTA_3
	(Mes_Viaje
		(nombre Enero))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Alta))
)

;; R.1.4
(defrule R_TEMPORADA_ALTA_4
	(Mes_Viaje
		(nombre Febrero))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Alta))
)

;; R.1.5
(defrule R_TEMPORADA_ALTA_5
	(Mes_Viaje
		(nombre Marzo))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Alta))
)

;; Fin R.1

;; R.2
;; R.2.1
(defrule R_TEMPORADA_MEDIA_1
	(Mes_Viaje
		(nombre Abril))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Media))
)

;; R.2.2
(defrule R_TEMPORADA_MEDIA_2
	(Mes_Viaje
		(nombre Octubre))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Media))
)

;; Fin R.2

;; R.3
;; R.3.1
(defrule R_TEMPORADA_BAJA_1
	(Mes_Viaje
		(nombre Mayo))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Baja))
)

;; R.3.2
(defrule R_TEMPORADA_BAJA_2
	(Mes_Viaje
		(nombre Junio))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Baja))
)

;; R.3.3
(defrule R_TEMPORADA_BAJA_3
	(Mes_Viaje
		(nombre Julio))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Baja))
)

;; R.3.4
(defrule R_TEMPORADA_BAJA_4
	(Mes_Viaje
		(nombre Agosto))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Baja))
)

;; R.3.5
(defrule R_TEMPORADA_BAJA_5
	(Mes_Viaje
		(nombre Septiembre))
	?a <- (Temporada (tipo NoSe))	
	=>	(modify ?a (tipo Baja))
)

;; Fin R.3


;; R.4
;; R.4.1
(defrule R_PRESUPUESTO_BAJO
	(Viajero
		(dinero ?d))
	(test (>= ?d 5000))
	(test (<= ?d 10000))
	?a <- (Presupuesto (alcance NoSe))	
	=>	(modify ?a (alcance Bajo))
)

;; R.4.2
(defrule R_PRESUPUESTO_MEDIO
	(Viajero
		(dinero ?d))
	(test (>= ?d 10001))
	(test (<= ?d 20000))
	?a <- (Presupuesto (alcance NoSe))	
	=>	(modify ?a (alcance Moderado))
)

;; R.4.3
(defrule R_PRESUPUESTO_ALTO
	(Viajero
		(dinero ?d))
	(test (>= ?d 20001)) 
	?a <- (Presupuesto (alcance NoSe))	
	=>	(modify ?a (alcance Alto))
)

;; R.5
;; R.5.1
(defrule R_EDAD_JOVEN
	(Viajero
		(edad ?e))
	(test (>= ?e 18))
	(test (<= ?e 35))
	?a <- (Viajero_Edad (categoria NoSe))	
	=>	(modify ?a (categoria Joven))
)

;; R.5.2
(defrule R_EDAD_ADULTO_1
	(Viajero
		(edad ?e))
	(test (> ?e 35))
	(test (<= ?e 50))
	?a <- (Viajero_Edad (categoria NoSe))	
	=>	(modify ?a (categoria Adulto))
)

;; R.5.3
(defrule R_EDAD_ADULTO_2
	(Viajero
		(edad ?e))
	(test (> ?e 50))
	?a <- (Viajero_Edad (categoria NoSe))	
	=>	(modify ?a (categoria Mayor))
)

;; Fin R.5

;; R.6
;; R.6.1
(defrule R_DESTINOS_FAMILIARES
	(Viajero_Edad
		(categoria ?c))
	(test (or(eq ?c Adulto) (eq ?c Mayor)))
	(Viajero
		(acompaniantes ?a))
	(test (or(eq ?c Familia) (eq ?c Pareja)))
	?b <- (Destino (tipo NoSe))	
	=>	(modify ?b (tipo Familiares))
)

;; R.6.2
(defrule R_DESTINOS_JOVENES
	(Viajero_Edad
		(categoria ?c))
	(test (or(eq ?c Joven) (eq ?c Mayor)))
	(Viajero
		(acompaniantes ?a))
	(test (or(eq ?c Solo) (eq ?c Amigos)))
	?b <- (Destino (tipo NoSe))	
	=>	(modify ?b (tipo Jovenes))
)

;; R.6.3
(defrule R_DESTINOS_3ERA_EDAD
	(Viajero_Edad
		(categoria ?c))
	(test (eq ?c Mayor))
	(Viajero
		(acompaniantes ?a))
	(test (eq ?c Pareja))
	?b <- (Destino (tipo NoSe))	
	=>	(modify ?b (tipo Tercera_Edad))
)

;; R.6.4
(defrule R_DESTINOS_SOLAS_Y_SOLOS
	(Viajero_Edad
		(categoria ?c))
	(test (or(eq ?c Adulta) (eq ?c Mayor)))
	(Viajero
		(acompaniantes ?a))
	(test (eq ?c Solo))
	?b <- (Destino (tipo NoSe))	
	=>	(modify ?b (tipo Solas_y_Solos))
)

;; R.6.5
(defrule R_DESTINOS_AVENTURAS	
	(Actividad
		(aventura ?a))
	(test (or(eq ?a Acuaticas) (eq ?a Treking) (eq ?a Cabalgata)))
	?b <- (Destino (tipo NoSe))	
	=>	(modify ?b (tipo Aventura))
)



(defrule R_DESTINOS_CULTURALES
	(Actividad
		(culturales $?c))
	?s <-(subtipos (valores $?v))
	?d <-(filtro (valores $?tipo))
	(test (eq ?*ENCONTROCULTURAL* FALSE))
=>	(loop-for-count(?x 1 5)
		(bind ?val (nth$ ?x $?v))
		(if(member$ ?val $?c)
			then
			(printout t "esta " ?val crlf)
			(bind ?new (delete$ $?v ?x ?x))
			(bind ?*ENCONTROCULTURAL* TRUE)
		)
	)
	(if (eq ?*ENCONTROCULTURAL* TRUE)
		then
		(modify ?s (valores ?new))
		(modify ?d (valores $?tipo Culturales))
	)
)


(defrule R_DESTINOS_AVENTURAS_2
	(Actividad
		(aventura $?c))
	?s <-(subtipos (valores $?v))
	?d <-(filtro (valores $?tipo))
	(test (eq ?*ENCONTROAVENTURA* FALSE))
=>	(loop-for-count(?x 1 5)
		(bind ?val (nth$ ?x $?v))
		(if(member$ ?val $?c)
			then
			(printout t "esta " ?val crlf)
			(bind ?new (delete$ $?v ?x ?x))
			(bind ?*ENCONTROAVENTURA* TRUE)
		)
	)
	(if (eq ?*ENCONTROAVENTURA* TRUE)
		then
		(modify ?s (valores ?new))
		(modify ?d (valores $?tipo Aventura))
	)
)

(defrule R_DESTINOS_FIESTA_2
	(Actividad
		(fiesta $?c))
	?s <-(subtipos (valores $?v))
	?d <-(filtro (valores $?tipo))
	(test (eq ?*ENCONTROFIESTA* FALSE))
=>	(loop-for-count(?x 1 5)
		(bind ?val (nth$ ?x $?v))
		(if(member$ ?val $?c)
			then
			(printout t "esta " ?val crlf)
			(bind ?new (delete$ $?v ?x ?x))
			(bind ?*ENCONTROFIESTA* TRUE)
		)
	)
	(if (eq ?*ENCONTROFIESTA* TRUE)
		then
		(modify ?s (valores ?new))
		(modify ?d (valores $?tipo Fiesta))
	)
)

(defrule R_DESTINOS_RELAX_2
	(Actividad
		(fiesta $?c))
	?s <-(subtipos (valores $?v))
	?d <-(filtro (valores $?tipo))
	(test (eq ?*ENCONTRORELAX* FALSE))
=>	(loop-for-count(?x 1 5)
		(bind ?val (nth$ ?x $?v))
		(if(member$ ?val $?c)
			then
			(printout t "esta " ?val crlf)
			(bind ?new (delete$ $?v ?x ?x))
			(bind ?*ENCONTRORELAX* TRUE)
		)
	)
	(if (eq ?*ENCONTRORELAX* TRUE)
		then
		(modify ?s (valores ?new))
		(modify ?d (valores $?tipo Relax))
	)
)


(defrule CREAR_RESULTADO
	(filtro (valores $?v))
	(Destino (nombre ?n)(lat ?lt)(long ?ln)(tipo $?t))
=>
	(loop-for-count (?x 1 2)
		(bind ?val (nth$ ?x $?v))
		(if(member$ ?val $?t)
			then
			;;(printout t "encuentra " ?val crlf)
			(bind ?*FILTRO* TRUE)
			else
			(if (neq ?val nil)
				then
					;;(printout t "no encuentra " ?val crlf)
					(bind ?*FILTRO* FALSE)
			)
		)
	)
	(if (eq ?*FILTRO* TRUE)
		then
		(assert (resultado(nombre ?n)(lat ?lt)(lon ?ln)))
		)
)