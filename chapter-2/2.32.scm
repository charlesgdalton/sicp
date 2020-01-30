;;exercise 2.32-completed!

(define (subsets s)
  (if (null? s)
      (list ())
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (x) (append (list (car s)) x)) rest)))))


(subsets (list 1 2 3))
;;should return ((2) (2 3))

;;one way to get the subsets of (1 2) is to take
;;all of the subsets of (2) (which is only (() (2)))
;;and append it to a new list
;;which is equal to 1, paired next to each earlier subset
;;clearly stated,
;;list 1=(() (2))
;;list 2=((1) (1 2)), see how this is just equal to the appending of (1) and () and (1) and (2)?
;;thus, subsets of (1 2) are equal to
;;(() (2) (1) (1 2))
;;and subsets of (1 2 3) are equal to
;;list 1=(() (3))
;;list 2=(() (3) (2) (2 3))
;;list 3=(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
;;how we get this is by appending the item to the rest of the subsets in each recursive round
;;each round gets one integer, so this should work
;;the (map (lambda (x) (append (list (car s)) x)) rest))) takes every element from the rest list, and appends the current integer (car s) to it
;;first run when s=(), rest = (())
;;second when s=(3), rest = (() (3))
;;third when s=(2 3), rest = (() (3) (2) (2 3))
;;fourth when s=(1 2 3), rest = (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
