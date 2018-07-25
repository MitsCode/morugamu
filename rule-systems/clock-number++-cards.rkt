#lang racket

(provide render
         #;generate)

(require "../rule-systems/card-designs.rkt"
         "../rule-systems/rules.rkt"
         "./redex/clock-numbers++.rkt"
         "./redex/rule-grabber.rkt"
         2htdp/image
         redex)

(module+ test
  (require (prefix-in list: "./list-algebra-cards.rkt"))
  (require (prefix-in list: "../themes/emoji-list-algebra.rkt"))
  (define b (list:render list:theme))

  (require (prefix-in numb: "./clock-number-cards.rkt"))
  (require (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt"))

  (define n (numb:render numb:theme))

  (render numb:theme))

(define (generate difficulty)
  (generate-term clock-numbers++-lang e difficulty))

(define (render theme)

  (define-tile the-successor  'S++   (first theme))
  (define-tile the-previous   'P++   (second theme))

  (flatten (list
            (get-all-symbols)

            (redex-to-rule-card (rules-for 'S++))
            (redex-to-rule-card (rules-for 'P++)))))

