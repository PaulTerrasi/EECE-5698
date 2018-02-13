#!/usr/bin/env python
import rospy
import socket
import utm

from sensor_msgs.msg import NavSatFix
from nav_msgs.msg import Odometry

pub = rospy.Publisher('/utm_fix', Odometry, queue_size=10) #init pub method

def callback(data): #subscriber callback method
    latdeg = str(data.latitude) #convert to string to parse, then back to float
    latsize = len(latdeg)
    lat_degrees = float(latdeg[0:2])
    lat_hours = float(latdeg[2:latsize])

    print lat_hours

    longdeg = str(data.longitude)
    longsize = len(longdeg)
    long_degrees = float(longdeg[0:2])
    long_hours = float(longdeg[2:longsize])

    print long_hours

    utm_lat = lat_degrees + (lat_hours / 60)
    utm_long = -1 * (long_degrees + (long_hours / 60))

    (utm_xea, utm_yno, utm_zonenum, utm_zonelet) = utm.from_latlon(utm_lat, utm_long)
    utm_output = Odometry()
    utm_output.pose.pose.position.x = utm_xea
    utm_output.pose.pose.position.y = utm_yno
    utm_output.pose.pose.position.z = data.altitude  

    #print for debugging
    print utm_output.pose.pose.position.x
    print utm_output.pose.pose.position.y
    print utm_output.pose.pose.position.z

    if utm_output.pose.pose.position.y != 0:
      pub.publish(utm_output)


def talker():
    rospy.init_node('gpsconv_node', anonymous=True) #init node
    rospy.Subscriber("/rtk_fix", NavSatFix, callback) #init subscriber method    
    rospy.spin()

if __name__ == '__main__':
    talker()
	
