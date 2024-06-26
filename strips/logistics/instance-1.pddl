; PDDL instance from the 2nd International Planning Competition, 2000
; authors: Bart Selman, Henry Kautz (based on an earlier domain by Manuela Veloso)
; https://github.com/potassco/pddl-instances/blob/master/ipc-2000/domains/logistics-strips-typed/instances/instance-1.pddl
; authors: Bart Selman, Henry Kautz (based on an earlier domain by Manuela Veloso)

(define (problem logistics-4-0)
(:domain logistics)
(:objects
 apn1 - airplane
 apt1 apt2 - airport
 pos2 pos1 - location
 cit2 cit1 - city
 tru2 tru1 - truck
 obj23 obj22 obj21 obj13 obj12 obj11 - package)

(:init (at apn1 apt2) (at tru1 pos1) (at obj11 pos1)
 (at obj12 pos1) (at obj13 pos1) (at tru2 pos2) (at obj21 pos2) (at obj22 pos2)
 (at obj23 pos2) (in-city pos1 cit1) (in-city apt1 cit1) (in-city pos2 cit2)
 (in-city apt2 cit2))

(:goal (and (at obj11 apt1) (at obj23 pos1) (at obj13 apt1) (at obj21 pos1)))
)