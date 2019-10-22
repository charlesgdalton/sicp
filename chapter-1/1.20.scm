(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


;; NORMAL ORDER:
;;(gcd 206 40)
;;(gcd 40 (remainder 206 40))
;;if
;;(= (remainder 206 40) 0)
;;(remainder 206 40) = 6, calculates remainder once returns false
;;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;;if
;;(= (remainder 40 (remainder 206 40)) 0)
;;(remainder 40 (remainder 206 40) = 4, calculates remainder twice returns false
;;(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;;if
;;(= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;;(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) = 2, calculates remainder 4 times returns false
;;(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;;if
;;(= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;;(remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) = 0, calculates remainder 7 times returns true
;;final answer: (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) = 2, calculates remainder 4 times
;;normal order calculates remainder 14 times


;; APPLICATIVE ORDER:
;;(gcd 206 40)
;;(= 40 0) returns false
;;(gcd 40 (remainder 206 40))
;;a = 40, b = (remainder 206 40) = 6, calculates remainder once
;;(= 6 0) returns false
;;(gcd 6 (remainder 40 6))
;;a = 6, b = (remainder 40 6) = 4, calculates remainder once
;;(= 4 0) returns false
;;(gcd 4 (remainder 6 4))
;;a = 4, b = (remainder 6 4) = 2, calculates remainder once
;;(= 2 0) returns false
;;(gcd 2 (remainder 4 2))
;;a = 2, b = (remainder 4 2) = 0, calculates remainder once
;;(= 0 0) returns true
;;final answer = 2
;;applicative order calculates remainder 4 times


