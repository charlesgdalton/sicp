(define (carmichael-test n)
  (carmichael-test-iter n (- n 1)))

(define (carmichael-test-iter n i)
  (cond ((< i 0) true)
	((not (= (expmod i n n) i)) false)
	(else (carmichael-test-iter n (- i 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
         m))
        (else
	 (remainder
	  (* base (expmod base (- exp 1) m))
	  m))))
(define (even? x)
  (= (remainder x 2) 0))

(define (square x) (* x x))

(carmichael-test 1729)


