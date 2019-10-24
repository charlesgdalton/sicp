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

(expmod 2 4 3)

;;I believe this function does the same work by doing base^exp % m.
;;However, for some reason I don't fully understand but hope to tomorrow
;;understand, it may not be efficient. My biggest clue is that the suggesters
;;surname is hacker.

;;Figured it out. The other expmod function uses a sucessive squaring technique
;;that makes it so the order of growth for the exponentials is only O(log(n)).
;;This is ideal for large numbers where the n value equals 1e12. Alyssa's function
;;works but it's not ideal for any large numbers.
