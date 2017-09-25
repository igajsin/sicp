(define-module (ch2 ex12)
  :export (
	   make-center-percent
	   make-interval
	   add-interval
	   mul-interval
	   div-interval
	   ))
(use-modules (srfi srfi-1))

(define make-interval cons)
(define lower-bound car)
(define upper-bound cdr)

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i)
	(upper-bound i))
     2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i))
     2))

(define (make-center-percent center percent)
  (make-center-width center (* center percent)))

(define (percent i)
  (/ (width i) (center i)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x)(upper-bound y))
		 (- (upper-bound x) (lower-bound y))))

(define (mul-interval1 x y)
  (let* ((lx (lower-bound x)) (ux (upper-bound x))
	 (ly (lower-bound y)) (uy (upper-bound y))
	 (p1 (* lx ly))
	 (p2 (* lx uy))
	 (p3 (* ux ly))
	 (p4 (* ux uy)))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (mul-interval2 x y)
  (make-interval (min (* (lower-bound x) (upper-bound y))
		      (* (upper-bound x) (upper-bound y)))
		 (max (* (lower-bound x) (lower-bound y))
		      (* (upper-bound x) (lower-bound y)))))

(define mul-interval mul-interval2)
(define (div-interval x y)
  "I hope that lower-bound lower than upper-bound"
  (if (and (< (lower-bound y) 0)
	   (> (upper-bound y) 0))
      (error "cross zero")
      (mul-interval2 x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y))))))

(define (radius z)
  (let ((l (lower-bound z))
	(u (upper-bound z)))
    (/ (- u l) 2)))

(define (mess n)
  (define (mess1 n l)
    (if (= n 0) l
	(mess1 (- n 1) (map (lambda (x) (append (cons '+ x) (cons '- x))) l))))
  (mess1 n '(())))

(define (mess n)
  (fold 
   (lambda (x acc) (append
	       (map (lambda (y) (cons '+ y)) acc)
	       (map (lambda (y) (cons '- y)) acc)))
   '(()) (iota n)))
