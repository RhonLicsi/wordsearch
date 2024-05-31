(in-package :word-search)

(defparameter *grid* #2A(
                         (#\W #\E #\L #\C #\O #\M #\E)
                         (#\T #\O #\T #\H #\E #\G #\A)
                         (#\W #\O #\R #\D #\S #\E #\A)
                         (#\R #\C #\H #\G #\A #\M #\E)
                         (#\E #\X #\A #\M #\P #\L #\E)
                         ))

(defparameter *words* '("WELCOME" "TO" "THE" "WORD" "SEARCH" "GAME" "EXAMPLE"))

(defun foo ()
  (format t "hello"))
