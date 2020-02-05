;;exercise 2.38-complete!

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

(fold-left list () (list 1 2 3))

;;if (op (op x y) z) is always the same as (op x (op y z)), then fold-left and fold-right will produce the same values
