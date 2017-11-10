(defglobal ?*ENCONTROCULTURAL* = FALSE)
(defglobal ?*ENCONTROAVENTURA* = FALSE)
(defglobal ?*ENCONTROFIESTA* = FALSE)
(defglobal ?*ENCONTRORELAX* = FALSE)

(defglobal ?*ENCONTROJOVENES* = FALSE)
(defglobal ?*ENCONTROFAMILIARES* = FALSE)
(defglobal ?*ENCONTROTERCERAEDAD* = FALSE)
(defglobal ?*ENCONTROSOLASYSOLOS* = FALSE)

(defglobal ?*ENCONTRADOGASOLEROS* = FALSE)
(defglobal ?*ENCONTRADOINTERMEDIOS* = FALSE)
(defglobal ?*ENCONTRADOLUJOSOS* = FALSE)

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
	(slot nombre (type STRING))
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
	(slot categoria (type SYMBOL) 
		(allowed-values Joven Adulto Mayor NoSe) 
	)
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
		(edad ?e)
	)
	(test 
		(> ?e 50)
	)
	?a <- (Viajero_Edad (categoria NoSe))	
	=>	(modify ?a (categoria Mayor))
)

;; Fin R.5

;; R.6
;; R.6.1
(defrule R_DESTINOS_FAMILIARES
	(Viajero_Edad
		(categoria ?c)
	)
	(Viajero
		(acompaniantes ?a)
	)
	(test 
		(or
			(eq ?c Adulto)
			(eq ?c Mayor)
		)
	)
	(test
		(or
			(eq ?a Familia)
			(eq ?a Pareja)
		)
	)
	?d <-(filtro (valores $?tipo))
;;	(test (eq ?*ENCONTROFAMILIARES* FALSE))
	=>	
;;		(if (eq ?*ENCONTROFAMILIARES* FALSE)
;;			then
;;				(bind ?*ENCONTROFAMILIARES* TRUE)
				(modify ?d (valores $?tipo Familiares))
;;		)
)

;; R.6.2
(defrule R_DESTINOS_JOVENES
	(Viajero_Edad
		(categoria ?c)
	)
	(Viajero
		(acompaniantes ?a)
	)
	(test 
		(or
			(eq ?c Joven)
			(eq ?c Mayor)
		)
	)
	(test
		(or
			(eq ?a Solo)
			(eq ?a Amigos)
		)
	)
	?d <-(filtro (valores $?tipo))
;;	(test (eq ?*ENCONTROJOVENES* FALSE))
	=>	
		(if (eq ?*ENCONTROJOVENES* FALSE)
			then
				(bind ?*ENCONTROJOVENES* TRUE)
				(modify ?d (valores $?tipo Jovenes))
		)
)

;; R.6.3
(defrule R_DESTINOS_3ERA_EDAD
	(Viajero_Edad
		(categoria ?c)
	)
	(Viajero
		(acompaniantes ?a)
	)
	(test 
		(eq ?c Mayor)
	)	
	(test
		(eq ?a Pareja)
	)
	?d <-(filtro (valores $?tipo))
;;	(test (eq ?*ENCONTROTERCERAEDAD* FALSE))
	=>	
;;		(if (eq ?*ENCONTROTERCERAEDAD* FALSE)
;;			then
;;				(bind ?*ENCONTROTERCERAEDAD* TRUE)
				(modify ?d (valores $?tipo Tercera_Edad))
;;		)
)

;; R.6.4
(defrule R_DESTINOS_SOLAS_Y_SOLOS
	(Viajero_Edad
		(categoria ?c)
	)
	(Viajero
		(acompaniantes ?a)
	)
	(test 
		(or
			(eq ?c Adulta)
			(eq ?c Mayor)
		)
	)
	(test
		(eq ?c Solo)
	)
	?d <-(filtro (valores $?tipo))
;;	(test (eq ?*ENCONTROSOLASYSOLOS* FALSE))
	=>	
;;		(if (eq ?*ENCONTROSOLASYSOLOS* FALSE)
;;			then
;;				(bind ?*ENCONTROSOLASYSOLOS TRUE)
				(modify ?d (valores $?tipo Solas_y_Solos))
;;		)
)

;; R.6.5
;;(defrule R_DESTINOS_AVENTURAS	
;;	(Actividad
;;		(aventura ?a)
;;	)
;;	(test 
;;		(or
;;			(eq ?a Acuaticas)
;;			(eq ?a Treking)
;;			(eq ?a Cabalgata)
;;		)
;;	)
;;	?b <- (Destino (tipo NoSe))	
;;	=>	(modify ?b (tipo Aventura))
;;)

;; R.6.6
(defrule R_DESTINOS_CULTURALES
	(Actividad
		(culturales $?c)
	)
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

;; R.6.7
(defrule R_DESTINOS_AVENTURAS_2
	(Actividad
		(aventura $?c)
	)
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

;; R.6.8
(defrule R_DESTINOS_FIESTA_2
	(Actividad
		(fiesta $?c)
	)
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

;; R.6.9
(defrule R_DESTINOS_RELAX_2
	(Actividad
		(relax $?c))
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

;; R.7.1
(defrule R_DESTINOS_LUJOSOS
	(Temporada
		(tipo ?c)
	)
	(Presupuesto
		(alcance ?a)
	)
	(test
		(or
			(eq ?c Baja)
			(eq ?c Media)
		)
	)
	(test
		(eq ?a Alto)
	)
	?d <- (filtro (valores $?tipo))
	(test (eq ?*ENCONTRADOLUJOSOS* FALSE))
	=> 
		(modify ?d (valores $?tipo Lujosos))
		(bind ?*ENCONTRADOLUJOSOS* TRUE)
)

;; R.7.2
(defrule R_DESTINOS_INTERMEDIOS
	(Temporada
		(tipo ?c)
	)
	(Presupuesto
		(alcance ?a)
	)
	(test
		(eq ?c Alta)
	)
	(test
		(eq ?a Medio)
	)
	?d <- (filtro (valores $?tipo))
	(test (eq ?*ENCONTRADOINTERMEDIOS* FALSE))
	=> 
		(modify ?d (valores $?tipo Intermedios))
		(bind ?*ENCONTRADOINTERMEDIOS* TRUE)
)

;; R.7.2
(defrule R_DESTINOS_GASOLEROS
	(Temporada
		(tipo ?c)
	)
	(Presupuesto
		(alcance ?a)
	)
	(test
		(or
			(eq ?c Media)
			(eq ?c Alta)
		)
	)
	(test
		(eq ?a Bajo)
	)
	?d <- (filtro (valores $?tipo))
	(test (eq ?*ENCONTRADOGASOLEROS* FALSE))
	=> 
		(modify ?d (valores $?tipo Gasoleros))
		(bind ?*ENCONTRADOGASOLEROS* TRUE)
)

;; R.8
(defrule CREAR_RESULTADO
	(filtro (valores $?v))
	(Destino (nombre ?n)(lat ?lt)(long ?ln)(tipo $?t))
=>
	(loop-for-count (?x 1 1)
		(bind ?val (nth$ ?x $?v))
		(if(member$ ?val $?t)
			then
			(printout t "encuentra " ?val crlf)
			(bind ?*FILTRO* TRUE)
			else
			(if (neq ?val nil)
				then
					(printout t "no encuentra " ?val crlf)
					(bind ?*FILTRO* FALSE)
			)
		)
		(if (eq ?*FILTRO* TRUE)
		then
		(assert (resultado(nombre ?n)(lat ?lt)(lon ?ln)))
		(bind ?*FILTRO* FALSE)
		)
	)
	
)