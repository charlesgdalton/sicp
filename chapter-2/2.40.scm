;;exercise 2.40-complete!

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (fold-right op initial (cdr sequence)))))

(define (smallest-divisor n) 
  (find-divisor n 2)) 
  
(define (find-divisor n test-divisor) 
  (define (next n) 
    (if (= n 2) 3 (+ n 2))) 
  (cond ((> (square test-divisor) n) n) 
        ((divides? test-divisor n) test-divisor) 
        (else (find-divisor n (next test-divisor))))) 
  
(define (divides? a b) 
  (= (remainder b a) 0)) 

(define (prime? n)
  (= n (smallest-divisor n))) 


(accumulate
 append () (map (lambda (i)
		  (map (lambda (j) (list i j))
		       (enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 5)))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

;;(prime-sum? (list 1 3))

;;(flatmap (lambda (x) (list (* x x))) (list 1 2 3))

;;(enumerate-interval 1 9)


(define (unique-pairs n)
  (flatmap (lambda (i)
	     (map (lambda (j) (list i j))
		  (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))
(unique-pairs 7)

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs 6)
