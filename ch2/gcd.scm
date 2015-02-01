(define (check-primes? x n)
  (= 0 (remainder x n)))

(define (prime-factors-1 x n fs)
  (if (> n x) fs
      (let ((new-n (+ n 1))
	    (new-fs (if (check-primes? x n) (cons n fs)
			fs)))
	(prime-factors-1 x new-n new-fs))))

(define (prime-factors x)
  (prime-factors-1 x 1 '()))

(define (m? x lst)
  (cond
   ((null? lst) #f)
   ((= x (car lst)) #t)
   (#t (m? x (cdr lst)))))

(define (biggest-com-prime px py)
  (car (filter (lambda (x) (m? x py)) px)))

(define (gcd x y)
  (let ((primes-x (prime-factors x))
	(primes-y (prime-factors y)))
    (biggest-com-prime primes-x primes-y)))

(define (fs n)
  "Start point for finding of prime factors"
  (floor (/ n 2)))

(define primes? check-primes?)

(define (pf1 N M x)
  (cond
   ((<= x 0) 1)
   ((= x 1) x)
   ((and (primes? N x) (primes? M x)) x)
   (#t (pf1 N M (- x 1)))))

(define (pf N M)
  (if (> N M) (pf1 N M (fs N))
      (pf1 M N (fs M))))
