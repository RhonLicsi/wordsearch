(in-package :word-search)


;; Container of grid with a random letter
(defparameter *grid* (make-array '(10 10) :initial-element #\space))
(defparameter *word-set* '("ISO" "RAZE" "YORU" "JETT" "REYNA"))

(defparameter *word-coordinates* (make-hash-table :test #'equal))

(defun random-letter ()
  (aref "ABCDEFGHIJKLMNOPQRSTUVWXYZ" (random 26)))

(defun checker (word start-row start-col direction)
  (let ((len (length word)))
    (cond
      ((= direction 0)  ; Horizontal
       (loop for i from 0 to (- len 1) always (char= (aref *grid* start-row (+ start-col i)) #\space)))
      ((= direction 1)  ; Vertical
       (loop for i from 0 to (- len 1) always (char= (aref *grid* (+ start-row i) start-col) #\space)))
      ((= direction 2)  ; Diagonal
       (loop for i from 0 to (- len 1) always (char= (aref *grid* (+ start-row i) (+ start-col i)) #\space))))))

(defun horizontal (word)
  (let ((len (length word)))
    (loop until (let* ((start-col (random (- 10 len)))
                       (start-row (random 9)))
                  (when (checker word start-row start-col 0)
                    (dotimes (i len)
                      (setf (aref *grid* start-row (+ start-col i)) (char word i)))
                    (push (list start-row start-col 0) (gethash word *word-coordinates*)))))))

(defun vertical (word)
  (let ((len (length word)))
    (loop until (let* ((start-row (random (- 10 len)))
                       (start-col (random 9)))
                  (when (checker word start-row start-col 1)
                    (dotimes (i len)
                      (setf (aref *grid* (+ start-row i) start-col) (char word i)))
                    (push (list start-row start-col 1) (gethash word *word-coordinates*)))))))

(defun diagonal (word)
  (let ((len (length word)))
    (loop until (let* ((start-row (random (- 10 len)))
                       (start-col (random (- 10 len))))
                  (when (checker word start-row start-col 2)
                    (dotimes (i len)
                      (setf (aref *grid* (+ start-row i) (+ start-col i)) (char word i)))
                    (push (list start-row start-col 2) (gethash word *word-coordinates*)))))))


(defun place-words ()
  (clear-grid)  ; Clear the grid before placing new words
  (clrhash *word-coordinates*) ; Clear Hash table
  (dolist (word *word-set*)
    (if (>= (length word) 10)
        (format t "Word ~a is too long~%" word)
        (let ((direction (random 3)))
          (cond ((= direction 0) (horizontal word))
                ((= direction 1) (vertical word))
                ((= direction 2) (diagonal word)))))))


(defun clear-grid ()
  (setf *grid* (make-array '(10 10) :initial-element #\space)))


(defun print-grid ()
  (dotimes (i 10)
    (dotimes (j 10)
      (if (char= (aref *grid* i j) #\space)
          (format t "~a " (random-letter))
          (format t "~a " (aref *grid* i j))))
    (format t "~%")))


(defun search-word (word)
  (let ((coords '())
        (word-info (gethash word *word-coordinates*)))
    (if word-info
        (destructuring-bind (start-row start-col direction) (car word-info) ; Extract the first element of the list
          (dotimes (i (length word) coords)
            (setq coords (append coords (list (case direction
                                                (0 `(,start-row ,(+ start-col i)))  ; horizontal
                                                (1 `(,(+ start-row i) ,start-col))  ; vertical
                                                (2 `(,(+ start-row i) ,(+ start-col i)))))))))
	coords)))


(place-words) ;; Start/Reset
(print-grid) ;; Show the Grid 
(search-word " word ") ;; Search Function













