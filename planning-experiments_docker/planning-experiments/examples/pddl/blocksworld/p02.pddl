(define (problem bw_2)
  (:domain blocks-domain)
  (:objects b1 b2 - block)
  (:init (emptyhand) (ontable b1) (ontable b2) (clear b1) (clear b2))
  (:goal (and (on b1 b2)))
)
