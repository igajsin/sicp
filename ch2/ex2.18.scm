(define (rvrse-req items acc)
  (if (null? items) acc
      (rvrse-req (cdr items) (cons (car items) acc))))

(define (fld fn init items)
  (if (null? items) init
      (fld fn (fn (car items) init) (cdr items))))

(define (rvrse items)
  (fld cons '() items))
