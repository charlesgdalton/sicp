;;exercise 1.36-completed!

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess counter)
    (newline)
    (display guess)
    (newline)
    (display counter)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next (+ counter 1)))))
  (try first-guess 1))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)
;;34 steps without damping

(define (average x1 x2) (/ (+ x1 x2) 2))

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2)
;;9 steps with damping
