;; listTester.clj tests a function to search a list for its maximum value, and then tests a function to search a list for a value.
;;
;; Output: four lists, and 
;;          the results of calling maxList() and searchList() on them.
;;
;; Usage: clojure -m max
;;
;; Begun by: Dr. Adams, CS 214 at Calvin College.
;; Completed by: David Reidsma
;; Date: 04/22/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns listTester)

(load "listOps")                      ; load module

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Function -main tests functions listMax() and searchList().
;; Output: the results of testing listMax() and searchList()  on various lists.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [ 
      list1 '(99 88 77 66 55)        ; max is first value
      list2 (list 55 66 77 88 99)    ; max is last value
      list3 (list 55 77 99 88 66)    ; max is middle value
      list4 (list 11 12 13 14 15)    ; does not contain 99 to test searchList
      emptyList '()                  ; list is empty
    ]

    (println)
    (println "list1: " list1)        ; print list1,
    (println "list2: " list2)        ;   list2,
    (println "list3: " list3)        ;   list3,
    (println "list4: " list4)        ;   list4,
    (println "empty: " emptyList)    ;   list3,
    (println)                        ;   and their maxima
    (println "The max value in list1 is: " (listMax list1))
    (println "The max value in list2 is: " (listMax list2))
    (println "The max value in list3 is: " (listMax list3))
    (println)
    (println "The max of an empty list is: " (listMax emptyList))
    (println)
    (println "Using listMax2...")
    (println "The max value in list1 is: " (listMax2 list1))
    (println "The max value in list2 is: " (listMax2 list2))
    (println "The max value in list3 is: " (listMax2 list3))
    (println)
    (println "The max of an empty list is: " (listMax2 emptyList))
    (println)
    (println "Testing searchList...")
    (println "The index of 99 in list1 is: " (searchList list1 99))
    (println "The index of 99 in list2 is: " (searchList list2 99))
    (println "The index of 99 in list3 is: " (searchList list3 99))
    (println "The index of 99 in list4 is: " (searchList list4 99))
    (println "The index of 99 in an empty list is: " (searchList emptyList 99))
    (println)
  )
)

