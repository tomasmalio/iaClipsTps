;;6.b.
(deffacts base_de_jefes
	es_jefe_de (jefe "general") (de "coronel"))
	es_jefe_de (jefe "coronel") (de "mayor"))
	es_jefe_de (jefe "mayor") (de "capitán"))
	es_jefe_de (jefe "capitán") (de "teniente"))
	es_jefe_de (jefe "teniente") (de "sargento"))
	es_jefe_de (jefe "sargento") (de "cabo"))
	es_jefe_de (jefe "cabo") (de "soldado"))
)

(defrule identificar-si-es-jefe 
	(tiene_rango (nombre ?quien-es-jefe) (rango $?rango))
	(tiene_rango (nombre ?es-subdito) (rango $?rango))
	=> 
	(printout t "La persona: " ?nombre-buscar " tiene el siguiente rango: " ?rango crlf)
)