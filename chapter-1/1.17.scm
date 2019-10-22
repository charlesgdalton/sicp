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

(fast-mult 743 2533)
    
