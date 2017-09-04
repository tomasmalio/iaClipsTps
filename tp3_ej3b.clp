;;3.b
(assert (numeros 4 3 5))

(defrule sumarDosNumPorUnNum (numeros ?x ?y ?z) 
	=> (printout t "El resultado de (A + B) * C es: " (* (+ ?x ?y) ?z) crlf))