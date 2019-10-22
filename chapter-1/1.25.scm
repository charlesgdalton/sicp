(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

;;I believe this function does the same work by doing base^exp % m.
;;However, for some reason I don't fully understand but hope to tomorrow
;;understand, it may not be efficient. My biggest clue is that the suggesters
;;surname is hacker.
