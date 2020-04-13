(ns extra-cred)

(defn my-reverse
  ([vector] (my-reverse vector []))
  ([vector reversed-vector]
    (if (empty? vector)
      reversed-vector
      (let [item (last vector)]
        (my-reverse (drop-last vector) (conj reversed-vector item))))))

(defn -main []
  (println "[1 2 3 4 5]:\t" (my-reverse [1 2 3 4 5]))
  (println "[]:\t\t" (my-reverse [])))
