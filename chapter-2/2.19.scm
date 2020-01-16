;;exercise 2.19-completed!

(define us-coins (list 10 25 1 50 5))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else
	 (+ (cc amount
		(except-first-denomination
		 coin-values))
	    (cc (- amount
		   (first-denomination
		    coin-values))
		coin-values)))))

(define (first-denomination items)
  (car items))

(define (except-first-denomination items)
  (cdr items))

(define (no-more? items)
  (null? items))


(cc 100 us-coins)

;;the order of coin-values doesn't seem to affect the result
;;this is because the tree splitup structure that this recursive function
;;creates doesn't need a specific order
;;the combinations of
;;(cc 100 (list 1))
;;+
;;(cc 100 (list 5 25 50 1))
;;are the same as
;;(cc 100 (list 50 25 10 5 1))
;;either way, the program checks every combination exhaustively, so it doesn't matter the order
