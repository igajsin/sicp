(define-module (ch2 ex21)
  :export (sq sq1))

(define (sq lst)
  (if (null? lst) '()
      (cons (* (car lst) (car lst))
	    (sq (cdr lst)))))

(define (sq1 lst)
  (map (lambda (x) (* x x)) lst))
