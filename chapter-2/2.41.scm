;;exercise 2.41-complete!

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (fold-right op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
	     (map (lambda (j) (list i j))
		  (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))

(define (unique-tuples n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
			(map (lambda (k) (list i j k))
			     (enumerate-interval 1 j)))
		      (enumerate-interval 1 i)))
	   (enumerate-interval 1 n)))


(define (unique-tuples-equal-to-sum n s)
  (filter (lambda (tuple) (= s (accumulate + 0 tuple)))
	  (unique-tuples n)))

(unique-triples-equal-to-sum 3 6)

