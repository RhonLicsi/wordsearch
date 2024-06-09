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
(defvar *word-set* '("APPLE" "BANANA" "ORANGE" "GRAPES" "KIWI"))

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

;; Container of grid with a random letter
(defparameter *grid* (make-array '(10 10) :initial-element #\space))
(defvar *word-set* '("APPLE" "BANANA" "ORANGE" "GRAPES" "KIWI"))

(defun random-letter ()
  (aref "ABCDEFGHIJKLMNOPQRSTUVWXYZ" (random 26)))

(defun horizontal (word)
  (let* ((len (length word))
         (max-col (- 10 len))
         (start-col (random (+ 1 max-col)))
         (start-row (random 10)))
    (dotimes (i len)
      (setf (aref *grid* start-row (+ start-col i)) (char word i)))
    (format t "Placed horizontal word ~a at row ~a, column ~a~%" word start-row start-col)))

(defun clear-grid ()
  (setf *grid* (make-array '(10 10) :initial-element #\space)))

(defun place-words ()
  (clear-grid)  ; Clear the grid before placing new words
  (dolist (word *word-set*)
    (horizontal word)))

(defun print-grid ()
  (dotimes (i 10)
    (dotimes (j 10)
      (if (char= (aref *grid* i j) #\space)
          (format t "~a " (random-letter))
          (format t "~a " (aref *grid* i j))))
    (format t "~%")))

(place-words) ;;Reset
(print-grid)















