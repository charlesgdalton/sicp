
;fast-expt recursive function


(define (square x) (* x x))

(define (even? x)
  (= 0 (remainder x 2)))

(define (fast-exp b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-exp b (/ n 2))))
	(else (* b (fast-exp b (- n 1))))))

;fast-exp iterative function

(define (fast-exp-iter b n)
  (exp-iter 1 b n))
(define (exp-iter a b n)
  (cond ((= n 0) a)
	((even? n) (exp-iter a (square b) (/ n 2)))
	(else (exp-iter (* a b) b (- n 1)))))
  
(fast-exp-iter 77 37)





