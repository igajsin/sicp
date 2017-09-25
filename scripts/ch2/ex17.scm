(define-module (ch2 ex17)
  :export (last-pair))

(define (last-pair lst)
  (define (last-pair1 lst acc)
    (if (null? lst) acc
	(last-pair1 (cdr lst) (car lst))))
  (last-pair1 lst '()))
