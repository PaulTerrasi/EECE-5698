import lcm
from exlcm import gps_msg

def gps_handler(channel, data):
    msg = gps_msg.decode(data)
    print "Received GPS data on channel" + channel
    print "Time: " + str(msg.time)
    print "Latitude: " + str(msg.latitude)
    print "Longitue: " + str(msg.longitude)
    print "Altitude: " + str(msg.altitude)
    print "UTM x: " + str(msg.utm_x)
    print "UTM y: " + str(msg.utm_y)
    print "UTM Zone: " + str(msg.utm_zone)
    print "UTM Zone Letter: " + msg.utm_zone_letter

lc = lcm.LCM()
sub = lc.subscribe("GPS", gps_handler)

try:
    while True:
        lc.handle()
except KeyboardInterrupt:
    pass
