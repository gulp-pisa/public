;;;;;;;;;;;;;;;;;;;;; ATTENZIONE ;;;;;;;;;;;;;;;;;;;;;;;
;;                                                    ;;
;;    questo file NON e' stato usato ne' spiegato     ;;
;;    durante la presentazione del 20 maggio 2015     ;;
;;                                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; esempio: implementare AVERAGE

(defmacro average (&rest args)
  `(/ (+ ,@args) ,(length args)))

;; esempio: implementare AND e OR di due argomenti.
;; AND e' facile. Invece OR ha un problema... non e' igienico, serve (gensym)

(defmacro and-2 (a b)
  `(if ,a
       ,b
       nil))

(macroexpand '(and-2 (f) (g)))

(defmacro or-2 (a b)
  (let ((va (gensym)))
    `(let ((,va ,a))
       (if ,va
	   ,va
	   ,b))))

(macroexpand '(or-2 (f) (g)))

;; esempio: implementare AND e OR di n argomenti

(defmacro and-n (&rest args)
  (if (null args)
      t
      (let ((a0 (first args))
	    (an (rest args)))
	(if (null an)
	    a0
	    `(if ,a0
		 (and-n ,@an)
		 nil)))))
		      
(macroexpand '(and-n))
(macroexpand '(and-n 1))
(macroexpand '(and-n 1 2))
(macroexpand '(and-n 1 2 3))

(defmacro or-n (&rest args)
  (if (null args)
      nil
      (let ((va0 (gensym))
	    (a0 (first args))
	    (an (rest args)))
	(if (null an)
	    a0
	    `(let ((,va0 ,a0))
	       (if ,va0
		   ,va0
		   (or-n ,@an)))))))

(macroexpand '(or-n))
(macroexpand '(or-n 1))
(macroexpand '(or-n 1 2))
(macroexpand '(or-n 1 2 3))

;; una macro decisamente complicata: LOOP

