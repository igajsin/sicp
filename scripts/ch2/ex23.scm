(define-module (ch2 ex23)
  :export (fr-each))

(define (fr-each proc lst)
  (if (null? lst) #t
      (cons (proc (car lst))
	    (fr-each proc (cdr lst)))))
