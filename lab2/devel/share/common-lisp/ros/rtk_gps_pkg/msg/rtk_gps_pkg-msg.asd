
(cl:in-package :asdf)

(defsystem "rtk_gps_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "NavSatFix" :depends-on ("_package_NavSatFix"))
    (:file "_package_NavSatFix" :depends-on ("_package"))
    (:file "NavSatStatus" :depends-on ("_package_NavSatStatus"))
    (:file "_package_NavSatStatus" :depends-on ("_package"))
  ))