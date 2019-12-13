;;exercise 1.34-completed!
(define (f g) (g 2))

(define (square x) (* x x))

;;if you ask the interpreter to interpret
;;(f f)
;;you will get an error because (ff) evaluates to
;;(f 2)
;;which evaluates to
;;(2 2)
;;which doesn't work because the first 2 is not a function

