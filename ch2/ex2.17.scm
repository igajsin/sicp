(define (lst-pair items)
  (if (null? items) '()
      (if (null? (cdr items)) items
	  (lst-pair (cdr items)))))
