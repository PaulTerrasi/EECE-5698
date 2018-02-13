#!/usr/bin/env python
# license removed for brevity
import rospy
import socket
from sensor_msgs.msg import NavSatFix

def talker():
    pub = rospy.Publisher('/rtk_fix', NavSatFix, queue_size=10)
    rospy.init_node('gps_node', anonymous=True)
    rate = rospy.Rate(5)
    s = socket.socket()          # Create a socket object 
    host = rospy.get_param('~host', '192.168.43.19')
    port = rospy.get_param('~port', 3000)
    s.connect((host, port)) 
    while not rospy.is_shutdown():
	GPS = s.recv(1024)
	gps_final = NavSatFix()
	GPS_temp = GPS.split('\n')
	for i in range(0, len(GPS_temp) - 1):
		GPS_GPGGA = GPS_temp[i].split(',')
		if GPS_GPGGA[0] == '$GPGGA':
		    gps_final.latitude = float(GPS_GPGGA[2])
		    gps_final.longitude = float(GPS_GPGGA[4])
		    gps_final.altitude = float(GPS_GPGGA[9])
		    pub.publish(gps_final)
        
        #ros.spin()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
