;;exercise 2.12-completed!

(define (make-interval a b) (cons a b))

(define (upper-bound x)
  (cdr x))

(define (lower-bound y)
  (car y))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c tolerance)
  (make-interval (- c (* c (/ tolerance 100))) (+ c (* c (/ tolerance 100)))))

(define test (make-center-percent 10 10))

(lower-bound test)

(upper-bound test)
