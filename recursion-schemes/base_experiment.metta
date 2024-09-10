; Heavy WIP

(: Nil AtomF)
(: (Cons $a $b) AtomF)
(= (Base Atom) AtomF)

(: project (-> Atom AtomF))
(= (project $e) (if (== $e ()) Nil (Cons (car-atom $e) (cdr-atom $e))))
(: embed (-> AtomF Atom))
(= (embed (Cons $a $b)) (cons-atom $a $b))
(= (embed Nil) ())

!(assertEqual (project (a b c)) (Cons a (b c)))
!(assertEqual (embed (Cons a (b c))) (a b c))

(: (-> (-> $a $b) ($f $a) ($f $b)))
(= (fmap $f (Cons $a $b)) (Cons $a ($f $b)))
(= (fmap $f Nil) Nil)

; (: cata (-> (-> ((Base $t) $a) $a) $t $a))
(= ((cata $alg) $seed) ($alg (fmap (cata $alg) (project $seed))))

(: sumF (-> (AtomF Number) Number))
(= (sumF (Cons $n $acc)) (+ $n $acc))
(= (sumF Nil) 0)

!((cata sumF) (1 2 3))
