#!/usr/bin/env python
import roslib
roslib.load_manifest('sum_params')
import rospy
from std_msgs.msg import Int32

def talker():
    pub = rospy.Publisher('summing', Int32, queue_size=10)
    rospy.init_node('talker')
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        a = rospy.get_param('/addends/a')
        b = rospy.get_param('/addends/b')
        pub.publish(a+b)
        rate.sleep()
        
if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
