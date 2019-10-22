(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

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

(define (search-for-primes start end)
  (search-for-primes-iter start end))

(define (search-for-primes-iter current end)
  (if (< current end) (timed-prime-test current))
  (if (< current end) (search-for-primes-iter (+ current 2) end)))

(newline) 
 (search-for-primes 1000000001 1000000022)       ; 1e9 
 (search-for-primes 10000000001 10000000062)     ; 1e10 
 (search-for-primes 100000000001 100000000058)   ; 1e11 
 (search-for-primes 1000000000001 1000000000064) ; 1e12

;;Before exercise answer:
;;You would expect the time t to equal t = log(s) + b,
;;where s is the time it takes per computation times
;;the amount of computation (mx) and b is the constant time
;;as opposed to t = s + b or t = mx + b.
;;C function 1.24
;;A function 1.22
;;A(x) = mx + b
;;C(x) = m(log(x)) + b

;;After exercise answer:
;;It's actually not even a log(n) order of growth.
;;Since you run the same amount of trials, it's
;;O(1) order of growth. It might be a log(n)
;;order of growth to achieve the same degree of likelihood
;;of correctness.
