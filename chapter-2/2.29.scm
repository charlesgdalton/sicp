;;exercise 2.29-complete!

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))
;;if you want to use cons, change cadr here and below to cdr.
;;in lists, cdr selects a sublist and car selects the first element of that sublist
;;in constructs, cdr selects the right element

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (branch-torque branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
	((not (pair? mobile)) mobile)
	(else (+ (total-weight (branch-structure (left-branch mobile)))
		 (total-weight (branch-structure (right-branch mobile)))))))

(define (balanced-mobile? mobile)
  (cond ((not (pair? mobile)) true)
	(else (and (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile))) (balanced-mobile? (branch-structure (left-branch mobile))) (balanced-mobile? (branch-structure (right-branch mobile)))))))

(define x (make-mobile (make-branch 1 9) (make-branch 3 3)))

(define y (make-mobile (make-branch 1 12) (make-branch 1 x)))

(define z (make-mobile (make-branch 8 102203) (make-branch 1 y)))

(balanced-mobile? y)

;;(branch-structure (right-branch x))

  
  
