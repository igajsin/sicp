(define-module (ch2 ex39)
  #:use-module (rnrs lists)
  #:use-module (srfi srfi-1)
  :export (reverse1 reverse2))

(define (reverse1 seq)
  (fold-right (lambda (x y)
		(append y (list x)))
	      '() seq))

(define (reverse2 seq)
  (fold-left
   (lambda (x y)
     (cons y x))
   '() seq))
