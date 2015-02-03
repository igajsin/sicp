(define zero (lambda (f)
	       (lambda (x) x)))

(define one
  (lambda (f)
    (lambda (x) (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define (add-1 n)
  (lambda (f) (lambda (x)
	   (f ((n f) x)))))

(define (plus n m)
  (lambda (f)
    (lambda (x)
      (lambda (y)
	(((m f) x) y)
	((n f) x)))))

(define tr
  (lambda (f)
    (lambda (x)
      (f (f (f x))))))

(define tr2
  (lambda (f)
    (lambda (x)
      (lambda (x) (f (f x))
	 (f x)))))


(define (plus n m)
  (lambda (f)
    (lambda (x)
      (((m f ) x) ((n f) x)))))
