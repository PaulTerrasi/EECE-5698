#!/usr/bin/env python
# license removed for brevity
import rospy
import socket
from sensor_msgs.msg import NavSatFix

def talker():
    pub = rospy.Publisher('/rtk_fix', NavSatFix, queue_size=10)
    rospy.init_node('gps_node', anonymous=True)
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
	gps_final = NavSatFix()
	gps_final.latitude = 4220.1033
	gps_final.longitude = 07214.4219
	gps_final.altitude = 2
	#mygps.NS = mydata[3]
	#mygps.EW = mydata[5]

        #rospy.loginfo(gps_final) #DEBUGGING
        pub.publish(gps_final)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
