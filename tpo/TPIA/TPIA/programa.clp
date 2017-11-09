(defmodule MAIN (export ?ALL))

(deftemplate destino
	(slot nombre)
	(multislot tipo (type SYMBOL)
		(allowed-values Familiares Jovenes Tercera_Edad Solas_y_Solos Culturales Relax Fiesta Intermedios Gasoleros Lujosos NoSe)
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
	(slot culturales
		(allowed-values Museos Lugares_Historicos Fotografia Conocer_Ciudad Gastronomia NoSe)
		(default NoSe))
	(slot aventura
		(allowed-values Acuaticas Treking Cabalgata Buceo NoSe)
		(default NoSe))
	(slot relax
		(allowed-values Descanso Pesca Gastronomia Fotografia NoSe)
		(default NoSe))
	(slot fiesta
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

