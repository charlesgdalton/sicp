;;exercise 2.17-completed!

(define (length items)
  (define (length-iter a count)
    (if (null? a)
	count
	(length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(define (last-pair items)
  (if (= (length items) 1)
      items
      (last-pair (cdr items))))

(last-pair (list 23 72 149 34))
