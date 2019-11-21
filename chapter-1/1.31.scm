;;exercise 1.31-completed!

;;helpers
(define (identity x) x)

(define (inc x) (+ x 1))

;;recursive product process
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

(define (factorial x)
  (product identity 1 inc x))

;;(factorial 5)

;;iterative product process
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* a result))))
  (iter a 1))

;;(product-iter identity 1 inc 5)

(define (square x) (* x x))

(define (pi-approximation accuracy)
  (define (pi-term x)
    (/
     (square (+ x 1))
     (+ (square x) (* 2 x))))
  (define (pi-next x)
    (+ x 2))
  (*
   (product pi-term 1 pi-next accuracy)
   2))

(pi-approximation 200)
     
