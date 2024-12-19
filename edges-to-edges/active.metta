(= (fc $l $ns) ((superpose $ns) $l (superpose $ns)))

(= (add $ex (Add $e)) (add-atom $ex $e))
(= (rem $ex $a) (case $a (
  ((Remove $e) (let $_ (remove-atom $ex $e) (empty)))
  ($x $x))
))

(= (ɑ-rule $ex) (add $ex (rem $ex
  (match $ex ((ɑ $i) $q $y)
    (match $ex ($x $p (ɑ $i))
      (superpose (
        (Remove ($x $p (ɑ $i)) )
        (Remove ((ɑ $i) $q $y) )
        (Add    ($x $p $y)     )
      ))
)))))

(= (β-rule $ex) (add $ex (rem $ex
  (match $ex ((β $i) $q $y)
    (match $ex ($x $p (β $i))
      (match $ex ($y $q $z)
        (superpose (
          (Remove ($x $p (β $i)) )
          (Remove ((β $i) $q $y) )
          (Add    ($x $p $z)     )
        ))
))))))


!(bind! &ex1 (new-space))
!(add-atom &ex1 (y y (ɑ 0)))
!(add-atom &ex1 (x z (ɑ 0)))
!(add-atom &ex1 ((ɑ 0) 1 A))
!(ɑ-rule &ex1)
!(assertEqualToResult (get-atoms &ex1) ((y y A) (x z A)))

!(bind! &ex2 (new-space))
!(add-atom &ex2 ((ɑ 1) 1 (ɑ 1)))
!(add-atom &ex2 ((ɑ 1) 1 (ɑ 2)))
!(add-atom &ex2 ((ɑ 2) 1 (ɑ 1)))
!(ɑ-rule &ex2)
!(assertEqualToResult (get-atoms &ex2) (((ɑ 1) 1 (ɑ 1)) ((ɑ 1) 1 (ɑ 2)) ((ɑ 2) 1 (ɑ 1)) ((ɑ 2) 1 (ɑ 2))))

!(bind! &ex3 (new-space))
!(add-atom &ex3 ((ɑ 1) 1 (ɑ 2)))
!(add-atom &ex3 ((ɑ 2) 1 (ɑ 3)))
!(add-atom &ex3 ((ɑ 3) 1 (ɑ 1)))
!(ɑ-rule &ex3)
!(assertEqualToResult (get-atoms &ex3) (((ɑ 3) 1 (ɑ 2)) ((ɑ 2) 1 (ɑ 1)) ((ɑ 1) 1 (ɑ 3))))

!(bind! &ex4 (new-space))
!(add-atom &ex4 ((ɑ 1) 1 (ɑ 2)))
!(add-atom &ex4 ((ɑ 2) 1 (ɑ 3)))
!(add-atom &ex4 ((ɑ 3) 1 (ɑ 4)))
!(add-atom &ex4 ((ɑ 4) 1 (ɑ 1)))
!(ɑ-rule &ex4)
!(assertEqualToResult (get-atoms &ex4) (((ɑ 3) 1 (ɑ 1)) ((ɑ 4) 1 (ɑ 2)) ((ɑ 1) 1 (ɑ 3)) ((ɑ 2) 1 (ɑ 4))))
!(ɑ-rule &ex4)
!(assertEqualToResult (get-atoms &ex4) (((ɑ 3) 1 (ɑ 3)) ((ɑ 1) 1 (ɑ 1)) ((ɑ 4) 1 (ɑ 4)) ((ɑ 2) 1 (ɑ 2))))

!(bind! &ex5 (new-space))
!(add-atom &ex5 ((ɑ 1) 1 (ɑ 2)))
!(add-atom &ex5 ((ɑ 2) 1 (ɑ 3)))
!(add-atom &ex5 ((ɑ 3) 1 (ɑ 4)))
!(add-atom &ex5 ((ɑ 4) 1 (ɑ 1)))
!(add-atom &ex5 ((ɑ 2) 1 (ɑ 4)))
!(ɑ-rule &ex5)
!(ɑ-rule &ex5)
!(ɑ-rule &ex5)
!(ɑ-rule &ex5)
; !(let $c (collapse (fc 1 ((a 1) (a 2) (a 3) (a 4)))) (assertEqualToResult (get-atoms &ex5) $c))

!(bind! &ex6 (new-space))
!(add-atom &ex6 (app C (β 1)))
!(add-atom &ex6 ((β 1) N A))
!(add-atom &ex6 (A N B))
!(β-rule &ex6)
!(assertEqualToResult (get-atoms &ex6) ((app C B) (A N B)))

(= (name $x) (case $x (
  ((ɑ $n) (format-args "ɑ{}" ($n)))
  ($k (format-args "n{}" ($k)))
)))
(= (graphviz-triple ($x $p $y))
  (let* (($xn (name $x)) ($pn (name $p)) ($yn (name $y)))
    (format-args "{} -> {} [label=\"{}\"]"
      ($xn $yn $pn)
)))
(= (graphviz $space)
  (println! (graphviz-triple (get-atoms $space)))
)
!(graphviz &ex5)