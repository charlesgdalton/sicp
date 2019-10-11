; Compute the square root of a given number using successive
; approximation.

(define (sqrt value)
  (define (is-good-enough? guess value)
    (< (abs (- (* guess guess) value)) 0.0000001))

  (define (try guess value)
    (if (is-good-enough? guess value)
        guess
        (try (/ (+ guess (/ value guess)) 2) value)))

  (try 1 value))

(sqrt 4.0)
