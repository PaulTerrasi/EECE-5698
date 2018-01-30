% add the lcm.jar file to the matlabpath - need to only do this once
javaaddpath /usr/local/share/java/lcm.jar
javaaddpath my_types.jar
javaaddpath exlcm/gps_msg.java

log_file = lcm.logging.Log('log/walk-1m', 'r'); 

% now read the file 
% here we are assuming that the channel we are interested in is RDI. Your channel 
% name will be different - something to do with GPS
% also RDI has fields altitude and ranges - GPS will probably have lat, lon, utmx,
% utmy etc

time = [];
lat = [];
long = [];
alt = [];
x = [];
y = [];
zone = [];
letter = [];
while true
 try
   ev = log_file.readNext();
   
   % channel name is in ev.channel
   % there may be multiple channels but in this case you are only interested in RDI channel
   if strcmp(ev.channel, 'GPS')
 
     % build gps object from data in this record
      gps = exlcm.gps_msg(ev.data);

      % collect data into vectors
      time = [time, gps.time];
      lat = [lat, gps.latitude];
      long = [long, gps.longitude];
      alt = [alt, gps.altitude];
      x = [x, gps.utm_x];
      y = [y, gps.utm_y];
      zone = [zone, gps.utm_zone];
      letter = [letter, gps.utm_zone_letter];
      
    end
  catch err   % exception will be thrown when you hit end of file
     break;
  end
end
