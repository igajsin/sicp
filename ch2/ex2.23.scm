(define (fr-each1 proc items)
  (and (map proc items)
       #t))
