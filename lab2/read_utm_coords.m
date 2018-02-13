bag = rosbag('/home/paul/Lab2/2018-02-12-16-40-00.bag');
messages = readMessages(bag);

x = [];
y = [];
for i = 1:length(messages)
    m = messages{i}; 
    if m.MessageType == "nav_msgs/Odometry"
        x = [x, m.Pose.Pose.Position.X];
        y = [y, m.Pose.Pose.Position.Y];
    end
end