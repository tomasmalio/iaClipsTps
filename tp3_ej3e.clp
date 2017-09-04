;;3.e
(assert (numeros 4 3 5 6 2 1))

(defrule divisionDeUnaSumaConUNaMultiplicacion (numeros ?u ?v ?w ?x ?y ?z) 
	=> (printout t "El resultado de (A + B) / ((C + D) * (E + F)) es: " (/ (+ ?u ?v) (* (+ ?w ?x) (+ ?y ?z))) crlf))