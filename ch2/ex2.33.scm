(define (accumulate op init sequences)
  (if (null? sequences) init
      (op (car sequences) (accumulate op init (cdr sequences)))))

(define (mp op sequences)
  (accumulate (lambda (x acc)
		(cons (op x) acc))
	      '() sequences))

(define (appnd seq1 seq2)
  (accumulate cons seq2 seq1))

(define (lngth seq1)
  (accumulate (lambda (x acc)
		(+ 1 acc)
		) 0 seq1))
