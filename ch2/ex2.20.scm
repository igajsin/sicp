(define (sp? x y)
  (or (and (odd? x) (odd? y))
      (and (even? x) (even? y))))

(define (same-parity x . y)
  (cons x
	(fold-right (lambda (z acc)
		      (if (sp? z x) (cons z acc)
			  acc))
		    '() y)))
