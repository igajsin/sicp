(define-module (ch2 ex27)
  :export (deep-reverse))

(define (deep-reverse lst)
  (map (lambda (x)
	 (if (pair? x) (deep-reverse x)
	     x))
       (reverse lst)))
