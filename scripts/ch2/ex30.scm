(define-module (ch2 ex30)
  :export (sq-tree))


(define (sq-tree tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree) (sq-tree sub-tree)
	     (* sub-tree sub-tree)))
       tree))
