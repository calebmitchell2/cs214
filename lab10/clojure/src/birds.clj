;; birds.clj illustrates inheritance and polymorphism in Clojure.
;;
;; Output: the results of testing the Bird functions.
;;
;; Usage: clojure -m birds
;;
;; Begun by: Prof. Adams, for CS 214 Lab 10 at Calvin College.
;; Completed by: David Reidsma
;; Date: 04/25/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns birds
  (:require
      [Bird]
      [Duck]
      [Goose]
      [Owl]
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main tests the classes in the Bird hierarchy.
;;; Output: the results of testing the Bird functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [                              ;; Birds
      bird0 (make-Bird)            ; default Bird constructor
      bird1 (make-Bird "Hawkeye")  ; explicit Bird constructor
                                   ;; Ducks
      bird2 (make-Duck)            ; default Duck constructor
      bird3 (make-Duck  "Donald")  ; explicit Duck constructor
                                   ;; Geese
      bird4 (make-Goose)           ; default Goose constructor
      bird5 (make-Goose "Mother")  ; explicit Goose constructor
                                   ;; Owls
      bird6 (make-Owl)             ; default Owl constructor
      bird7 (make-Owl "Woodsey")   ; explicit Owl constructor
    ]

    (println "\nWelcome to the Bird Park!\n")
    (println (to-string bird0))
    (println (to-string bird1))
    (println)
    (println (to-string bird2))
    (println (to-string bird3))
    (println)
    (println (to-string bird4))
    (println (to-string bird5))
    (println)
    (println (to-string bird6))
    (println (to-string bird7))
    (println)
    (println "Goodbye, and come again!\n")
    (println)
  )
)
 
