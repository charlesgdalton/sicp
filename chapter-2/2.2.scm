;;exercise 2.2-completed!

;;basic constructors and getters
(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;;special package

(define (average x y)
  (/ (+ x y) 2))

(define (midpoint-segment s)
  (make-point (average (x-point (start-segment s)) (x-point (end-segment s)))
	      (average (y-point (start-segment s)) (y-point (end-segment s)))))

(define p1 (make-point 3 10))

(define p2 (make-point 5 0))

(define s1 (make-segment p1 p2))

(print-point (start-segment s1))

(print-point (midpoint-segment s1))
