(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x w)
	 (map (lambda (y) (* x y)) w))
       v m))

(define (matrix-*-vector m v)
  (map (lambda (x w)
	 (accumulate (lambda (y acc) (* x y acc)) 1 w))
       v m))

(define (transpose m)
  (accumulate-n
   cons '()
   m))

(define (matrix-*-matrix m n)
  (let ((tn (transpose n)))
    (map (lambda (x)
	   (matrix-*-vector tn x)) m)))
