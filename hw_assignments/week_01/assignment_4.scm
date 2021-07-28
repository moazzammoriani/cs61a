#lang simply-scheme

(define (emptyOrWillBe? sntc)
  (if (or (equal? sntc '()) (equal? (bf sntc ) '())) #t
      #f))

(define (ordered? sntc)
  (if (emptyOrWillBe? sntc) #t
      (and (< (first sntc) (first (bf sntc))) (ordered? (bf sntc)))))
