;;;; Bird.clj provides a Bird "class".
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: David Reidsma
;;;; Date: 04/25/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Define a Bird 'class' with one attribute, the Bird's name.
(defrecord Bird [name])

;;; Bird constructors
;;; - default: no args
;;;   Postcondition: name == a default value.
;;; - explicit:
;;;   Receive: itsName, a String.
;;;   Postcondition: name == itsName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn make-Bird
  ([] (->Bird "Ann Onymous"))
  ([itsName] (->Bird itsName)))


;;; accessor method for name attribute
;;; Receive: this, a Bird object.
;;; Return: this's name.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn get-name [^Bird bird]
  (:name bird))

;; define get-class, get-call, and to-string as polymorphic methods
;; Note: these must be defined using defmethod instead of defn.
(defmulti get-class class)
(defmulti get-call class)
(defmulti to-string class)

;;; method to retrieve a Bird's class
;;; Receive: this, a Bird object.
;;; Return: "Bird".
;;; Note: 'subclasses' of Bird must define this method.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod get-class Bird [_]
  "Bird")

;;; method to retrieve a Bird's call
;;; Receive: this, a Bird object.
;;; Return: a default bird-call.
;;; Note: 'subclasses' of Bird must define this method.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod get-call :default [_]
  "Squaaaawk!")

;;; method to combine a Bird, its class and its call into a String.
;;; Receive: this, a Bird object.
;;; Return: a String representing this, its class, and its call.
;;; Note: get-class and get-call are polymorphic methods.
;;; Note also: the use of :default for its class means that
;;;        'subclasses' may but are not required to define it.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod to-string :default [bird]
  (str (get-name bird) " " (get-class bird) " says, \"" (get-call bird) "\""))
