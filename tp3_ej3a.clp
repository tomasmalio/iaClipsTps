;;3.a
(assert (numeros 2 3))

(defrule sumarDosNumYDividirPorRestaDosNum (numeros ?x ?y) 
	=> (printout t "El resultado de (A+1) / (B-1) es: " (/ (+ ?x 1) (- ?y 1)) crlf))