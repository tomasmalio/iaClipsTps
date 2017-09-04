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
	(tiene_rango (nombre ?nombre-buscar) (rango ?rango))
	(test (subsetp ?nombre-buscar ?nombre))
	=> 
	(printout t "La persona: " ?nombre-buscar " tiene el siguiente rango: " ?rango crlf)
)