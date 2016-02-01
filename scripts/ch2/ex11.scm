(define-module (ch2 ex11))

(define make-interval cons)
(define lower-bound car)
(define upper-bound cdr)

(define (mul-interval1 x y)
  "should be improved"
  (let* ((lx (lower-bound x)) (ux (upper-bound x))
	 (ly (lower-bound y)) (uy (upper-bound y))
	 (p1 (* lx ly))
	 (p2 (* lx uy))
	 (p3 (* ux ly))
	 (p4 (* ux uy)))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (mul-interval x y)
  (let* ((lx (lower-bound x)) (ux (upper-bound x))
	 (ly (lower-bound y)) (uy (upper-bound y)))
    (cond
     ((and (> lx 0) (> ux 0) (> ly 0) (> uy 0))))))
