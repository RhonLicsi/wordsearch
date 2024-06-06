(in-package :word-search)

;; Generates a random letters
(defun random-letter ()
  (aref "ABCDEFGHIJKLMNOPQRSTUVWXYZ" (random 26)))

;; Creating a grid
(defun grid ()
  (dotimes (i 5)
    (dotimes (j 10)
      (format t "~a "(random-letter)))
    (format t "~%")))

;; Set of Words
(defvar *word-set* '("APPLE" "BANANA" "ORANGE" "GRAPE" "KIWI"))

;; Space of the word
(defun word-space (word)
  (loop for letter across word do (format t "~a " letter))
  (format t "~%"))

;; Print of words
(defun print-word (words)
  (loop for word in words
        do (word-space word)))

;; Words with random letters
(defun fill-random (word)
  (let* ((count (- 10 (length word)))
         (fcount (random (+ 1 count))))
    (concatenate 'string
                 (loop repeat fcount collect (random-letter)) ; For the front of the word
                 word
                 (loop repeat (- count fcount) collect (random-letter))))) ; For the back of the word

;; To Print
(defun print-all ()
  (let ((grid (grid))) ; Generate the grid
    (dolist (word *word-set*) ; Iterate over each word in *word-set*
      (let ((filled-word (fill-random word))) ; Fill the word randomly
        (format t "~{~a ~}~%" (coerce filled-word 'list)))) ; Print the filled word
    (format t "~a" grid))) ; Print the grid after the words

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;Trial stages

;; Create a row
(defun row-random ()
  (loop repeat 10
      do (format t "~a "(random-letter))))


;; Another loop
(defun grid ()
  (loop repeat 10
        collect (loop repeat 10
                      collect (random-letter))))

;; Inserting words in grid random
(defun insert-words (grid)
  (dolist (word *word-set*)
    (let* ((len (length word))
           (row (random (- 10 len))))
      (loop
            do (let (())))))
  grid)










