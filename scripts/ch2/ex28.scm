(define-module (ch2 ex28)
  :export (fringe))

(define (fringe lst)
  (cond
   ((null? lst) '())
   ((pair? (car lst))
    (append
     (fringe (car lst))
     (fringe (cdr lst))))
   (else lst)))
