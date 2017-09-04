;;3.d
(assert (numeros 6 4))

(defrule unNumDivididoLaMultiplicacionDeOtrosDos (numeros ?x ?y) 
	=> (printout t "El resultado de (4 * A * C) es: " (* 4 (* ?x ?y)) crlf))