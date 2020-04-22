;; listOps.clj is a Clojure "module" for list operations.
;;
;; Begun by: Prof. Adams, CS 214 at Calvin College.
;; Completed by: David Reidsma
;; Date: 04/22/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; maxOf2() finds the maximum of two values.  
;; Receive: val1, val2, two values.  
;; PRE: val1 and val2 can be compared using >.
;; Return: the maximum of val1 and val2. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn maxOf2 [val1 val2]
  (if (> val1 val2)      ; if val1 > val2
    val1                 ;   return val1
    val2                 ; else return val2
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; listMax() finds the maximum value in a list.
;; Receive: aList, a list of values.    
;; PRE: aList is a list 
;;      values in aList can be compared using >.
;; Return: the maximum value in aList.         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn listMax [list]
  (if (list? list)
    (if (empty? list)
      nil
      (if (= (count list) 1)
        (first list)
        (maxOf2 (first list) (listMax (rest list)))))
    nil))

;; using Clojure's built-in max and apply functions
(defn listMax2 [aList]
  (if (list? aList)         ; if aList is a list:
    (if (empty? aList)      ;  if aList is empty:
      nil                   ;    nil
      (apply max aList))))  ;  else apply max to the items in aList

;; searchListRecur is a recursive function for finding the index of a value in a list.
;; Receive: list, a list of values.
;;          value, a value to search for.
;;          index, an integer increased in each repetition
;; Return: the index of the value in the list or -1
(defn searchListRecur [list value index]
  (if (empty? list)
    -1
    (if (= value (first list))
      index
      (recur (rest list) value (inc index)))))

;; searchList is a function for finding the index of a value in a list.
;; Receive: list, a list of values.
;;          value, a value to search for.
;; Return: the index of the value in the list or -1
(defn searchList [list value]
  (searchListRecur list value 0))
