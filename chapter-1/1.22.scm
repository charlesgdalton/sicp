(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (square n) (* n n))

(define (search-for-primes start end)
  (search-for-primes-iter start end))

(define (search-for-primes-iter current end)
  (if (< current end) (timed-prime-test current))
  (if (< current end) (search-for-primes-iter (+ current 2) end)))

(newline) 
 (search-for-primes 1000000001 1000000021)       ; 1e9 
 (search-for-primes 10000000001 10000000061)     ; 1e10 
 (search-for-primes 100000000001 100000000057)   ; 1e11 
 (search-for-primes 1000000000001 1000000000063) ; 1e12(search-for-primes 10000000001 10000000050)
