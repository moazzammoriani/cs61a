#lang simply-scheme

(define (ends-e sntc)
  (if (equal? sntc '()) '()
      (sentence (wd-ends-e (first sntc)) (ends-e (bf sntc)))))
      

(define (wd-ends-e wd)
  (if (equal? (last wd) 'e) wd 
      '()))

