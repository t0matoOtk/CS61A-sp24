(define (square n) (* n n))

(define (pow base exp)
  (if (= exp 0)
      1
      (if (= (modulo exp 2) 1)
          (* base (pow (* base base) (quotient exp 2)))
          (pow (* base base) (quotient exp 2)))))

(define (repeatedly-cube n x)
  (if (zero? n)
      x
      (let  (
               (y (repeatedly-cube (- n 1) x))
            )
        (* y y y))))

(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cdr (cdr s))))


