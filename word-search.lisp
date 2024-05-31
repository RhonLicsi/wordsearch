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

CC
(defvar word-set '("APPLE" "BANANA" "ORANGE" "GRAPE" "PINEAPPLE"))

(defun word-space (word)
  (loop for letter across word do (format t "~a " letter))
  (format t "~%"))

(defun print-word (words)
  (loop for word in words
        do (word-space word)))



