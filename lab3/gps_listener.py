import lcm
from gps_lcm import gps_t

def gps_handler(channel, data):
    msg = gps_t.decode(data)
    print "Received GPS data on channel" + channel
    print "Time: " + str(msg.utc_time)
    print "Latitude: " + str(msg.lat)
    print "Longitue: " + str(msg.lng)
    print "Altitude: " + str(msg.alt)
    print "UTM x: " + str(msg.utm_x)
    print "UTM y: " + str(msg.utm_y)
    print "UTM Zone: " + str(msg.zone_number)

lc = lcm.LCM()
sub = lc.subscribe("GPS", gps_handler)

try:
    while True:
        lc.handle()
except KeyboardInterrupt:
    pass
