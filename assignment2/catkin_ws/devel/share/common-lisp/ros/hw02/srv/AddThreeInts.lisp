; Auto-generated. Do not edit!


(cl:in-package hw02-srv)


;//! \htmlinclude AddThreeInts-request.msg.html

(cl:defclass <AddThreeInts-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (z
    :reader z
    :initarg :z
    :type cl:integer
    :initform 0))
)

(cl:defclass AddThreeInts-request (<AddThreeInts-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddThreeInts-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddThreeInts-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hw02-srv:<AddThreeInts-request> is deprecated: use hw02-srv:AddThreeInts-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <AddThreeInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw02-srv:x-val is deprecated.  Use hw02-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <AddThreeInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw02-srv:y-val is deprecated.  Use hw02-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <AddThreeInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw02-srv:z-val is deprecated.  Use hw02-srv:z instead.")
  (z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddThreeInts-request>) ostream)
  "Serializes a message object of type '<AddThreeInts-request>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddThreeInts-request>) istream)
  "Deserializes a message object of type '<AddThreeInts-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'z) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddThreeInts-request>)))
  "Returns string type for a service object of type '<AddThreeInts-request>"
  "hw02/AddThreeIntsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddThreeInts-request)))
  "Returns string type for a service object of type 'AddThreeInts-request"
  "hw02/AddThreeIntsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddThreeInts-request>)))
  "Returns md5sum for a message object of type '<AddThreeInts-request>"
  "53028d7f0cdbf27905a5df65392f9c8b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddThreeInts-request)))
  "Returns md5sum for a message object of type 'AddThreeInts-request"
  "53028d7f0cdbf27905a5df65392f9c8b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddThreeInts-request>)))
  "Returns full string definition for message of type '<AddThreeInts-request>"
  (cl:format cl:nil "int64 x~%int64 y~%int64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddThreeInts-request)))
  "Returns full string definition for message of type 'AddThreeInts-request"
  (cl:format cl:nil "int64 x~%int64 y~%int64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddThreeInts-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddThreeInts-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddThreeInts-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
))
;//! \htmlinclude AddThreeInts-response.msg.html

(cl:defclass <AddThreeInts-response> (roslisp-msg-protocol:ros-message)
  ((sum
    :reader sum
    :initarg :sum
    :type cl:integer
    :initform 0))
)

(cl:defclass AddThreeInts-response (<AddThreeInts-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddThreeInts-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddThreeInts-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hw02-srv:<AddThreeInts-response> is deprecated: use hw02-srv:AddThreeInts-response instead.")))

(cl:ensure-generic-function 'sum-val :lambda-list '(m))
(cl:defmethod sum-val ((m <AddThreeInts-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw02-srv:sum-val is deprecated.  Use hw02-srv:sum instead.")
  (sum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddThreeInts-response>) ostream)
  "Serializes a message object of type '<AddThreeInts-response>"
  (cl:let* ((signed (cl:slot-value msg 'sum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddThreeInts-response>) istream)
  "Deserializes a message object of type '<AddThreeInts-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sum) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddThreeInts-response>)))
  "Returns string type for a service object of type '<AddThreeInts-response>"
  "hw02/AddThreeIntsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddThreeInts-response)))
  "Returns string type for a service object of type 'AddThreeInts-response"
  "hw02/AddThreeIntsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddThreeInts-response>)))
  "Returns md5sum for a message object of type '<AddThreeInts-response>"
  "53028d7f0cdbf27905a5df65392f9c8b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddThreeInts-response)))
  "Returns md5sum for a message object of type 'AddThreeInts-response"
  "53028d7f0cdbf27905a5df65392f9c8b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddThreeInts-response>)))
  "Returns full string definition for message of type '<AddThreeInts-response>"
  (cl:format cl:nil "int64 sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddThreeInts-response)))
  "Returns full string definition for message of type 'AddThreeInts-response"
  (cl:format cl:nil "int64 sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddThreeInts-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddThreeInts-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddThreeInts-response
    (cl:cons ':sum (sum msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddThreeInts)))
  'AddThreeInts-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddThreeInts)))
  'AddThreeInts-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddThreeInts)))
  "Returns string type for a service object of type '<AddThreeInts>"
  "hw02/AddThreeInts")