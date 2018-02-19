#!/usr/bin/env python
import roslib
roslib.load_manifest('sum_params')
import rospy
from std_msgs.msg import Int32

def handler(sum):
    print sum

def listener():
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("summing", Int32, handler)

    rospy.spin()

if __name__ == '__main__':
    listener()
