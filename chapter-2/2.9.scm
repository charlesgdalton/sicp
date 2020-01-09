;;exercise 2.9-completed!

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
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
		  (/ 1.0 (lower-bound y)))))

;;the difference of two intervals may be computed by subtracting the lower-bound of the first from the lower-bound of the first

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
		 (- (upper-bound x) (upper-bound y))))

;;a width of an interval is = (Iu - Il), the upper-bound of the interval minus the lower-bound of the interval
;;the width of an interval x is (Xu - Xl)/2
;;the width of an interval y is (Yu - Yl)/2
;;the sum of the intervals is an interval from the sum of the lower-bounds to the sum of the upper-bounds
;;otherwise stated, for new interval Z: Zl = Xl + Yl, Zu = Xu + Yu
;;to find the width of Z, (Zu - Zl)/2
;;otherwise stated, ((Xu + Yu) - (Xl + Yl))/2
;;otherwise stated, ((Xu - Xl) + (Yu - Yl))/2
;;otherwise stated, (Xu - Xl)/2 + (Yu - Yl)/2
;;given that the interval of x is (Xu - Xl)/2 and the interval of y is (Yu - Yl)/2, the interval of Z is just the sum of the intervals of X and Y

;;this isn't true for multiplication or division.
;;an example of this is multiplying intervals from 5-10 and 20-30
;;the width of new interval is 100
;;which is not a function of 2.5 * 5
