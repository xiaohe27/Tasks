;for finding the range of the int expr
;(n * (n+1))/2

;My z3 constraint is:


(declare-const n Int)

(assert (<= (* n (+ n 1)) 4294967294))
(assert (> (* (+ n 1) (+ n 2)) 4294967294))

(check-sat)
(get-model)

(exit)