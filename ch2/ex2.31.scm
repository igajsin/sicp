(define (tree-map proc items)
  (map (lambda (x) (if (pair? x) (tree-map proc x)
		  (proc x)))
       items))
