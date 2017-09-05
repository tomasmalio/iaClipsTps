;;3.c
(assert (numeros 4 3 5))

(defrule unNumDivididoLaMultiplicacionDeOtrosDos (numeros ?x ?y ?z) 
	=> (printout t "El resultado de (R) / (D * E) es: " (/ ?x (* ?y ?z)) crlf))