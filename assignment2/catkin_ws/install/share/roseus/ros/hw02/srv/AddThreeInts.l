;; Auto-generated. Do not edit!


(when (boundp 'hw02::AddThreeInts)
  (if (not (find-package "HW02"))
    (make-package "HW02"))
  (shadow 'AddThreeInts (find-package "HW02")))
(unless (find-package "HW02::ADDTHREEINTS")
  (make-package "HW02::ADDTHREEINTS"))
(unless (find-package "HW02::ADDTHREEINTSREQUEST")
  (make-package "HW02::ADDTHREEINTSREQUEST"))
(unless (find-package "HW02::ADDTHREEINTSRESPONSE")
  (make-package "HW02::ADDTHREEINTSRESPONSE"))

(in-package "ROS")





(defclass hw02::AddThreeIntsRequest
  :super ros::object
  :slots (_x _y _z ))

(defmethod hw02::AddThreeIntsRequest
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    ((:z __z) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _z (round __z))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; int64 _x
    8
    ;; int64 _y
    8
    ;; int64 _z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x) (= (length (_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x . bv) 0) 0) s)
              (write-long (ash (elt (_x . bv) 1) -1) s))
             ((and (class _x) (= (length (_x . bv)) 1)) ;; big1
              (write-long (elt (_x . bv) 0) s)
              (write-long (if (>= _x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x s)(write-long (if (>= _x 0) 0 #xffffffff) s)))
     ;; int64 _y
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _y (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _y) (= (length (_y . bv)) 2)) ;; bignum
              (write-long (ash (elt (_y . bv) 0) 0) s)
              (write-long (ash (elt (_y . bv) 1) -1) s))
             ((and (class _y) (= (length (_y . bv)) 1)) ;; big1
              (write-long (elt (_y . bv) 0) s)
              (write-long (if (>= _y 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _y s)(write-long (if (>= _y 0) 0 #xffffffff) s)))
     ;; int64 _z
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _z (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _z) (= (length (_z . bv)) 2)) ;; bignum
              (write-long (ash (elt (_z . bv) 0) 0) s)
              (write-long (ash (elt (_z . bv) 1) -1) s))
             ((and (class _z) (= (length (_z . bv)) 1)) ;; big1
              (write-long (elt (_z . bv) 0) s)
              (write-long (if (>= _z 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _z s)(write-long (if (>= _z 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _x
#+(or :alpha :irix6 :x86_64)
      (setf _x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _y
#+(or :alpha :irix6 :x86_64)
      (setf _y (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _y (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _z
#+(or :alpha :irix6 :x86_64)
      (setf _z (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _z (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass hw02::AddThreeIntsResponse
  :super ros::object
  :slots (_sum ))

(defmethod hw02::AddThreeIntsResponse
  (:init
   (&key
    ((:sum __sum) 0)
    )
   (send-super :init)
   (setq _sum (round __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; int64 _sum
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _sum
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _sum (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _sum) (= (length (_sum . bv)) 2)) ;; bignum
              (write-long (ash (elt (_sum . bv) 0) 0) s)
              (write-long (ash (elt (_sum . bv) 1) -1) s))
             ((and (class _sum) (= (length (_sum . bv)) 1)) ;; big1
              (write-long (elt (_sum . bv) 0) s)
              (write-long (if (>= _sum 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _sum s)(write-long (if (>= _sum 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _sum
#+(or :alpha :irix6 :x86_64)
      (setf _sum (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _sum (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass hw02::AddThreeInts
  :super ros::object
  :slots ())

(setf (get hw02::AddThreeInts :md5sum-) "53028d7f0cdbf27905a5df65392f9c8b")
(setf (get hw02::AddThreeInts :datatype-) "hw02/AddThreeInts")
(setf (get hw02::AddThreeInts :request) hw02::AddThreeIntsRequest)
(setf (get hw02::AddThreeInts :response) hw02::AddThreeIntsResponse)

(defmethod hw02::AddThreeIntsRequest
  (:response () (instance hw02::AddThreeIntsResponse :init)))

(setf (get hw02::AddThreeIntsRequest :md5sum-) "53028d7f0cdbf27905a5df65392f9c8b")
(setf (get hw02::AddThreeIntsRequest :datatype-) "hw02/AddThreeIntsRequest")
(setf (get hw02::AddThreeIntsRequest :definition-)
      "int64 x
int64 y
int64 z
---
int64 sum
")

(setf (get hw02::AddThreeIntsResponse :md5sum-) "53028d7f0cdbf27905a5df65392f9c8b")
(setf (get hw02::AddThreeIntsResponse :datatype-) "hw02/AddThreeIntsResponse")
(setf (get hw02::AddThreeIntsResponse :definition-)
      "int64 x
int64 y
int64 z
---
int64 sum
")



(provide :hw02/AddThreeInts "53028d7f0cdbf27905a5df65392f9c8b")


