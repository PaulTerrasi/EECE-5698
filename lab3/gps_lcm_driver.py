#!/usr/bin/env python
# -*- coding: utf-8 -*-
# for GPS Sensor

import sys
import lcm
import time
import serial
from gps_lcm import gps_t
import utm


class gps(object):
    def __init__(self, port_name):
        self.port = serial.Serial(port_name, 4800, timeout=1.)  # 4800-N-8-1
        self.lcm = lcm.LCM("udpm://?ttl=12")
        while True:
            line = self.port.readline()
            data = line.split(',')
            try:
                if data[0] == "$GPGGA":
                    msg = gps_t()
                    msg.utc_time = float(data[1])
                    msg.lat = float(data[2][:2]) + float(data[2][2:])/60
                    if data[3] == 'S':
                        msg.lat *= -1
                    msg.lng = float(data[4][:3]) + float(data[4][3:])/60
                    if data[5] == 'W':
                        msg.lng *= -1
                    msg.alt = float(data[6])

                    utm_coord = utm.from_latlon(msg.latitude, msg.longitude)
                    msg.utm_x = utm_coord[0]
                    msg.utm_y = utm_coord[1]
                    msg.zone_number = utm_coord[2]
                    
                    self.lcm.publish("GPS", msg.encode())
            except ValueError:
                print "Bad message received: \"" + line
                
        
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print "Usage: %s <serial_port>\n" % sys.argv[0]
        sys.exit(0)
    myct = gps(sys.argv[1])
