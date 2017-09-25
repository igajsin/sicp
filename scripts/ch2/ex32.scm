(define-module (ch2 ex32)
  :export (subsets))

(define (subsets s)
  (if (null? s) '(())
      (let ((rest (subsets (cdr s))))
	(append rest
		(map (lambda (x) (cons (car s) x)) rest)))))
