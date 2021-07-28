#lang simply-scheme

(define (square x) (* x x))

(define (squares a)
  (if (equal? a '()) '()
      (sentence (square (first a)) (squares (bf a)))))

