;;;; quad_root.clj is a driver for computeRoots.
;;;;
;;;; Author:    David Reidsma
;;;; Date:      03/11/2020

(ns quad_root)

;;; computeRoots computes the roots of a quadratic equation.
;;; Input: a, a float
;;; Input: b, a float
;;; Input: c, a float
;;; Output: A vector storing a boolean (true for success, false otherwise) and two numbers (the roots)
(defn computeRoots [a, b, c]
  (if (not (zero? a))
    (let
      [arg (- (Math/pow b 2) (* 4 a c))]
      (if (>= arg 0)
        (let [root1 (/ (+ (- b) (Math/sqrt arg)) (* 2 a))
              root2 (/ (- (- b) (Math/sqrt arg)) (* 2 a))]
          (vector true root1 root2)
        )
        (do
          (println "b^2 - 4ac is negative!")
          (vector false 0 0)
        )
      )
    )
    (do
      (println "a is zero!")
      (vector false 0 0)
    )
  )
)

;;; Main function of a program that computes quadratic roots
(defn -main []
  (print "Enter a: ") (flush)
  (let [a (read)]
    (print "Enter b: ") (flush)
    (let [b (read)]
      (print "Enter c: ") (flush)
      (let [c (read)
            roots (computeRoots a b c)]
        (if (get roots 0)
          (printf "%f, %f\n" (get roots 1), (get roots 2))
        )
      )
    )
  )
)
