; ======================================
; LISP Language Semantic Preview
; AutoLISP / Common Lisp style
; ======================================


; ---------- Variables ----------

(setq nome "Esron")

(setq idade 30)



; ---------- Lists ----------

(setq linguagens
  '(
    "Lisp"
    "Scheme"
    "Clojure"
  )
)



; ---------- Function ----------

(defun saudacao (nome)

  (strcat
    "Olá "
    nome
  )

)



; ---------- Mathematical Function ----------

(defun soma (a b)

  (+ a b)

)



; ---------- Conditional ----------

(defun verificar-idade (idade)

  (if
    (> idade 18)

    "Maior de idade"

    "Menor de idade"

  )

)



; ---------- Local Variables ----------

(defun calculo (/ resultado)

  (setq resultado
    (* 10 5)
  )

  resultado

)



; ---------- Lambda ----------

(setq multiplicar

  (lambda
    (a b)

    (* a b)

  )

)



; ---------- List Processing ----------

(setq numeros
  '(1 2 3 4 5)
)


(car numeros)

(cdr numeros)



; ---------- Loop ----------

(repeat 5

  (princ "Loop Lisp")

)



; ---------- Object Style Example ----------

(defun criar-ponto (x y)

  (list
    x
    y
  )

)



; ---------- AutoCAD Example ----------

(defun c:TESTE ()

  (command
    "LINE"
    '(0 0)
    '(100 100)
    ""
  )

)



; ---------- Print ----------

(princ
  (saudacao nome)
)


(princ)