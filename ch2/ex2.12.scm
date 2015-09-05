(use-modules (srfi srfi-1))

(define make-interval cons)
(define lower-bound car)
(define upper-bound cdr)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x)(upper-bound y))
		 (- (upper-bound x) (lower-bound y))))

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

(define (radius z)
  (let ((l (lower-bound z))
	(u (upper-bound z)))
    (/ (- u l) 2)))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i))
     2))

(define (length-interval i)
  (- (upper-bound i) (lower-bound i)))

(define (width i)
  (/ (length-interval i)
     2))

(define (percent i)
  (* 100
     (/ (width i) (center i))))

(define (make-center-percent c p)
  (make-center-width c (/ (* c p) 100)))


