#lang simply-scheme

(define (switch-iter sent)
  (if (equal? sent '()) '()
      (sentence (replacePronouns (first sent)) (switch-iter (bf sent)))))

(define (replacePronouns wd)
  (cond ((or (equal? wd 'you) (equal? wd 'You)) 'me)
        ((or (equal? wd 'I) (equal? wd 'i) (equal? wd 'me)) 'you)
        (else wd)))

(define (switch sent)
  (if (or (equal? (first sent) 'you) (equal? (first sent) 'You)) (sentence 'I (bf (switch-iter sent)))
      (switch-iter sent)))
