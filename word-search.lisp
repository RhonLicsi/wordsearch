(in-package :word-search)

;; Generates a random letters
(defun random-letter ()
  (aref "ABCDEFGHIJKLMNOPQRSTUVWXYZ" (random 26)))

;; Creating a grid
(defun grid ()
  (dotimes (i 10)
    (dotimes (j 10)
      (format t "~a "(random-letter)))
    (format t "~%")))



