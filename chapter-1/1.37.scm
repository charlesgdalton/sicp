;;exercise 1.37-WIP

(define (cont-frac n d k)
  (define (cont-frac-recurse i)
    (if (> i k)
	(d i)  
	(/ (n i)
	   (+ (d i)
	      (cont-frac-recurse (+ i 1))))))
  (cont-frac-recurse 1))

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   10)
;;a: k needs to be 10 in order to get an approximation that is accurate to 4 decimal places

(define (cont-frac-iter n d k)
  (define (cont-frac-iter i total)
    (if (> i 0)
	(cont-frac-iter (- i 1)
			(/ (n i)
			   (+ (d i) total)))
	total))
  (cont-frac-iter k 1))

(cont-frac-iter (lambda (i) 1.0)
		(lambda (i) 1.0)
		100)
	
