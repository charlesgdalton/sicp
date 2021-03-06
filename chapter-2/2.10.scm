;;exercise 2.10-complete!

(define (make-interval a b) (cons a b))


(define (upper-bound x)
  (cdr x))

(define (lower-bound y)
  (car y))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (or (= (upper-bound y) 0) (= (lower-bound y) 0))
      "error"
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
		      (/ 1.0 (lower-bound y))))))

;;the difference of two intervals may be computed by subtracting the lower-bound of the first from the lower-bound of the first

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
		 (- (upper-bound x) (upper-bound y))))

(define int1 (make-interval 5 5))

(define int2 (make-interval -10 30))

(div-interval int1 int2)
