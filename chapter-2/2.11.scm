;;exercise 2.11-complete!

(define (make-interval a b) (cons a b))


(define (upper-bound x)
  (cdr x))

(define (lower-bound y)
  (car y))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (old-mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (positive? x)
  (>= x 0))

(define (negative? x)
  (not (positive? x)))

(define (evaluate-points evaluation1 p1 evaluation2 p2 evaluation3 p3 evaluation4 p4)
  (and (and (evaluation1 p1) (evaluation2 p2)) (and (evaluation3 p3) (evaluation4 p4))))

(define (mul-interval x y)
  (let ((ux (upper-bound x))
	(lx (lower-bound x))
	(uy (upper-bound y))
	(ly (lower-bound y)))
    (cond ((evaluate-points positive? lx positive? ux positive? ly positive? uy) (make-interval (* lx ly) (* ux uy)))
	  ((evaluate-points negative? lx positive? ux positive? ly positive? uy) (make-interval (* lx uy) (* ux uy)))
	  ((evaluate-points positive? lx positive? ux negative? ly positive? uy) (make-interval (* ux ly) (* ux uy)))
	  ((evaluate-points negative? lx positive? ux negative? ly positive? uy) (make-interval (min (* lx uy) (* ly ux)) (* ux uy)))
	  ((evaluate-points negative? lx negative? ux positive? ly positive? uy) (make-interval (* lx uy) (* ux ly)))
	  ((evaluate-points positive? lx positive? ux negative? ly negative? uy) (make-interval (* ux ly) (* lx uy)))
	  ((evaluate-points negative? lx negative? ux negative? ly negative? uy) (make-interval (* ux uy) (* lx ly)))
	  ((evaluate-points negative? lx positive? ux negative? ly negative? uy) (make-interval (* ux ly) (* lx ly)))
	  ((evaluate-points negative? lx negative? ux negative? ly positive? uy) (make-interval (* lx uy) (* lx ly))))))
	  

(define (div-interval x y)
  (if (or (= (upper-bound y) 0) (= (lower-bound y) 0))
      "error"
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
		      (/ 1.0 (lower-bound y))))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
		 (- (upper-bound x) (upper-bound y))))

(define int1 (make-interval 5 10))

(define int2 (make-interval -30 -10))

(mul-interval int1 int2)
