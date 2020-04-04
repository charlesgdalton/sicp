;;exercise 2.54-complete!

(define (equal? x y)
  (cond ((and (pair? x) (pair? y)) (and (equal? (car x) (car y)) (equal? (cdr x) (cdr y))))
	((and (not (pair? x)) (not (pair? y))) (eq? x y))
	(else false)))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
