(define (fringe tree)
  (cond
   ((null? tree) '())
   ((not (pair? (car tree)))
    (cons (car tree) (fringe (cdr tree))))
   (else (append (fringe (car tree))
		 (fringe (cdr tree))))))
