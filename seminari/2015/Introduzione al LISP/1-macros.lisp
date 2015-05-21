;; esempio di DSL: cl-who, un linguaggio per generare HTML

(ql:quickload :cl-who)
(use-package :cl-who)

;; client http
(ql:quickload "drakma")
;; server web - classico
(ql:quickload "hunchentoot")
;; server web - nuovo
;; apt-get install libev4 libuv0.10
(ql:quickload "woo")


(with-html-output (o *standard-output* :indent t)
  (:html
   (:head
    (:title "Google"))
   (:body
    (loop repeat 3 do
	 (htm
	  (:a :href "http://www.google.com/"
	      "Google"))))))

(print
 (with-html-output-to-string (o)
   (:table
    (:tr
     (:td (esc "Hello, World! <>"))))))


;; come si creano i DSL? estendendo il linguaggio

;; come si estende il linguaggio? con le macro

;; cosa sono le macro? funzioni invocate durante la compilazione,
;; che scrivono codice

;; come si rappresenta il codice Lisp? con una lista

;; le macro di solito manipolano liste

(+ 1 2)
'(+ 1 2)
(list '+ 1 2)

;; altro uso dei symbol: nelle liste che contengono codice
(list 'square 7)
'(square 7)

'(+ x y))
(list '+ 'x 'y))


;; proviamo a leggere un file Lisp come lista!
(defparameter *path* "/home/max/common-lisp/lisp-intro/0-hello-world.lisp")
(defparameter *in* (open *path*))

;; ripetere...
(read *in*)

(loop while (print (read *in* nil)))

(close *in*)


;; la lista vuota e' NIL, la stessa costante che significa anche FALSO.
(list)

;; eval non e' quasi mai necessario...
;; ma e' utile per provare a manipolare il codice Lisp
;; sotto forma di lista
(eval '(+ 1 2))
(eval '(square 7))


;; le funzioni e macro per manipolare le liste sono oltre un centinaio

(defvar *l* (list 4 5 6))
(first *l*)
(rest *l*)
(setf (first *l*) -4)
(setf (second *l*) -5)

;; car = first
;; cdr = rest

*l*
(push 3 *l*) ;; (setf *l* (append '(3) *l*))
(pop *l*)



(defun symbolic-add (x y)
  (list '+ x y))

(defun symbolic-add (x y)
  ;; sbagliato...
  '(+ x y))

(defun symbolic-add (x y)
  ;; corretto. quasiquote
  `(+ ,x ,y))

;; le macro sono funzioni
;; da eseguire durante la compilazione
(defmacro add (x y)
  `(+ ,x ,y))

(add 2 3)
(macroexpand '(add 2 3))


(defmacro add (&rest args)
  `(+ ,@args))



;; usi possibili delle macro? illimitati... alcuni esempi:
;;   acquisizione e rilascio di risorse (with-*)
;;   loop-unrolling
;;   specializzazione di funzioni
;;   linguaggi specifici per generare HTML, XML, JSON, Javascript...

;; si parte dal codice che vogliamo generare: prima versione
(let ((f (open *path*)))
  (read f)
  (close f))

;; seconda versione
(let ((f (open *path*)))
  (unwind-protect ;; equivalente al try-finally di altri linguaggi
       (read f)
    (close f)))

;; e si trasforma in una macro
(defmacro with-open-file% ((f filename &rest options) &body body)
  `(let ((,f (open ,filename ,@options)))
     (unwind-protect
          (progn ,@body)
       (close ,f))))

(macroexpand
 '(with-open-file% (in *path*)
   (read in)))

(with-open-file% (in *path*)
  (loop while (print (read in nil))))

;; with-pooled-db-connection

;; with-http-connection

;; with-lock

;; altri esempi?

;; attenzione a non cadere nell'approccio
;; "soluzione in cerca di un problema"

;; la domanda da farsi non e' "per cosa posso usare le macro?"

;; ma e' "ho questo problema, le macro possono aiutarmi?"



(macroexpand '(and a b c))

(macroexpand '(or a b c))

;; esempio: implementare AVERAGE

;; esempio: implementare AND e OR di due argomenti.
;; AND e' facile. Invece OR ha un problema: non e' igienico, serve (gensym)

;; esempio: implementare AND e OR di n argomenti

;; soluzioni degli esempi in 2-macros.lisp



