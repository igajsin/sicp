(define make-interval cons)
(define lower-bound car)
(define upper-bound cdr)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let* ((lx (lower-bound x)) (ux (upper-bound x))
	 (ly (lower-bound y)) (uy (upper-bound y))
	 (p1 (* lx ly))
	 (p2 (* lx uy))
	 (p3 (* ux ly))
	 (p4 (* ux uy)))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))

