;; installazione ambiente Lisp: Emacs + SLIME + sbcl
;; http://www.mohiji.org/2011/01/31/modern-common-lisp-on-linux/

;; Alt-TAB su Ubuntu:
;; http://ubuntuforums.org/showthread.php?t=2211863

#|
 il Lisp e' case-insensitive,
 la convenzione moderna e' scriverlo minuscolo
|#

;; 
;; si inizia dai classici
(PRINT "Hello, World!")
(print "Hello, World!")

;; defun crea una funzione
(defun hello-world ()
  (print "Hello, World!"))

;; che puo' essere usata subito...
(hello-world)


;; la notazione prefissa all'inizio e' ostica
(defun y (x a b)
  ;; return di solito non e' necessario. sarebbe (return-from y ...)
  ;; in CL tutto e' un'espressione
  ;; e le funzioni ritornano l'ultima espressione valutata
  (+ (* a x) b)) ;; y = a*x + b

(y 1 2 -5)

(defun abs% (x)
  ;; espressioni condizionali: if, when, unless, cond, case
  (if (>= x 0)
      x
      (- x)))

(defun square (x)
  (* x x))

(defun cube (x)
  ;; le operazioni aritmetiche + - * /
  ;; accettano N argomenti, non solo due
  (* x x x))

(print (square -7))
(print (square 1/3))   ;; i razionali (frazioni) sono tipi primitivi
(print (square 9.0f0)) ;; single-float
(print (square 9.0d0)) ;; double-float
(print (square #C(0 1))) ;; complex rational
(print (square #C(0.0 1.0))) ;; complex single-float (c'e' anche complex double-float)

;; fixnum = interi "piccoli" ed efficienti, entrano nei registri della CPU

;; bignum = interi a precisione arbitraria. usati automaticamente!
;; non esiste overflow degli interi o razionali
(print (cube 100000000))
(print (cube 100000000/11111111111))

(defun day-of-week (n)
  ;; per il calcolo simbolico, gli enum, ecc.
  ;; si usano i symbol
  (case n
    (1 'monday)
    (2 'tuesday)
    (3 'wednesday)
    (4 'thursday)
    (5 'friday)
    (6 'saturday)
    ((0 7) 'sunday)
    (otherwise 'unknown)))

(day-of-week 3)

;; variabili locali: let, let*
(let ((a 1)
      (b 2)
      (c (+ a b)))
  (setf a (square a)
        b c
        c a)
  (format *standard-output* "~&~S ~S ~S" a b c))


;; costanti globali. e' convenzione chiamarle +nome+
(defconstant +the-answer+ 42)

;; variabili globali. e' convenzione chiamarle *nome*
(defvar *x* 7/10) ;; valutata solo la prima volta
(defparameter *y* (get-universal-time)) ;; valutata ad ogni esecuzione

;; iterazione: loop, dotimes, dolist, do
(defun factorial (n)
  ;; le dichiarazioni di tipo sono opzionali
  (declare (type fixnum n))
  (let ((result 1))
    (loop for i from 1 to n
       do
         (setf result (* result i)))
    result))

(factorial 5)
(factorial 100)

;; logica booleana: nil, t, if, when, unless, cond, or, and, not, null

;; NIL significa falso (ha anche un altro significato: lista vuota)
;; Qualsiasi altro valore e' considerato VERO.
;; La costante T ha come unico significato VERO.

;; (if condizione
;;     then
;;     else)

;; (when condizione
;;  then1
;;  then2
;;  ...)


;; (unless condizione
;;  else1
;;  else2
;;  ...)


;; (cond
;;   (condizione1 espressione1)
;;   (condizione2 espressione2)
;;   ...
;; )


;; (and a b c ...)
;; restituisce nil se almeno un argomento e' falso,
;; oppure l'ultimo argomento se sono tutti veri.

(and 1 2)

;; quiz: cosa restituisce (and) senza argomenti?

;; (or a b c ...)
;; restituisce il primo argomento vero,
;; oppure nil se sono tutti falsi

(or 1 2)

;; quiz: cosa restituisce (or) senza argomenti?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; esistono, ma non approfondiamo stasera:

;; tipi compositi: array (e string), hash-table

;; defstruct, defclass, defmethod

;; eccezioni: conditions, unwind-protect, handler-case...

;; local functions, macros, symbol-macros, reader macros




