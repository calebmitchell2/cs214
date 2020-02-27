kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj03\[davidreidsma@davidr-fedora proj03]$ cat clojure/src/case_statement.clj
;;;; case_statement.clj is a driver for letterGrade.
;;;;
;;;; Author:    David Reidsma
;;;; Date:      02/25/2020

(ns case_statement)

;;; letterGrade converts a numerical grade into its letter code.
;;; Input: average, a numerical grade in range 0-100.
;;; Output: A letter grade.
(defn letterGrade [average]
  (let [grade (int (/ average 10))]
    (cond
      (or (= grade 10) (= grade 9)) "A"
      (= grade 8) "B"
      (= grade 7) "C"
      (= grade 6) "D"
      :else "F"
    )
  )
)

;;; Main function of a program that allows the user to enter a numerical grade from 0-100 and then prints out the equivalent letter grade.
(defn -main []
  (print "Enter your grade: ") (flush)
  (let [average (read)]
    (println (letterGrade average))
  )
)

kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj03\[davidreidsma@davidr-fedora proj03]$ cd clojure
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj03/clojure\[davidreidsma@davidr-fedora clojure]$ clojure -m case_statement
Enter your grade: 95
A
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj03/clojure\[davidreidsma@davidr-fedora clojure]$ clojure -m case_statement
Enter your grade: 54
F
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj03/clojure\[davidreidsma@davidr-fedora clojure]$ clojure -m case_statement
Enter your grade: 76
C
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj03/clojure\[davidreidsma@davidr-fedora clojure]$ exit

