(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (cube n) (* n n n))

(define (inc n) (+ n 1))

(define (even? n)
  (= (remainder n 2) 0))

;;(sum cube 0 inc 3)

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (even-multiple x)
    (cond ((even? (* x n)) 4)
	  (else 2)))
  (define (simpson-term x)
    (cond ((or (= x a) (= x b)) (f x))
	  (else (* (even-multiple x) (f x)))))
  (define (simpson-next x)
    (+ x h))
  (*
   (/ h 3)
   (sum simpson-term a simpson-next b)))

;;(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)
