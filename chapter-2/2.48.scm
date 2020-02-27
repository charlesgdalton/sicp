;;exercise 2.48-completed!

(define (make-vect x y)
  (list x y))
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cadr v))


(define (manipulate-vect f)
  (lambda (v1 v2)
    (make-vect
     (f (xcor-vect v1) (xcor-vect v2))
     (f (ycor-vect v1) (ycor-vect v2)))))

(define add-vect (manipulate-vect +))
(define sub-vect (manipulate-vect -))

(define (scale-vect v s)
  (make-vect
   (* s (xcor-vect v))
   (* s (ycor-vect v))))

(define (make-segment v1 v2)
  (list v1 v2))

(define (start-segment s)
  (car s))
(define (end-segment s)
  (cadr s))

(define foo (make-vect 1 2))
(define bar (make-vect 4 5))
(define baz (make-segment foo bar))

baz
