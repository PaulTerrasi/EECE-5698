#!/bin/sh

# try to automatically determine where the LCM java file is
LCM_JAR=`pkg-config --variable=classpath lcm-java`
if [ $? != 0 ] ; then
    if [ -e /usr/local/share/java/lcm.jar ] ; then
        LCM_JAR=/usr/local/share/java/lcm.jar
    else
        if [ -e ../../lcm-java/lcm.jar ] ; then
            LCM_JAR=../../lcm-java/lcm.jar
        fi
    fi
fi

lcm-gen -j lcmtypes/*.lcm
lcm-gen -p lcmtypes/*.lcm

javac -cp $LCM_JAR gps_lcm/*.java
javac -cp $LCM_JAR imu_lcm/*.java

jar cf my_types.jar gps_lcm/*.class imu_lcm/*.class
