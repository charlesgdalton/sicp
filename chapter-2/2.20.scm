;;exercise 2.20-completed!

(define (even? x)
  (= (modulo x 2) 0))

(define (odd? x)
  (not (even? x)))


(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))


(define (same-parity first . rest)
  (define (same-parity-iter returned-nums unparsed-items)
    (if (null? unparsed-items)
	returned-nums
	(if (equal? (even? first) (even? (car unparsed-items)))
	    (same-parity-iter (append returned-nums (list (car unparsed-items))) (cdr unparsed-items))
	    (same-parity-iter returned-nums (cdr unparsed-items)))))
  (same-parity-iter (list first) rest))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
      
