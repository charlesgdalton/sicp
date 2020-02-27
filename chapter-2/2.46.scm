;;exercise 2.46-completed!

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
