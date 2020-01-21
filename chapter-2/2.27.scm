;;exercise 2.27-completed!

(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (cond ((null? items) items)
	((pair? (car items)) (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))
	(else (append (deep-reverse (cdr items)) (list (car items))))))

;;(reverse (list 1 4 9 16 25))

(define x (list (list 1 2) (list 3 4)))

(reverse x)

(deep-reverse x)
