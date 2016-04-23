(define (square-tree tree)
  (cond
   ((null? tree) '())
   ((not (pair? (car tree)))
    (cons (* (car tree) (car tree)) (square-tree (cdr tree))))
   (else (cons (square-tree (car tree))
	       (square-tree (cdr tree))))))

(define (square-tree1 tree)
  (map (lambda (x) (if (pair? x) (square-tree1 x)
		  (* x x)))
       tree))
