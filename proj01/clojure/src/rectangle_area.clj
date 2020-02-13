;;;;
;;;; Usage: clojure -m rectangle_area
;;;;
;;;; Author: David Reidsma
;;;; Date: 11/02/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns rectangle_area)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function rectangleArea() computes the area of a rectangle.
;;; Receive: width, a number; must be greater than 0
;;; Receive: length, a number; must be greater than 0
;;; Return: the area of the corresponding rectangle.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn rectangleArea [width, length]
  (* width length)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function main is where execution begins
;;; Input: the width and length of a rectangle.
;;; Output: the area of that rectangle.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (println "\nTo compute the area of a rectangle,")

  (print " enter its width: ") (flush)
  (let
    [ width (read) ]
    (assert (> width 0) "-main: width must be positive")

    (print " enter its length: ") (flush)
    (let
      [ length (read) ]
      (assert (> length 0) "-main: length must be positive")

      (printf "\nThe area is %.15f\n" (float (* width length)))
    )
  )
)
