;;Ejercicio Práctico / Realizado en Clase 25/09/2017

(deftemplate animal
	(slot Caso)
	(slot Sangre (type SYMBOL)
		(allowed-values Fria Caliente NoSe)
		(default Nose)
	)
	(slot Habitat (type SYMBOL)
		(allowed-values Alcantarrillas Selva Arbol Tierra Mar Rio NoSe)
		(default NoSe)
	)
	(slot Come (type SYMBOL)

	)
	(slot Status (type SYMBOL)

	)
)


(deftemplate Clasificacion
	(slot Caso)
	(slot Familia (type SYMBOL)

	)
)


(deffacts Caso1
	(animal (caso 1) (Sangre Fria) (Piel Escamado) (Andar Nada) (Habitat Mar))
	(clasificacion (caso 1))
)


;; Regla de Ejemplo
(defrule Carnivoro
	(animal (Come Carne) (caso ?id)) ?A <- (Clasificacion (caso ?id) (Alimentacion NoSe))
	=>
	(modify ?A (Alimentacion Carnivoro))
)



;; 3.
(defrule AnimalAveTerrestre
	(Animal 
		(Sangre Caliente) 
		(Caso ?id)
		(Piel Emplumado)
		(Habitab Tierra)
		(Andar (or(Camina Nada)))
		(Tamanio Mediano)
	)
	?A <- (Clasificacion (Caso ?id) (Familia NoSe) (SubFamiliaAve NoSe))
	=> 
	(modiy ?A (Familia Ave) (SubFamiliaAve Terrestre))
)

;; 4.
(defrule PezDeMar
	(animal 
		(Sangre Fria)
		(Piel Escamada)
		(Habitab mar)
		(Andar Nada)
		(Caso ?id)
	)
	?A <- (Clasifacion (Caso ?id) (SubFamilia Nose)))
	=> (modify ?A (Familia Pez) (SubFamilia Mar))
)

;; 6.
(defrule Ej6
	(Animal 
		(Come Plantas)
		(Caso ?id)
	)
	?A <- (Clasificacion (Caso ?id) (Alimentacion NoSe))
	=> (modify ?A (Alimentacion Hervivoro))
)

;; 8.

(defrule Salmon
	?A <- (Clasificacion 
			(SubFamiliaPez AguaDulce)
			(Nombre NoSe)
			(Caso ?id)
	)
	(Animal
		(Color Rosa)
		(Caso ?id)
	)
	=> (modify ?A (Nombre Salmon))
)

;; 9.
(defrule Salmon
	(Animal 
		(Caso ?id)
		(Color Rosa)
	)
	?A <- (Clasificacion (Caso ?id) (Familia Pez) (SubFamiliaPez Mar) (Nombre NoSe))
	=> (modify ?A (Nombre Salmon))
)

;; 11
(defrule ej11
	(Animal
		(Come Carne)
		(Caso ?id)
		(Status Predador)
		(Tamanio Grande)
		(Habitat Selva)
		(Cola Larga_y_Peluda)
	)
	?A <-  (Clasificacion (SubFamiliaMamifero Felno) (Caso ?id) (Nombre NoSe))
	=> (modify ?A (Nombre Tigre))
)

;; 12
(defrule Ej12
	(Animal 
		(Caso ?id)
		(Tamanio Mediano)
		(Cola Larga_y_Peluda)
	)
	?A <- (Clasificacion
			(Caso ?id)
			(SubMamifero Felino)
			(Alimentacion Carnivoro)
			(Nombre NoSe)
		)
	)
	=> (modify ?A (Nombre Gato))
)

;; 14
(defrule Roedor
	?A <- (Clasificacion 
			(Familia Mamifero)
			(Alimentacion Herbivoro)
			(SubFamiliaMamofero NoSe)
			(Caso ?id)
		)
	)
	(Animal 
		(Caso ?id)
		(Status plaga)
	)
	=> (modify ?A (SubFamiliaMamifero Roedor))
)

;; 15
(defrule Ej15
	?A <- (Clasificacion 
		(SubFamiliaMamifero Roedor) 
		(Caso ?id) 
		(Nombre NoSe)
	)
	(Animal 
		(Cola Torta_y_Fina)
		(Habitab Alcantarrilla)
		(Caso ?id)
	)
	=> (modify ?A (Nombre Rata))
)

;; 16
(defrule Ardilla_Gris
	(Animal
		(Caso ?id)
		(Tamanio Pequenio)
		(Cola Larga_y_Peluda)
		(Color Gris)
	)
	?A <- (Clasificacion 
			(Caso ?id)
			()
		)
	=> (modify ?A ())
)