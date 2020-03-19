;;;; vector_processor.clj is a program that reads in and prints out an vector.
;;;;
;;;; Author:    David Reidsma
;;;; Date:      03/18/2020

(ns vector_processor)

;;; read-vector reads in an vector.
;;; Input: size, an integer that is the target size of the vector
;;; Input: vec, a vector to add {n} values to
;;; Output: a vector containing {n} values
(defn read-vector [size]
  (loop [ num 1
          vec []]
    (if (= (count vec) size)
      vec
      (do
        (printf "Enter value #%d: " num) (flush)
        (recur (inc num) (conj vec (float(read))))))))

;;; print-vec prints out an vec.
;;; Input: vec, a vector to print out
(defn print-vector [vec]
  (if (seq vec)
    (do
      (printf "%f " (get vec 0))
      (recur (subvec vec 1)))))

;;; Main function of a program that reads in an vector from the user and prints it back out
(defn -main []
  (print "Enter an vector size: ") (flush)
  (let
    [ vector-size (read)
      vec (read-vector vector-size)]
    (do
    (print-vector vec)
    (println))))
