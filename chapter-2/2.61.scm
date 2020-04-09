;;exercise 2.61-complete!q

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< x (car set)) (cons x set))
	((= x (car set)) set)
	(else (cons (car set) (adjoin-set x (cdr set))))))

(adjoin-set 6 (list 2 4 5 6 7 8))
