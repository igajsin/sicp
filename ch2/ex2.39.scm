(define (rvrse1 seqs)
  (fold-right
   (lambda (x acc) (append acc (list x)))
   '() seqs))

(define (rvrse2 seqs)
  (fold
   cons
   '() seqs))
