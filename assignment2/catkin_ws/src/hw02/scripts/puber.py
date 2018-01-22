#!/usr/bin/env python

import rospy
from std_msgs.msg import String

def puber():
    pub = rospy.Publisher('top', String, queue_size=10)
    rospy.init_node('puber', anonymous=True)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        hello_str = "hello world %s" % rospy.get_time()
        rospy.loginfo(hello_str)
        pub.publish(hello_str)
        rate.sleep()

if __name__ == '__main__':
    try:
        puber()
    except rospy.ROSInterruptException:
        pass
