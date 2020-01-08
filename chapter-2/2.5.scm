;;exercise 2.4-complete!

(define (even? x)
  (= (modulo x 2) 0))

(define (divisible-by-three? x)
  (= (modulo x 3) 0))

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (car z)
  (reduce z 2))

(define (cdr z)
  (reduce z 3))

(define (reduce z divisor)
  (define (divisible-by-divisor? x)
    (= (modulo x divisor) 0))
  (define (reduce-iter quotient count)
    (if (divisible-by-divisor? quotient)
	(reduce-iter (/ quotient divisor) (+ count 1))
	count))
  (reduce-iter z 0))


(define first (cons 17 329))

(cdr first)
