(defmodule MAIN (export ?ALL))

(defglobal ?*ENCONTROCULTURAL* = FALSE)
(defglobal ?*ENCONTROAVENTURA* = FALSE)
(defglobal ?*ENCONTROFIESTA* = FALSE)
(defglobal ?*ENCONTRORELAX* = FALSE)

(deftemplate destino
	(slot nombre)
	(multislot tipo (type SYMBOL)
		(allowed-values Familiares Jovenes Tercera_Edad Solas_y_Solos Culturales Relax Fiesta Aventura Intermedios Gasoleros Lujosos NoSe)
		(default NoSe))
)

(deftemplate viajero
	(slot caso)
	(slot edad)
	(slot dinero)
	(slot acompaniantes
		(allowed-values Familia Amigos Pareja Solo NoSe)
		(default NoSe))
)

(deftemplate actividad
	(slot caso)
	(multislot culturales
		(allowed-values Museos Lugares_Historicos Fotografia Conocer_Ciudad Gastronomia NoSe)
		(default NoSe))
	(multislot aventura
		(allowed-values Acuaticas Treking Cabalgata Buceo NoSe)
		(default NoSe))
	(multislot relax
		(allowed-values Descanso Pesca Gastronomia Fotografia NoSe)
		(default NoSe))
	(multislot fiesta
		(allowed-values Nocturna Gastronomia NoSe)
		(default NoSe))		
)

(deftemplate mes_viaje
	(slot caso)
	(slot nombre (type SYMBOL)
		(allowed-values Enero Febre Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre NoSe)
			(default NoSe))
	)


(deftemplate presupuesto
	(slot caso)
	(slot alcance
		(allowed-values Bajo Moderado Alto NoSe)
		(default NoSe))
)

(deftemplate temporada
	(slot caso)
	(slot tipo (type SYMBOL)
		(allowed-values Alta Media Baja NoSe)
		(default NoSe))
)

(defrule rtemporadaalta
	(mes_viaje
		(caso ?id)
		(nombre Noviembre))
	?a <- (temporada (caso ?id) (tipo NoSe))	
	=>	(modify ?a (tipo Alta))
)


(deftemplate culturales
(multislot valores
		(allowed-values Museos Lugares_Historicos Fotografia Conocer_Ciudad Gastronomia NoSe)
		(default NoSe)))
(deftemplate aventura
(multislot valores
		(allowed-values Acuaticas Treking Cabalgata Buceo NoSe)
		(default NoSe)))
(deftemplate relax
(multislot valores
		(allowed-values Descanso Pesca Gastronomia Fotografia NoSe)
		(default NoSe)))
(deftemplate fiesta
(multislot valores
		(allowed-values Nocturna Gastronomia NoSe)
		(default NoSe)))


(defrule p_cultura
	(actividad 
		(culturales $?c))
	?culturales <-(culturales (valores $?v))
	(test
		(subsetp $?v $?c)
	)
   	?a <- (destino (tipo $?tipo))
=> (modify ?a (tipo $?tipo Culturales))
	(retract ?culturales)
)	

(defrule p_aventura
	(actividad 
		(aventura $?av))
	?aven <-(aventura (valores $?v))
	(test
		(subset $?v $?av)
	)
   	?a <- (destino (tipo $?tipo))
=> (modify ?a (tipo $?tipo Aventura))
	(retract ?aven)
)

(defrule p_fiesta
	(actividad 
		(fiesta $?f))
	?fiesta <-(fiesta (valores $?v))
	(test
		(subset $?v $?f)
	)
   	?a <- (destino (tipo $?tipo))
=> (modify ?a (tipo $?tipo Fiesta))
	(retract ?fiesta)
)	

(defrule p_relax
	(actividad 
		(relax $?r))
	?relax <-(relax (valores $?v))
	(test
		(subset $?v $?r)
	)
   	?a <- (destino (tipo $?tipo))
=> (modify ?a (tipo $?tipo Relax))
	(retract ?relax)
)	

(deftemplate subtipos
(multislot valores))


;;(defrule prueba
;;	(actividad
;;		(culturales $?c))
;;	?s <-(subtipos (valores $?v))
;;	?d <-(destino (tipo $?tipo))
;;=>	(loop-for-count(?x 1 5)
;;		(bind ?val (nth$ ?x $?v))
;;		(if(member$ ?val $?c)
;;			then
;;			(printout t "esta " ?val crlf)
;;			(bind ?new (delete$ $?v ?x ?x))
;;			(modify ?s (valores ?new))
;;			(bind ?add (insert$ $?tipo ?x ?val))
;;			(modify ?d (tipo ?add))
;;		)
;;	)
;;	
;;)


(defrule prueba3
	(actividad
		(culturales $?c))
	?s <-(subtipos (valores $?v))
	?d <-(destino (tipo $?tipo))
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
		(modify ?d (tipo $?tipo Culturales))
	)
)



(deffacts datos 
	(Actividad
		(culturales Museos Lugares_Historicos Fotografia Conocer_Ciudad Gastronomia NoSe)
		(aventura Acuaticas Treking Cabalgata Buceo NoSe)
		(relax Descanso Pesca Gastronomia Fotografia NoSe)
		(fiesta Nocturna Gastronomia NoSe)
		)
	(Destino (nombre Cancun) (tipo NoSe))
	(subtipos (valores Museos Lugares_Historicos Nocturna))
)


		
;;(assert (destino (nombre Cancun) (tipo NoSe)))
;;(assert (actividad (culturales Museos Lugares_Historicos Fotografia) (fiesta Nocturna Gastronomia)))
;;(assert (culturales (valores Museos)))
;;(assert (fiesta (valores Nocturna)))