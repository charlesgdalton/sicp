;;exercise 1.38-completed!


(define (cont-frac n d k)
  (define (cont-frac-recurse i)
    (if (> i k)
	(d i)  
	(/ (n i)
	   (+ (d i)
	      (cont-frac-recurse (+ i 1))))))
  (cont-frac-recurse 1))


(+
 (cont-frac (lambda (i) 1.0)
	   (lambda (i)
	     (if (= 0 (modulo (- i 2) 3))
		 (* 2 (+ (/ (- i 2) 3) 1))
		 1))
	   10)
 2)


