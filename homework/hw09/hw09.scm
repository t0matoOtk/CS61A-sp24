(define (curry-cook formals body)
  (if (null? formals)
      body
      `(lambda (,(car formals)) ,(curry-cook (cdr formals) body))))


; def curry(s1 s2){
;   if (s1!=null:)
;       lambda(head(s1), curry(tail(s1),s2))
;   else s2
; }

(define (curry-consume curry args)
    (if (null? args)
        curry
        (curry-consume (curry (car args)) (cdr args))
    )  
)
; def curry_consume(s1 s2){
;     if s2 == null
;         return s1
;     else 
;         return curry_consume(s1(head s2), (tail s2))
; }

(define-macro (switch expr options)
  (switch-to-cond (list 'switch expr options)))

(define (switch-to-cond switch-expr)
  (cons 'cond
        (map (lambda (option)
                (cons `(equal? ,(car (cdr switch-expr)) ,(car option)) (cdr option))
             )
             (car (cdr (cdr switch-expr))))
        )
  )
