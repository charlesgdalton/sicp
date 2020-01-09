;;exercise 2.7-complete!

(define (make-interval a b) (cons a b))


(define (upper-bound x)
  (cdr x))

(define (lower-bound y)
  (car y))

(define interval (make-interval 2 5))

(lower-bound interval)
