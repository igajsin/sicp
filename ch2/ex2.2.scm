(use-modules (ice-9 format))

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define make-point cons)
(define x-point car)
(define y-point cdr)

(define (print-point p)
  (format #f "(~a.~a)" (x-point p) (y-point p)))

(define (midpoint-segment s)
  (let* ((p1 (start-segment s)) (x1 (x-point p1)) (y1 (y-point p1))
	 (p2 (end-segment s)) (x2 (x-point p2)) (y2 (y-point p2)))
    (make-point (/ (+ x1 x2) 2) (/ (+ y1 y2) 2))))
