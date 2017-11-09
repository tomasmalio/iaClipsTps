;; Defacts Lista de Destino
(deffacts listadoDestino
	(Destino
		(nombre "San Pedro,	Belice")
		(lat 17.9213664)
		(long -87.9610905)
		(tipo Familiares Tercera_Edad Relax Culturales Intermedios)
	)
	(Destino
		(nombre "San Ignacio, Belice")
		(lat 17.1493796)
		(long -89.0950711)
		(tipo Familiares Tercera_Edad Relax Culturales Gasoleros Intermedios)
	)
	(Destino
		(nombre "Santa Teresa, Costa Rica")
		(lat 9.6457055)
		(long -85.1776028)
		(tipo Familiares Tercera_Edad Jovenes Relax Culturales Gasoleros Intermedios)
	)
	(Destino
		(nombre "San Jose, Costa Rica")
		(lat 9.9356124)
		(long -84.1483647)
		(tipo Familiares Tercera_Edad Jovenes Solas_y_Solos Culturales Fiesta Aventura Intermedios Lujosos)
	)
	(Destino
		(nombre "La Fortuna de San Carlos, Costa Rica")
		(lat 10.4699401)
		(long -84.6491431)
		(tipo Familiares Tercera_Edad Jovenes Culturales Intermedios Lujosos)
	)
	(Destino
		(nombre "Tamarindo, Costa Rica")
		(lat 10.3008885)
		(long -85.8468247)
		(tipo Familiares Tercera_Edad Relax Culturales Intermedios Gasoleros)
	)
	(Destino
		(nombre "La Habana, Cuba")
		(lat 23.0506249)
		(long -82.4730894)
		(tipo Familiares Tercera_Edad Solas_y_Solos Culturales Intermedios Gasoleros)
	)
	(Destino
		(nombre "Varadero, Cuba")
		(lat 23.1677032)
		(long -81.2849702)
		(tipo Familiares Tercera_Edad Solas_y_Solos Jovenes Aventura Relax Intermedios Lujosos)
	)
	(Destino
		(nombre "Santiago de Cuba, Cuba")
		(lat 20.0243223)
		(long -75.8961375)
		(tipo Tercera_Edad Culturales Intermedios)
	)
	(Destino
		(nombre "Antigua Guatemala, Guatemala")
		(lat 14.5591436)
		(long -90.7513299)
		(tipo Familiares Culturales Culturales Intermedios Lujosos)
	)
	(Destino
		(nombre "Copan, Honduras")
		(lat 14.8460772)
		(long -89.1681294)
		(tipo Jovenes Culturales Aventura Gasoleros)
	)
	(Destino
		(nombre "West End, Honduras")
		(lat 16.3033687)
		(long -86.6008902)
		(tipo Jovenes Culturales Gasoleros)
	)
	(Destino
		(nombre "Cancún, Mexico")
		(lat 21.1213285)
		(long -86.9192741)
		(tipo Jovenes Solas_y_Solos Aventura Fiesta Relax Intermedios Lujosos)
	)
	(Destino
		(nombre "Acapulco, Mexico")
		(lat 16.8354129)
		(long -100.0023965)
		(tipo Jovenes Solas_y_Solos Tercera_Edad Fiesta Relax Intermedios Lujosos)
	)
	(Destino
		(nombre "Puerto Vallarta, Mexico")
		(lat 20.6408576)
		(long -105.2945651)
		(tipo Familiares Culturales Relax Lujosos)
	)
	(Destino
		(nombre "Riviera Maya, Mexico")
		(lat 20.3531019)
		(long -87.6361275)
		(tipo Jovenes Familiares Solas_y_Solos Tercera_Edad Culturales Relax Fiesta Aventura Lujosos)
	)
	(Destino
		(nombre "Punta Cana, Mexico")
		(lat 18.8090851)
		(long -70.6986195)
		(tipo Familiares Solas_y_Solos Tercera_Edad Relax Aventura Intermedios Lujosos)
	)
	(Destino
		(nombre "Granada, Nicaragua")
		(lat 11.9288488)
		(long -85.9773091)
		(tipo Jovenes Aventura Culturales Gasoleros)
	)
	(Destino
		(nombre "Ciudad de Panamá, Panamá")
		(lat 9.0813885)
		(long -79.5932255)
		(tipo Jovenes Familiares Solas_y_Solos Tercera_Edad Culturales Relax Fiesta Aventura Intermedios)
	)
	(Destino
		(nombre "Bayahibe, Republica Dominicana")
		(lat 18.3216406)
		(long -68.9084508)
		(tipo Tercera_Edad Relax Intermedios)
	)
	(Destino
		(nombre "San Juan, Puerto Rico")
		(lat 18.3892246)
		(long -66.1305133)
		(tipo Jovenes Familiares Solas_y_Solos Tercera_Edad Culturales Relax Fiesta Gasoleros Intermedios Lujosos)
	)
	(Destino
		(nombre "Mexico DF, Mexico")
		(lat 19.39068)
		(long -99.2837003)
		(tipo Jovenes Familiares Solas_y_Solos Culturales Fiesta Intermedios)
	)
	(Destino
		(nombre "Tikal	Guatemala")
		(lat 17.2239372)
		(long -89.6333744)
		(tipo Jovenes Culturales Aventura Gasoleros Intermedios)
	)
)


(deffacts datos 
	(Actividad
		(culturales Museos Lugares_Historicos Fotografia Conocer_Ciudad Gastronomia NoSe)
		(aventura Acuaticas Treking Cabalgata Buceo NoSe)
		(relax Descanso Pesca Gastronomia Fotografia NoSe)
		(fiesta Nocturna Gastronomia NoSe)
		)
	(filtro)
	;;esto es de prueba
	;;(subtipos (valores Museos Lugares_Historicos Nocturna Lujosos))
)
