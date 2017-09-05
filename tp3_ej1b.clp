;;1.b

(assert (vector1 3 4 5))

(assert (vector2 3 4 5))

(defrule maximo1
	(vector1 $? ?x $?)
	(not(vector1 $? ?y&:(> ?y ?x) $?))
	=>
	(assert(max1 ?x)))

(defrule maximo2
	(vector2 $? ?x $?)
	(not(vector2 $? ?y&:(> ?y ?x) $?))
	=>
	(assert(max2 ?x)))

(defrule minimo1
	(max1 ?x) (max2 ?y)
	(test(<= ?x ?y))
	=>
	(printout t "El minimo entre el maximo de vector1 y el maximo de vector2 es " ?x crlf))

(defrule minimo2
	(max1 ?x) (max2 ?y)
	(test(> ?x ?y))
	=>
	(printout t "El minimo entre el maximo de vector1 y el maximo de vector2 es " ?y crlf))
