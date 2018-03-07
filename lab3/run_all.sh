#!/bin/bash

export CLASSPATH=my_types.jar
lcm-logger --append -s $1 &
lcm-spy &

python ./gps_lcm_driver.py /dev/ttyUSB0 &
python ./gps_listener.py &
python ./imu_driver.py /dev/ttyUSB1
kill %1 %2 %3 %4
