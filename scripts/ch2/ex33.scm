(define-module (ch2 ex33)
  :export (map1 append1 lngth accumulate))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (map1 proc seq)
  (accumulate
   (lambda (x y) (cons (proc x) y))
   '() seq))

(define (append1 seq1 seq2)
  (accumulate
   cons
   seq2
   seq1))

(define (lngth seq)
  (accumulate
   (lambda (x y) (+ 1 y))
   0
   seq))
