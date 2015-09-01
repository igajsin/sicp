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

(define (min2 x y)
  (if (<= (car x) (car y)) x
      y))

(define (nmin  . args)
  (fold (lambda (x acc) (min2 x acc)) (car args) (cdr args)))

(define (max2 x y)
  (if (>= (car x) (car y)) x
      y))

(define (nmax  . args)
  (fold (lambda (x acc) (max2 x acc))
	(car args)
	(cdr args)))

(define (pp lz uz x y)
  (format #f "~a ~a ~a ~a" lz uz x y))

(define (mul-interval-pp x y)
  (let* ((lx (lower-bound x))
	 (ux (upper-bound x))
	 (ly (lower-bound y))
	 (uy (upper-bound y))
	 (p1 (cons (* lx ly) '(lx ly)))
	 (p2 (cons (* lx uy) '(lx uy)))
	 (p3 (cons (* ux ly) '(ux ly)))
	 (p4 (cons (* ux uy) '(ux uy)))
	 (lz (nmin p1 p2 p3 p4))
	 (uz (nmax p1 p2 p3 p4)))
    (pp lz uz x y)))

(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))

(define (radius z)
  (let ((l (lower-bound z))
	(u (upper-bound z)))
    (/ (- u l) 2)))

(define (gen-sign n)
  "create a sequences of length n with all variant + and -"
  (if (> n 0) 
      (fold (lambda (x acc)
	      (append (list (cons 1 x) (cons -1 x))
		      acc))
	    '()
	    (gen-sign (- n 1)))
      '(())))

(define (mk-rnd-int i)
  (map (lambda (x) (* x (random 9))) i))

(define (mk-rnd-seq n)
  (map mk-rnd-int (gen-sign n)))

(define (mul-rnd-seq n)
  (map (lambda (l)
	 (let ((x1 (list-ref l 0))
	       (x2 (list-ref l 1))
	       (y1 (list-ref l 2))
	       (y2 (list-ref l 3)))
	   (mul-interval-pp (make-interval x1 x2) (make-interval y1 y2))))
       (mk-rnd-seq n)))
