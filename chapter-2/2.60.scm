;;exercise 2.60-complete!

(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))
;;this procedure doesn't change

(define (adjoin-set x set)
  (cons x set))
;;this process is now O(1) rather than O(n) where n is the size of the set
;;because element-of-set? is O(n) and this new procedure doesn't need it


(define (union-set set1 set2)
  (append set1 set2))
;;this process is now O(1) rather than O(n^2). It was O(n^2) because it
;;iterated over each element in input set, and for each element iterated
;;over each element in the output set. Of course, append could be O(n).

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1) (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))
;;same procedure

;;you might want to use these in an application where lots of unions
;;are occuring on large sets, because this is much more efficient.
;;Then, you could have a selector function that removes the redundant
;;elements of the set.


(union-set '(1 2 3 4) '(1 2 3))
