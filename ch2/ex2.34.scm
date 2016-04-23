(define (horner-eval x coefs)
  (accumulate
   (lambda (this-coef higher-terms)
     (+ this-coef
	(* x higher-terms))
     ) 0 coefs))
