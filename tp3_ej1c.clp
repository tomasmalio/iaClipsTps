;;1.c
(assert (numero 3.5))

(defrule parte_entera
	(numero ?x)
	=>
	(printout t "La parte entera de (14/4) es :" (- (/ 14 4) 0.5) crlf))
