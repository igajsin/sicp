(define (make-rectangle s1 s2)
  "представление прямоугольника по двум сегментам"
  (cons s1 s2))

(define (segment-1 r)
  (car r))

(define (segment-2 r)
  (cdr r))

(define (length-segment s)
  (let* ((p1 (start-segment s)) (x1 (x-point p1)) (y1 (y-point p1))
	 (p2 (end-segment s)) (x2 (x-point p2)) (y2 (y-point p2)))
    (sqrt (+ (expt (- x2 x1) 2)
	     (expt (- y2 y1) 2)))))

(define (perimeter r)
  (+ (* 2 (length-segment (segment-1 r)))
     (* 2 (length-segment (segment-2 r)))))

(define (square r)
  (* (length-segment (segment-1 r))
     (length-segment (segment-2 r))))

(define (make-rectangle p1 p2 p3)
  "Представление прямоугольника по трём точкам"
  (cons p1 (cons p2 p3)))

(define (segment-1 r)
  (make-segment (car r) (cadr r)))

(define (segment-2 r)
  (make-segment (car r) (cddr r)))
