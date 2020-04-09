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
;;; set-first sets the first name to something else.
;;; Receive: name, a Name.
;;;          first, a String
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn set-first [^Name name first]
  (->Name first (:middle name) (:last name)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-middle sets the middle name to something else.
;;; Receive: name, a Name.
;;;          middle, a String
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn set-middle [^Name name middle]
  (->Name (:first name) middle (:last name)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; set-last sets the last name to something else.
;;; Receive: name, a Name.
;;;          last, a String
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn set-last [^Name name last]
  (->Name (:first name) (:middle name) last))

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
;;; lfmi returns the name in format "(last), (first) (middle initial)"
;;; Receive: name, a Name.
;;; Return: "(last), (first) (middle initial)"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn lfmi [^Name name]
  (str (:last name) ", " (:first name) " " (first (:middle name))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; read-name reads a first, middle, and last name from the console and returns a Name.
;;; Return: a Name populated with user-inputted values.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn read-name []
  (let [first (read)
        middle (read)
        last (read)]
    (make-name first middle last)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver to test our Name functions. 
;;; Output: the result of testing our Name functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [ 
      first1 "John" middle1 "Paul" last1 "Jones" full1 "John Paul Jones"
      first2 "Jane" middle2 "Penelope" last2 "Jones" full2 "Jane Penelope Jones"
      first3 "Jinx" middle3 "Joy" last3 "Jones" full3 "Jinx Joy Jones"
                                               ; 3 ways to construct an object:
      name1 (make-name first1 middle1 last1)  ; -using our "make-" constructor
      name2 (->Name first2 middle2 last2) ; -invoking constructor directly
                                              ; -mapping field-names to values
      name3 (map->Name {:last last3 :first first3 :middle middle3})
    ]
    ;; ----- SECTION 1 -----
    (println)
    (print name1) (println)
    (assert (= (get-first name1) first1) "get-first(1) failed")
    (assert (= (get-middle name1) middle1) "get-middle(1) failed")
    (assert (= (get-last name1) last1) "get-last(1) failed")
    (assert (= (to-string name1) full1) "to-string(1) failed")
    (print-name name1) (println)
    ;; ----- SECTION 2 -----
    (println)
    (print name2) (println)
    (assert (= (get-first name2) first2) "get-first(2) failed")
    (assert (= (get-middle name2) middle2) "get-middle(2) failed")
    (assert (= (get-last name2) last2) "get-last(2) failed")
    (assert (= (to-string name2) full2) "to-string(2) failed")
    (print-name name2) (println)
    ;; ----- SECTION 3 -----
    (println)
    (print name3) (println)
    (assert (= (get-first name3) first3) "get-first(3) failed")
    (assert (= (get-middle name3) middle3) "get-middle(3) failed")
    (assert (= (get-last name3) last3) "get-last(3) failed")
    (assert (= (to-string name3) full3) "to-string(3) failed")
    (print-name name3) (println)
    ;; ----- SECTION 4 -----
    (let [first4 "Finn"
          middle4 "The"
          last4 "Human"
          name1a (set-first name1 first4)
          name1b (set-middle name1 middle4)
          name1c (set-last name1 last4)]
      (assert (= (get-first name1a) first4) "set-first failed")
      (assert (= (get-middle name1b) middle4) "set-middle failed")
      (assert (= (get-last name1c) last4) "set-last failed"))

    (assert (= (lfmi name1) (str last1 ", " first1 " " (first middle1))) "lfmi failed")

    (println "\nAll tests passed!\n")

    (println "Enter a first, middle, and last name, pressing enter after each:")
    (let [name4 (read-name)]
      (print-name name4))
      (println)
  )
)
