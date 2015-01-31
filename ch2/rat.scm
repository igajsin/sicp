(define (M n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))
(define n car)
(define d cdr)

(define (print-rat x)
  (newline)
  (display (n x))
  (display "/")
  (display (d x)))

(define (add-rat x y)
  (M (+ (* (n x) (d y))
	(* (n y) (d x)))
     (* (d x) (d y))))

(define (sub-rat x y)
  (M (- (* (n x) (d y))
	(* (n y) (d x)))
     (* (d x) (d y))))

(define (mul-rat x y)
  (M (* (n x) (n y))
     (* (d x) (d y))))

(define (div-rat x y)
  (M (* (n x) (d y))
     (* (d x) (n y))))

(define (equal-rat? x y)
  (= (* (n x) (d y))
     (* (d x) (n y))))
