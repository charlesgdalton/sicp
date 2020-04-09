;;exercise 2.62-complete!

(define (union-set set1 set2)
  (if (or (null? set1) (null? set2))
      (append set1 set2)
      (let ((x1 (car set1))
	    (x2 (car set2)))
	(cond ((= x1 x2)
	       (cons x2 (union-set (cdr set1) (cdr set2))))
	      ((< x1 x2)
	       (cons x1 (union-set (cdr set1) set2)))
	      ((> x1 x2)
	       (cons x2 (union-set set1 (cdr set2))))))))

(union-set (list 1 2 3 8 10) (list 2 4 6 12 18))
