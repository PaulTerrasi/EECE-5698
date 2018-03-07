#!/usr/bin/env python
# -*- coding: utf-8 -*-
# for Vectornav IMU

import sys
import lcm
import time
import serial
from imu_lcm import imu_t


class imu(object):
    def __init__(self, port_name):
        self.port = serial.Serial(port_name, 115200, timeout=1.)  # 4800-N-8-1
        self.lcm = lcm.LCM("udpm://?ttl=12")
        while True:
            line = self.port.readline()
            data = line.split(',')
            try:
                if data[0] == "$VNYMR" and len(data) == 13:
                    msg = imu_t()

                    msg.utc_time = time.time()
                    msg.yaw = float(data[1])
                    msg.pitch = float(data[2])
                    msg.roll = float(data[3])
                    msg.mag.x = float(data[4])
                    msg.mag.y = float(data[5])
                    msg.mag.z = float(data[6])
                    msg.accel.x = float(data[7])
                    msg.accel.y = float(data[8])
                    msg.accel.z = float(data[9])
                    msg.gyro.x = float(data[10])
                    msg.gyro.y = float(data[11])
                    msg.gyro.z = float(data[12].split('*')[0])

                    print "yaw: " +  str(msg.yaw)
                    
                    self.lcm.publish("IMU", msg.encode())
            except ValueError:
                print "Bad message received: \"" + line
                
        
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print "Usage: %s <serial_port>\n" % sys.argv[0]
        sys.exit(0)
    myct = imu(sys.argv[1])
