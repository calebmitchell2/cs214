;;;; nameTester.clj creates and tests a clojure Name type.
;;;;
;;;; Output: results of testing Name functions.
;;;;
;;;; Usage: clojure -m nameTester
;;;;
;;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;;; Completed by:  David Reidsma
;;;; Date:          03/20/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns nameTester)   ; program name

;;; define a Clojure record named Name 
;;; (which compiles to a Java class).

(defrecord Name [first middle last])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; make-name constructs a Name from three strings. 
;;; Receive: first, middle and last, three strings.
;;; Return: the Name (first middle last). 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn make-name [first middle last]
  (->Name first middle last))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; get-first() extracts the first name of a Name object.
;;; Receive: name, a Name.
;;; Return: the firstName string in name.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn get-first [^Name name]
  (:first name))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; get-middle() extracts the middle name of a name object.
;;; Receive: name, a Name. 
;;; Return: the middle string in name.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn get-middle [^Name name]
  (:middle name))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; get-last() extracts the last name of a name object.
;;; Receive: name, a Name. 
;;; Return: the last string in name.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn get-last [^Name name]
  (:last name))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; to-string() returns a full name in F-M-L order. 
;;; Receive: name, a Name. 
;;; Return: first, middle, last,
;;;           separated by spaces. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn to-string [^Name name]
  (str (:first name) " " (:middle name) " " (:last name)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; print-name() displays a name object.
;;; Receive: name, a Name.
;;; Output: the strings in name.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn print-name [^Name name]
  (let [full-name (to-string name)]
    (do
      (print full-name)
      (to-string name))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver to test our Name functions. 
;;; Output: the result of testing our Name functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [                                          ; 3 ways to construct an object:
      name1 (make-name "John" "Paul" "Jones")  ; -using our "make-" constructor
      name2 (->Name "Jane" "Penelope" "Jones") ; -invoking constructor directly
                                              ; -mapping field-names to values
      name3 (map->Name {:last "Jones" :first "Jinx" :middle "Joy"})
    ]
    ;; ----- SECTION 1 -----
    (println)
    (print name1) (println)
    (assert (= (get-first name1) "John") "get-first(1) failed")
    (assert (= (get-middle name1) "Paul") "get-middle(1) failed")
    (assert (= (get-last name1) "Jones") "get-last(1) failed")
    (assert (= (to-string name1) "John Paul Jones") "to-string(1) failed")
    (print-name name1) (println)
    ;; ----- SECTION 2 -----
    (println)
    (print name2) (println)
    (assert (= (get-first name2) "Jane") "get-first(2) failed")
    (assert (= (get-middle name2) "Penelope") "get-middle(2) failed")
    (assert (= (get-last name2) "Jones") "get-last(2) failed")
    (assert (= (to-string name2) "Jane Penelope Jones") "to-string(2) failed")
    (print-name name2) (println)
    ;; ----- SECTION 3 -----
    (println)
    (print name3) (println)
    (assert (= (get-first name3) "Jinx") "get-first(3) failed")
    (assert (= (get-middle name3) "Joy") "get-middle(3) failed")
    (assert (= (get-last name3) "Jones") "get-last(3) failed")
    (assert (= (to-string name3) "Jinx Joy Jones") "to-string(3) failed")
    (print-name name3) (println)

    (println "\nAll tests passed!\n")
  )
)

