(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))


(define (total-weight-branch branch)
  (let ((bs (branch-structure branch)))
    (if (not (pair? bs)) bs
	(+ (total-weight-branch (left-branch bs))
	   (total-weight-branch (right-branch bs))))))

(define (total-weight mobile)
  (if (null? mobile) 0
      (+ (total-weight-branch (left-branch mobile))
	 (total-weight-branch (right-branch mobile)))))

(define (branch-moment branch)
  (* (branch-length branch) (total-weight-branch branch)))

(define (balanced-mobile? mobile)
  (let ((lb (left-branch mobile))
	(rb (right-branch mobile)))
    (and
       (= (branch-moment lb)
	  (branch-moment rb))
       (balanced-branch? lb)
       (balanced-branch? rb))))

(define (balanced-branch? branch)
  (let ((bs (branch-structure branch)))
    (or (not (pair? bs))
	(balanced-mobile? bs))))
