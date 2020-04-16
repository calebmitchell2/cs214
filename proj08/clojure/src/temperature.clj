(require '[clojure.string :as str])

;; Temperature stores a float (the value) and a character (the scale) and represents a temperature.
;; Author: David Reidsma
;; Date: 04/16/2020
(defrecord Temperature [value scale])

(def ^:const celsius \C)
(def ^:const fahrenheit \F)
(def ^:const kelvin \K)
(def ^:const absolute-zero -273.15)

;; Change a character to uppercase.
;; Input: chr: A character.
;; Returns: the character in uppercase.
(defn char-to-upper [chr]
  (nth (char-array (clojure.string/upper-case chr)) 0))

;; Check if a scale character is in C,c,F,f,K,k
;; Input: scale: A character.
;; Returns: true if valid, false otherwise.
(defn is-scale-valid? [scale]
  (let [upper (char-to-upper scale)]
    (or (= upper celsius) (= upper kelvin) (= upper fahrenheit))))

;; Create a temperature with a specific value and scale.
;; Input:
;;   value: A float, the value of the temperature.
;;   scale: A character literal, the scale of the temperature. Must be one of: C,c,F,f,K,k
;; Returns: a Temperature.
(defn create-temperature [value scale]
  (if (is-scale-valid? scale)
    (->Temperature value (char-to-upper scale))
    (println "Invalid scale provided to create-temperature.")))

;; Get the value of a temperature.
;; Precondition: the temperature is initialized.
;; Input: temp: A Temperature.
;; Returns: a float, the value of the temperature.
(defn get-value [^Temperature temp]
  (:value temp))

;; Get the scale of a temperature.
;; Precondition: the temperature is initialized.
;; Input: temp: A Temperature.
;; Returns: a character, the scale of the temperature.
(defn get-scale [^Temperature temp]
  (:scale temp))

;; Convert a temperature to celsius.
;; Precondition: the temperature is initialized.
;; Input: temp: A Temperature.
;; Returns: a new Temperature.
(defn to-celsius [^Temperature temp]
  (if (= kelvin (get-scale temp))
    (create-temperature (+ absolute-zero (get-value temp)) celsius)
    (if (= fahrenheit (get-scale temp))
      (create-temperature (* (/ 5.0 9.0) (- (get-value temp) 32)) celsius)
      temp)))

;; Convert a temperature to fahrenheit.
;; Precondition: the temperature is initialized.
;; Input: temp: A Temperature.
;; Returns: a new Temperature.
(defn to-fahrenheit [^Temperature temp]
  (if (= kelvin (get-scale temp))
    (create-temperature (+ 32 (* (/ 9.0 5.0) (+ absolute-zero (get-value temp)))) fahrenheit)
    (if (= celsius (get-scale temp))
      (create-temperature (+ 32 (* (/ 9.0 5.0) (get-value temp))) fahrenheit)
      temp)))

;; Convert a temperature to kelvin.
;; Precondition: the temperature is initialized.
;; Input: temp: A Temperature.
;; Returns: a new Temperature.
(defn to-kelvin [^Temperature temp]
  (if (= celsius (get-scale temp))
    (create-temperature (- (get-value temp) absolute-zero) kelvin)
    (if (= fahrenheit (get-scale temp))
      (create-temperature (- (* (/ 5.0 9.0) (- (get-value temp) 32)) absolute-zero) kelvin)
      temp)))

;; Check if a string is numeric.
;; Input: str: A string.
;; Returns: true if the string can be parsed as a float, false if not.
(defn is-str-numeric? [str]
  (try
     (do
       (Float/parseFloat str)
       true)
     (catch NumberFormatException e false)))

;; Read a temperature in from the user.
;; Returns: a new Temperature (or nil) and a boolean indicating whether an error occurred.
(defn read-temperature []
  (let [line (read-line)
        parts (str/split line #" ")]
    (if (= 2 (count parts))
      (let [value-str (nth parts 0)
            scale-str (nth parts 1)
            scale-ch (nth (char-array scale-str) 0)]
        (if (= (count scale-str) 1)
          (if (is-scale-valid? scale-ch)
            (if (is-str-numeric? value-str)
              [(create-temperature (Float/parseFloat value-str) scale-ch) false]
              [nil true])
            [nil true])
          [nil true]))
      [nil true])))

;; Get a string representation of a temperature.
;; Precondition: the temperature is initialized.
;; Input: temp: A Temperature.
;; Returns: a String that looks like "{value} {s}" where {s} is in C,K,F
(defn to-string [^Temperature temp]
  (str (format "%.3f" (get-value temp)) " " (get-scale temp)))

;; Get a raised Temperature.
;; Precondition: the temperature is initialized.
;; Input:
;;   temp: A Temperature.
;;   amount: The amount of degrees to raise the temperature by.
;; Returns: a new Temperature.
(defn raise [temp amount]
  (create-temperature (+ amount (get-value temp)) (get-scale temp)))

;; Get a lowered Temperature.
;; Precondition: the temperature is initialized.
;; Input:
;;   temp: A Temperature.
;;   amount: The amount of degrees to raise the temperature by.
;; Returns: a new Temperature.
(defn lower [temp amount]
  (create-temperature (- (get-value temp) amount) (get-scale temp)))

;; Convert a temperature to another scale.
;; Precondition: the temperature is initialized.
;; Input:
;;   temp: A Temperature.
;;   scale: A character, must be in C,c,F,f,K,k
;; Returns: a new Temperature in the specified scale.
(defn convert-temp [temp scale]
  (if (= scale (get-scale temp))
    temp
    (if (= scale celsius)
      (to-celsius temp)
      (if (= scale kelvin)
        (to-kelvin temp)
        (if (= scale fahrenheit)
          (to-fahrenheit temp)
          ())))))

;; Check if two temperatures are equal.
;; Precondition: both temperatures are initialized.
;; Input:
;;   temp1: A Temperature.
;;   temp2: Another Temperature.
;; Returns: true if equal, false otherwise.
(defn equals? [temp1 temp2]
 (= (get-value temp1) (get-value (convert-temp temp2 (get-scale temp1)))))

;; Check if a temperature is less than another.
;; Precondition: both temperatures are initialized.
;; Input:
;;   temp1: A Temperature.
;;   temp2: Another temperature.
;; Returns: true if the first is less than the second, false otherwise.
(defn less-than? [temp1 temp2]
 (< (get-value temp1) (get-value (convert-temp temp2 (get-scale temp1)))))
