;;exercise 2.28-completed!

(define (fringe items)
  (cond ((null? items) items)
	((pair? (car items)) (append (fringe (car items)) (fringe (cdr items))))
	(else items)))




(define x (list (list 1 2) (list 3 4)))

(fringe x)

(fringe (list x (list x x x)))
