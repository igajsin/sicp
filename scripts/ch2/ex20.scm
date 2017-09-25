(define-module (ch2 ex20)
  :export (same-parity))

(define (filter p? lst acc)
  (if (null? lst) acc
      (let ((x (car lst)))
	(if (p? x) (filter p? (cdr lst) (cons x acc))
	    (filter p? (cdr lst) acc)))))

(define (same-parity x . y)
  (reverse
   (if (odd? x) (filter odd? (cons x y) '())
       (filter even? (cons x y) '()))))
