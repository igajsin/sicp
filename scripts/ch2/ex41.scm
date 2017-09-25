(define-module (ch2 ex41)
  #:use-module (srfi srfi-1)
  #:use-module (ch2 ex40)
  :export (sum-less-than?))

(define (unique-triples n)
  (flatmap
   (lambda (i)
     (flatmap
      (lambda (j)
	(map
	 (lambda (k)
	   (list i j k))
	 (iota j j -1)))
      (iota i i -1)))
   (iota n n -1)))

(define (mk-ord-lst n))


(define (sum-lst lst)
  (reduce + 0 lst))

(define (sum-less-than? s n)
  (filter (lambda (lst) (< (sum-lst lst) s))
	  (unique-triples n)))
