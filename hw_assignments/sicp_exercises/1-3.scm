#lang simply-scheme

(define (greater a b)
  (if (>= a b) a
        b))
(define (lesser a b)
  (if (<= a b) a b))

(define (square a)
  (* a a))

(define (SumOSq a b c)
  (+ (square (greater a b)) (square (greater (lesser a b) c)))) 

