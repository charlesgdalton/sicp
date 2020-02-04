;;exercise 2.35-completed!

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (count-leaves-old x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves-old (car x))
		 (count-leaves-old (cdr x))))))

(define (count-leaves t)
  (accumulate +
	      0
	      (map (lambda (x) (cond ((null? x) 0) ((not (pair? x)) 1) (else (count-leaves x)))) t)))

(count-leaves (list (list 1 2) 1 2 3 (list 1 (list 2 3 9) 29)))


