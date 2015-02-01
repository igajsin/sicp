(define (M n d)
  (let* ((s (if (or (and (> n 0) (> d 0))
		    (and (< n 0) (< d 0)))
		1
		-1))
	 (an (abs n))
	 (ad (abs d))
	 (g (gcd an ad))
	 (n1 (/ an g))
	 (d1 (/ ad g)))
    (cons (* s n1) d1)))

