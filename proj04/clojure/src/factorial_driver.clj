;;;; factorial_driver.clj is a driver for getFactorial.
;;;;
;;;; Author:    David Reidsma
;;;; Date:      03/02/2020

(ns factorial_driver)

;;; getFactorialRecursive is the recursive part of getFactorial.
;;; n: an integer to get the factorial of
;;; counter: an integer that is the counter variable
;;; answer: the answer that is multiplied by counter every iteration
(defn getFactorialRecursive [n, counter, answer]
  (if (<= counter n)
    (getFactorialRecursive n (+ counter 1) (* answer counter))
    answer
  )
)

;;; getFactorial computes n!.
;;; n: an integer
;;; returns: The factorial of n
(defn getFactorial [n]
  (getFactorialRecursive n 2 1.0)
)


;;; Main function of a program that computes factorials
(defn -main []
  (print "To compute n!, enter n: ") (flush)
  (let [n (read)]
    (printf "!%d = " n)
    (printf "%f\n" (getFactorial n))
  )
)
