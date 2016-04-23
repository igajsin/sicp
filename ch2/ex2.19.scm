(define no-more? null?)
(define first-denominator car)
(define last-denominators cdr)

(define (cc amount coins)
  (cond
   ((= amount 0) 1)
   ((or (< amount 0) (no-more? coins)) 0)
   (else (+ (cc amount
		(last-denominators coins))
	    (cc (- amount (first-denominator coins))
		coins)))))
