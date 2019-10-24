;;I love this problem, because it makes sense to me.
;;In square, the evaluator waits for the value of
;;expmod base (/ exp 2) m before multiplying it by itself.
;;If you are plainly doing multiplication, then the expmod
;;has to evaluate (run) twice, which is an expensive computation.
;;Essentially, even though it's successive squaring and inherently
;;an O(log(y)) problem. It's O(log(x^2)) = O(x).
