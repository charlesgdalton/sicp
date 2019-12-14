;;exercise 1.39-completed!

(define (square x)
  (* x x))

(define (cont-frac n d k)
  (define (cont-frac-recurse i)
    (if (> i k)
	(d i)  
	(/ (n i)
	   (- (d i)
	      (cont-frac-recurse (+ i 1))))))
  (cont-frac-recurse 1))

(define (tan-cf x k)
  (define (n-func i)
    (if (= i 1)
	x
	(square x)))
  (define (d-func i)
    (- (* 2 i) 1))
  (cont-frac n-func d-func k))

(tan-cf 1.5 17)
