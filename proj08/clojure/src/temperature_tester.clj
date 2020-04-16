;; Driver for the Temperature record.
;; Author: David Reidsma
;; Date: 04/16/2020

(ns temperature_tester)

(load-file "src/temperature.clj")

;; Read a temperature in from the user and print a message. Keep trying until we get valid input.
;; Input: message, a string.
;; Returns: a Temperature.
(defn read-temperature-with-message [message]
  (do
    (println message)
    (let [[temp error] (read-temperature)]
      (if error
        (read-temperature-with-message "Invalid input, try again: ")
        temp))))

;; Read a number in from the user and print a message. Keep trying until we get valid input.
;; Input: message, a string.
;; Returns: a float.
(defn read-num-with-message [message]
  (do
    (println message)
    (let [line (read-line)]
      (if (is-str-numeric? line)
        (Float/parseFloat line)
        (read-num-with-message "Invalid input, try again: ")))))

;; Print a table of temperatures.
;; Input:
;;   current: The Temperature to start at.
;;   stop: The Temperature to stop at.
;;   step: The amount of degrees to add/subtract each iteration.
;;   step-fun: A function ([Temperature float] -> Temperature) that will either raise or lower a Temperature by a given amount.
;;   start-was-lower: True if the original start value was lower than the stop, false if not.
(defn print-table [current stop step step-fun start-was-lower]
  (let [fahr (format "%-20s" (to-string (to-fahrenheit current)))
        cels (format "%-20s" (to-string (to-celsius current)))
        kelv (format "%-20s" (to-string (to-kelvin current)))]
    (if (or (= start-was-lower (less-than? current stop)) (equals? current stop))
      (do
        (println (str fahr cels kelv))
        (print-table (step-fun current step) stop step step-fun start-was-lower))
      ())))

;; Main function.
(defn -main []
  (do
    (println """Temperature examples:
    20.5 C
    10 K
    35.1 F""")
    (let [start (read-temperature-with-message "Enter a start temperature: ")
          stop (read-temperature-with-message "Enter a stop temperature: ")
          step (read-num-with-message "Enter a step amount of degrees (in the same scale as your start temperature):")]
      (if (equals? start stop)
        (println "Start and stop temperatures are already equal.")
        (let [start-was-lower (less-than? start stop)]
          (if start-was-lower
            (print-table start stop step raise start-was-lower)
            (print-table start stop step lower start-was-lower)))))))
