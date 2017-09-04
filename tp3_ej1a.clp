;;1.a

(assert (vector 3 4 5))


(defrule minimo
	(vector $? ?x $?)
	(not(vector $? ?y&:(< ?y ?x) $?))
	=>
	(assert(min ?x)))

(defrule maximo
	(vector $? ?x $?)
	(not(vector $? ?y&:(> ?y ?x) $?))
	=>
	(assert(max ?x)))

(defrule producto
	(min ?x) (max ?y)
	=>
	(printout t "El producto entre el minimo y el maximo es: " (* ?x ?y) crlf))
