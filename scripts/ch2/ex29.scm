(define-module (ch2 ex29)
  :export (make-mobile
	   make-branch
	   total-weight
	   balanced-mobile?))

(define (make-mobile l r)
  "make mobile with left and right branches"
  (list l r))

(define (make-branch lenght struct)
  "make branch with length and structure"
  (list lenght struct))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-lenght branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-branch-weight branch)
  (let ((struct (branch-structure branch)))
    (if (pair? struct) (total-weight struct)
	struct)))

(define (total-weight mobile)
  (+ (total-branch-weight (left-branch mobile))
     (total-branch-weight (right-branch mobile))))

(define (momentum branch)
  (* (branch-lenght branch)
     (total-branch-weight branch)))


(define (balanced-mobile? mobile)
  (if (pair? mobile)
      (and (= (momentum (left-branch mobile))
	  (momentum (right-branch mobile)))
       (balanced-mobile? (branch-structure (left-branch mobile)))
       (balanced-mobile? (branch-structure (right-branch mobile)))))
  #t)
