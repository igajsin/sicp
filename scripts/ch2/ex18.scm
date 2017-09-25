(define-module (ch2 ex18)
  :export (reverse))

(define (reverse lst)
  (define (rvrs1 lst acc)
    (if (null? lst) acc
	(rvrs1 (cdr lst) (cons (car lst) acc))))
  (rvrs1 lst '()))
