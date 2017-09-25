(define-module (ch2 ex37)
  #:use-module (ch2 ex33)
  #:use-module (ch2 ex36)
  :export (dot-product
	   matrix-*-vector
	   transpose
	   matrix-*-matrix))

(define (dot-product u v)
  (accumulate + 0
	      (map * u v)))

(define (matrix-*-vector m v)
  (map (lambda (u) (map * u v)) m))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector n v)) m)))
