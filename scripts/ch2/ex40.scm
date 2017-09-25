(define-module (ch2 ex40)
  #:use-module (srfi srfi-1)
  :export (prime-sum-pair? flatmap unique-pairs))

(define (accumulate proc init list)
  (if (null? list) init
      (proc (car list)
	    (accumulate proc init (cdr list)))))

(define (flatmap proc list)
  (accumulate append '()
	      (map proc list)))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map
      (lambda (j)
	(list i j))
      (iota i i -1)))
   (iota n n -1)))

(define (prime? n)
  "enough for test"
  (or (= n 1) (= n 2) (= n 3) (= n 5) (= n 7)))

(define (prime-pair? p)
  (prime? (+ (car p) (cadr p))))

(define (prime-sum-pair? n)
  (map (lambda (x) (list (car x) (cadr x) (+ (car x) (cadr x))))
       (filter prime-pair? (unique-pairs n))))
  
