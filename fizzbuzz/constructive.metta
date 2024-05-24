(= (range $start $end $step) (if (< $start $end) $start (empty)))
(= (range $start $end $step) (if (< $start $end) (range (+ $start $step) $end $step) (empty)))

; !(union (range 1 13 1) (range 10 20 2))
; !(intersection (range 1 13 1) (range 10 20 2))
; !(subtraction (range 10 20 2) (range 1 16 1))

(= (fizzbuzz $n)
  (let* (($m3 (collapse (range 3 $n 3)))
         ($m5 (collapse (range 5 $n 5)))
         ($r (collapse (range 1 $n 1)))
         ($m35 (collapse (intersection (superpose $m3) (superpose $m5))))
         ($m3n5 (subtraction (superpose $m3) (superpose $m5)))
         ($m5n3 (subtraction (superpose $m5) (superpose $m3)))
         ($n35 (subtraction (superpose $r) (superpose $m35))))
        (union (union (FizzBuzz (superpose $m35)) (Nothing $n35)) (union (Fizz $m3n5) (Buzz $m5n3)))))

!(unique (fizzbuzz 50))
