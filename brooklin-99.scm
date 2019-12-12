(define (flat list)
          (if (equal? (length list) 0)
               0
                    (+ (car list) (flat (cdr list)))))
                    
(define (scale a b) ;; returns 0 if items are equal, 1 if first is heavier, 2 if second is heavier
          (if (equal? a b)
               0
               (begin
                    (if (> a b)
                         1
                         2
                         )
               )
          )
)

(define pp (list 2 2 2 2 2 2 2 2 2 2 2 1))

(define (do-dat-thing pp) (begin
     (define p1 (list (list-ref pp 0)(list-ref pp 1)(list-ref pp 2)(list-ref pp 3)))
     (define p2 (list (list-ref pp 4)(list-ref pp 5)(list-ref pp 6)(list-ref pp 7)))
     (define p3 (list (list-ref pp 8)(list-ref pp 9)(list-ref pp 10)(list-ref pp 11)))

     (define w1 (scale (flat p1) (flat p2))) ;; first weighing
          
          ; (cond ((> 3 3) 'greater)
          ; 
          ;       ((< 3 3) 'less)
          ; 
          ;       (else 'equal))
          
     (cond ((equal? w1 0) (begin
                              (define w2 (scale (flat(list (car p3)(cadr p3)(caddr p3))) (flat(list (car p1)(cadr p1)(caddr p1)))))
                              (cond ((equal? w2 0) (begin
                                                       (define w3 (scale (cadddr p3) (car p1)))
                                                       (if (equal? w3 1)
                                                            (begin
                                                                 (display (cadddr p3))
                                                                 (display " is heavier!")
                                                                 (newline))
                                                            (begin
                                                                 (display (cadddr p3))
                                                                 (display " is lighter!")
                                                                 (newline)))))
                                    ((or (equal? w2 1) (equal? w2 2)) (begin
                                                                           (define w3 (scale (car p3) (cadr p3)))
                                                                           (cond ((equal? w3 0) (begin
                                                                                                    (display (caddr p3))
                                                                                                    (cond ((equal? w2 1) (display " is heavier!"))
                                                                                                          ((equal? w2 2) (display " is lighter!"))
                                                                                                    )
                                                                                                    (newline)))
                                                                                 ((equal? w2 2) (begin
                                                                                                    (cond ((equal? w3 1) (begin
                                                                                                                        (display (cadr p3))
                                                                                                                        (display " is lighter!")
                                                                                                                        (newline)     
                                                                                                                        ))
                                                                                                          ((equal? w3 2) (begin
                                                                                                                        (display (car p3))
                                                                                                                        (display " is lighter!")
                                                                                                                        (newline))))))
                                                                                 ((equal? w2 1) (begin
                                                                                      (cond ((equal? w3 1) (begin
                                                                                                          (display (car p3))
                                                                                                          (display " is heavier!")
                                                                                                          (newline)     
                                                                                                          ))
                                                                                            ((equal? w3 2) (begin
                                                                                                          (display (cadr p3))
                                                                                                          (display " is heavier!")
                                                                                                          (newline))))))
                                                                           )))
          )))
           ((or (equal? w1 1) (equal? w1 2)) (begin
                                              (if (equal? w1 1)
                                                   (begin
                                                        (define h p1)
                                                        (define l p2))
                                                   (begin
                                                        (define h p2)
                                                        (define l p1)))
                                              (define w2 (scale (flat (list (car h)(cadr h)(car l)(cadr l)(caddr l))) (flat (list (cadddr l) (flat p3))))) ;; second weighing
                                              (cond ((equal?  w2 1) (begin
                                                                       (define w3 (scale (car h) (cadr h))) ;; third weighing
                                                                       (cond ((equal? w3 0) (begin
                                                                                               (display (cadddr l))
                                                                                               (display " is lighter!")
                                                                                               (newline)))
                                                                             ((equal? w3 1) (begin
                                                                                               (display (car h))
                                                                                               (display " is heavier!")
                                                                                               (newline)))
                                                                             ((equal? w3 2) (begin
                                                                                               (display (cadr h))
                                                                                               (display " is heavier!")
                                                                                               (newline))))))
                                                                           
                                                    ((equal? w2 2) (begin
                                                                      (define w3 (scale (car l) (cadr l)))  ;; third weighing
                                                                      (cond ((equal? w3 0) (begin
                                                                                               (display (caddr l))
                                                                                               (display " is lighter!")
                                                                                               (newline)))
                                                                            ((equal? w3 1) (begin
                                                                                               (display (cadr l))
                                                                                               (display " is lighter!")
                                                                                               (newline)))
                                                                            ((equal? w3 2) (begin
                                                                                               (display (car l))
                                                                                               (display " is lighter!")
                                                                                               (newline))))))
                                                    ((equal? w2 0) (begin
                                                                      (define w3 (scale (caddr h) (cadddr h))) ;; third weighing
                                                                      (cond ((equal? w3 1) (begin
                                                                                               (display (caddr h))
                                                                                               (display " is heavier!")
                                                                                               (newline)))
                                                                            ((equal? w3 2) (begin
                                                                                               (display (cadddr h))
                                                                                               (display " is heavier!")
                                                                                               (newline))))))
                                              )          
     )))
))

(do-dat-thing pp)
