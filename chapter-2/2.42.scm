;;exercise 2.42-WIP

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

(define (make-point row column)
  (cons row column))

(define (get-row point)
  (car point))

(define (get-column point)
  (cdr point))

(define (adjoin-position row column board)
  (append (list (make-point row column)) board))

(define empty-board ())

(define (safe? k positions)
  (let ((latest-queen (car positions))
	(other-queens (cdr positions)))
    (and (horizontal-safe? latest-queen other-queens k)
	 (vertical-safe? latest-queen other-queens k)
	 (diagonal-safe? latest-queen other-queens k))))

(define (queen-overlap? position other-queens)
  (not (= (length (filter (lambda (other-queen)
			    (and (= (get-row other-queen) (get-row position))
				 (= (get-column other-queen) (get-column position))))
			  other-queens))
	  0)))


(define identity
  (lambda (x) x))

(define up
  (lambda (param) (+ param 1)))

(define down
  (lambda (param) (- param 1)))

(define (make-safe? row-manipulation col-manipulation)
  (lambda (test-queen other-queens k)
    (let ((queen-row (get-row test-queen))
	(queen-column (get-column test-queen)))
    (cond ((or (> queen-column k) (< queen-column 1)) true)
	  ((queen-overlap? test-queen other-queens) false)
	  (else ((make-safe? row-manipulation col-manipulation) (make-point (row-manipulation queen-row) (col-manipulation queen-column)) other-queens k))))))


;;horizontal constructors
(define left-safe? (make-safe? identity down))
(define right-safe? (make-safe? identity up))
(define (horizontal-safe? test-queen other-queens k)
  (and (right-safe? test-queen other-queens k)
       (left-safe? test-queen other-queens k)))

;;vertical constructors
(define up-safe? (make-safe? up identity))
(define down-safe? (make-safe? down identity))
(define (vertical-safe? test-queen other-queens k)
  (and (up-safe? test-queen other-queens k)
       (down-safe? test-queen other-queens k)))

;;diagonal constructors
(define up-right-safe? (make-safe? up up))
(define up-left-safe? (make-safe? up down))
(define down-right-safe? (make-safe? down up))
(define down-left-safe? (make-safe? down down))
(define (diagonal-safe? test-queen other-queens k)
  (and (up-right-safe? test-queen other-queens k)
       (up-left-safe? test-queen other-queens k)
       (down-right-safe? test-queen other-queens k)
       (down-left-safe? test-queen other-queens k)))


(define x (adjoin-position 2 7 ()))

(define y (adjoin-position 4 3 x))

;;(left-safe? (make-point 3 4) y 8)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) true)
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position
		    new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 2)
