;;exercise 2.3-completed!

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

(define (length-segment s)
  (let ((p1 (start-segment s)) (p2 (end-segment s)))
    (cond ((= (x-point p1) (x-point p2)) (abs (- (y-point p1) (y-point p2))))
	  ((= (y-point p1) (y-point p2)) (abs (- (x-point p1) (x-point p2))))
	  (else 0))))

(define (make-rectangle bottom-left top-right)
  (let ((top-left (make-point (x-point bottom-left) (y-point top-right)))
	(bottom-right (make-point (x-point top-right) (y-point bottom-left))))
    (let ((vertical-segment (make-segment bottom-left top-left))
	  (horizontal-segment (make-segment bottom-left bottom-right)))
      (cons horizontal-segment vertical-segment))))

(define (horizontal-segment rect)
  (car rect))

(define (vertical-segment rect)
  (cdr rect))

(define (make-rectangle-with-segments horizontal-segment vertical-segment)
  (cons horizontal-segment vertical-segment))

(define (area rect)
  (* (length-segment (horizontal-segment rect))
     (length-segment (vertical-segment rect))))

(define (perimeter rect)
  (+
   (* 2 (length-segment (horizontal-segment rect)))
   (* 2 (length-segment (vertical-segment rect)))))

(define p1 (make-point 2 3))
(define p4 (make-point 6 5))

(define p5 (make-point 4 10))
(define p6 (make-point 7 10))
(define p7 (make-point 4 14))

(define h-seg (make-segment p5 p6))
(define v-seg (make-segment p5 p7))

(define rect1 (make-rectangle p1 p4))
(define rect2 (make-rectangle-with-segments h-seg v-seg))

;;test- works
(area rect1)
(area rect2)

(perimeter rect1)
(perimeter rect2)
