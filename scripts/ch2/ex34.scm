(define-module (ch2 ex34)
  #:use-module (ch2 ex33)
  :export (horner-eval))

(define (horner-eval x coeff)
  (accumulate
   (lambda (this-coeff higher-terms)
     (+ this-coeff
	(* higher-terms x)))
   0
   coeff))
