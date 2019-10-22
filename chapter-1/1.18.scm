; iterative function for multiplying in terms of adding, doubling, and halving

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= 0 (remainder x 2)))

(define (fast-mult x y)
  (cond ((= x 1) y)
        ((even? x) (fast-mult (halve x) (double y)))
	(else (+ y (fast-mult (- x 1) y)))))

(define (fast-mult-iter x y)
  (define (mult-iter n x y)
    (cond ((= x 1) (+ n y))
          ((even? x) (mult-iter n (halve x) (double y)))
 	  (else (mult-iter (+ n y) (- x 1) y))))
  (mult-iter 0 x y))

(fast-mult-iter 4 8)
 
