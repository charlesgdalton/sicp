;;exercise 1.33-completed!

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (not (filter a b))
	  (combiner null-value
		    (filtered-accumulate combiner null-value term (next a) next b filter))
	  (combiner (term a)
		(filtered-accumulate combiner null-value term (next a) next b filter)))))

(define (add x y)
  (+ x y))

(define (identity x) x)

(define (inc x) (+ x 1))


(define (prime? n x)
  (= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (square n) (* n n))

;;part a-completed!
;;(filtered-accumulate + 0 square 1 inc 7 prime?)
;;(relatively-prime? 50 50)


(define (find-smaller x y)
  (if (< x y)
      x
      y))

(define (relatively-prime? x y)
  (= (gcd x y) 1))

(define (gcd x y)
  (define (gcd-iter x y a b)
    (cond ((< a b) 1)
	  ((and (divides? a x) (divides? a y)) a)
	  (else (gcd-iter x y (- a 1) b))))
  (gcd-iter x y (find-smaller x y) 1))

;;part b-completed!
(filtered-accumulate + 0 identity 1 inc 5 relatively-prime?)
