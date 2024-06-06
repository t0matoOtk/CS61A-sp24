(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  (define (totwo s i) 
    (if (null? s)
        ()
        (cons (list i (car s)) 
              (totwo (cdr s) (+ i 1)))
    )
  )
  (totwo s 0)
)
  ; END PROBLEM 15

;function s:
;     int i = 0;
;     if (s == nil){
;         return nil
;     }
;     else{
;         return ((i,s[0]),enumerate(s[1:]))
;     }

;; Problem 16

;; Merge two lists S1 and S2 according to ORDERED? and return
;; the merged lists.
(define (merge ordered? s1 s2)
  ; BEGIN PROBLEM 16
    (cond ((null? s1) s2)
          ((null? s2) s1)
          ((ordered? (car s1) (car s2)) 
                     (cons (car s1) (merge ordered? (cdr s1) s2)))
          (else (cons (car s2) (merge ordered? s1 (cdr s2))))
    
    )
  )
  ; END PROBLEM 16
; func (s1 s2){
;     if (s1 = nil)
;         return s2
;     if (s2 = nil)
;         return s1
;     if (s1 < s2){
;         return s1[0] + func(s1[1:],s2)
;     }
;     else {
;         return s2[0] + func(s1, s2[1:]) 
;     }
; }

;; Optional Problem 2

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN OPTIONAL PROBLEM 2
         'replace-this-line
         ; END OPTIONAL PROBLEM 2
         )
        ((quoted? expr)
         ; BEGIN OPTIONAL PROBLEM 2
         'replace-this-line
         ; END OPTIONAL PROBLEM 2
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
           'replace-this-line
           ; END OPTIONAL PROBLEM 2
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
           'replace-this-line
           ; END OPTIONAL PROBLEM 2
           ))
        (else
         ; BEGIN OPTIONAL PROBLEM 2
         'replace-this-line
         ; END OPTIONAL PROBLEM 2
         )))

; Some utility functions that you may find useful to implement for let-to-lambda

(define (zip pairs)
  'replace-this-line)
