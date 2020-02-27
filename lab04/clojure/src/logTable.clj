;;;; logTable.clj displays a table of logarithms.
;;;;
;;;; Input: start, stop and increment, three numbers.
;;;; Precondition: start < stop && increment > 0.
;;;; Output: A table of logarithms from start to stop,
;;;;          with interval of increment.
;;;;
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: David Reidsma
;;;; Date: 02/27/2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns logTable)                                 ; name the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; displayLogTable() recursively generates the log-table.
;;; Receive: start the first value for the table;
;;;          stop, the last  value for the table;
;;;           step, the step value for the table;
;;; Precondition: start < stop && increment > 0.
;;; Output: The table of logs from start to stop, by step.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; direct-recursive version

(defn displayLogTable [start, stop, step]
  (printf "The logarithm of %f is %f\n" start (Math/log10 start))
  (if (< start stop)
    (displayLogTable (+ start step) stop step)
  )
)

;;;(defn displayLogTable2 [start, stop, step]
;;;  (printf "The logarithm of %f is %f\n" 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; -main is a 'driver' for the displayLogTable() functions.
;;; Input: start, stop and increment.
;;; Output: The table of logarithms 
;;;          from start to stop by increment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn -main []
 (println "To display a table of logarithms,")
 (println "enter the start, stop, and increment values: ") (flush)
 (let
    [ start (double (read))
      stop (double (read))
      increment (double (read))
    ] 
    (displayLogTable start stop increment) 
 ;   (displayLogTable2 start stop increment) 
 ;   (println)
 ;   (displayLogTable3 start stop increment) 
 ;   (println)
 )
)

