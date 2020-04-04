;;exercise 2.59-WIP

(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1) (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (define (union-set-iter input output)
    (cond ((null? input) output)
	  (else (union-set-iter (cdr input) (adjoin-set (car input) output)))))
  (union-set-iter (append set1 set2) '()))

(union-set '(1 2 3 4 10) '(3 4 5 6))
	
	
