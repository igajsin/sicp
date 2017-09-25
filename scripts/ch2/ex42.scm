(define-module (ch2 ex42)
  #:use-module (ch2 ex40)
  #:use-module (srfi srfi-1))

(define empty-board '())

(define (enumerate-interval start end)
  (iota (- end start -1) start 1))

(define (adjoin-position new-row k rest-of-queens)
  )

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0) (list empty-board)
	(filter
	 (lambda (pos) (safe? k pos))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map
	     (lambda (new-row)
	       (adjoin-position new-row k rest-of-queens))
	     (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))
