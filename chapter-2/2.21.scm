;;exercise 2.21-completed!

(define square
  (lambda (x) (* x x)))

(define (square-list items)
  (if (null? items)
      ()
      (cons (square (car items)) (square-list (cdr items)))))

(square-list (list 2 3 9))
;;works

(define (map proc items)
  (if (null? items)
      ()
      (cons (proc (car items)) (map proc (cdr items)))))

(define (square-list items)
  (map (lambda (x) (* x x)) items))
;;works
