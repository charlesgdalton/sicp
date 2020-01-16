;;exercise 2.18-completed!

(define (length items)
  (define (length-iter a count)
    (if (null? a)
	count
	(length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))


(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(reverse (list 1 4 9 16 25))
