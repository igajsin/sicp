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
