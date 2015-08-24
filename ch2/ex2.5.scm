(define (cons5 x y)
  (* (expt 2 x) (expt 3 y)))

(define (check? p x y)
  (= p (* (expt 2 x) (expt 3 y))))

(define (car5 p)
  (define (wlkx p x y)
    (define (wlky p x y)
      (cond
       ((= 0 y) #f)
       ((check? p x y) #t)
       (#t (wlky p x (- y 1)))))
    (cond
     ((= 0 x) #f)
     ((wlky p x y) x)
     (#t (wlkx p (- x 1) y))))
  (wlkx p 5 5))


(define (cdr5 p)
  (define (wlky p x y)
    (define (wlkx p x y)
      (cond
       ((= x 0) #f)
       ((check? p x y) #t)
       (#t (wlkx p (- x 1) y))))
    (cond
     ((= 0 y) #f)
     ((wlkx p x y) y)
     (#t (wlky p x (- y 1)))))
  (wlky p 5 5))
