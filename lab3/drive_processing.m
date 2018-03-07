%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Processes the data from a driving collect with initial circles
% for magnetometer calibration
% Run lcm_read.m on moving.log before using
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Bring the starting time to 0
time = imu_time - imu_time(1);


% Times that we were driving in circles and running the actual route
circle_time = 2600:3200;
drive_time = 3200:length(time);


% Convert IMU pitch/roll/yaw to radians
reported_yaw = deg2rad(imu_yaw);
reported_pitch = deg2rad(imu_pitch);
reported_roll = deg2rad(imu_roll);


% Compensate for hard iron effects on magnetometer yaw
comp_mag_x = imu_mag_x - ...
    (max(imu_mag_x(circle_time)) + min(imu_mag_x(circle_time))) / 2;
comp_mag_y = imu_mag_y - ...
    (max(imu_mag_y(circle_time)) + min(imu_mag_y(circle_time))) / 2;


% Compensate for soft iron effects on magnetometer yaw
[major_axis_mag, major_axis_idx] = ...
    max(pythag2(comp_mag_x(circle_time), comp_mag_y(circle_time)));
major_axis_theta = ...
    asin(comp_mag_y(circle_time(major_axis_idx)) / major_axis_mag);

soft_iron_rot_matrix = [cos(major_axis_theta), sin(major_axis_theta);
    -sin(major_axis_theta), cos(major_axis_theta)];
mag_yaw_rot = soft_iron_rot_matrix * [comp_mag_x; comp_mag_y];

soft_iron_scale = ...
    max(mag_yaw_rot(2, circle_time)) / max(mag_yaw_rot(1, circle_time));
mag_yaw_rot(1,:) = mag_yaw_rot(1,:) / soft_iron_scale;

soft_iron_unrot_matrix = [cos(-major_axis_theta), sin(-major_axis_theta);
    -sin(-major_axis_theta), cos(-major_axis_theta)];
mag_yaw_unrot = soft_iron_unrot_matrix * mag_yaw_rot;

comp_mag_x = mag_yaw_unrot(1,:);
comp_mag_y = mag_yaw_unrot(2,:);


% Plot raw vs. compensated magnetometer circles
figure;
plot(imu_mag_x(circle_time), imu_mag_y(circle_time), ...
    comp_mag_x(circle_time), comp_mag_y(circle_time));
xlabel('mx (Gauss)');
ylabel('my (Gauss)');
title('Magnetometer Data for Driving in Circles');
legend('Raw Data', 'Post Hard/Soft Iron Compensation');
axis([-.3, .3, -.3, .3]);


% Calculate the yaw based on the magnetometer
mag_yaw = atan2(-comp_mag_y, comp_mag_x);


% Plot the magnetometer vs. reported yaw measurements for circling
figure;
plot(time(1:drive_time(1)), unwrap(mag_yaw(1:drive_time(1))), ...
     time(1:drive_time(1)), unwrap(reported_yaw(1:drive_time(1))));
xlabel("Time (seconds)");
ylabel("Yaw (radians)");
title("Different Measurements of Yaw while Circling");
legend("Magnetometer", "IMU Reported");


% From this point forward, I will only be working with the driving part of
% the experiment
time = time(drive_time);
reported_yaw = reported_yaw(drive_time);
reported_pitch = reported_pitch(drive_time);
reported_roll = reported_roll(drive_time);
mag_yaw = mag_yaw(drive_time);
gyro_x = imu_gyro_x(drive_time);
gyro_y = imu_gyro_y(drive_time);
gyro_z = imu_gyro_z(drive_time);
accel_x = imu_accel_x(drive_time);
accel_y = imu_accel_y(drive_time);
accel_z = imu_accel_z(drive_time);


% Integrate the yaw rate
gyro_yaw = wrapToPi(cumtrapz(time, gyro_z));


% Use a 1-pole butterworth low pass filter on the yaw rate, then integrate
[butter_b, butter_a] = butter(1, .75, 'low');
buttered_yaw_rate = filter(butter_b, butter_a, gyro_z);
buttered_gyro_yaw = wrapToPi(cumtrapz(time, buttered_yaw_rate));


% It is convenient to permanently unwrap the yaws here
mag_yaw = unwrap(mag_yaw);
gyro_yaw = unwrap(gyro_yaw);
buttered_gyro_yaw = unwrap(buttered_gyro_yaw);
reported_yaw = unwrap(reported_yaw);


% Plot the gyro based yaws against the reported yaw, w/ sychronization
figure;
plot(time, gyro_yaw - gyro_yaw(1) + reported_yaw(1), ...
     time, buttered_gyro_yaw - buttered_gyro_yaw(1) + reported_yaw(1), ...
     time, reported_yaw);
xlabel("Time (seconds)");
ylabel("Yaw (radians)");
title("Gyro Based Yaw Measurements");
legend("W/out Butterworth LPF", "W/ Butterworth LPF", "IMU Reported");

unbuttered_yaw_synced_mean_error = mean( ...
    (gyro_yaw - gyro_yaw(1) + reported_yaw(1)) - reported_yaw)
unbuttered_yaw_synced_std_error = std( ...
    (gyro_yaw - gyro_yaw(1) + reported_yaw(1)) - reported_yaw)
buttered_yaw_synced_mean_error = mean( ...
    (buttered_gyro_yaw - buttered_gyro_yaw(1) + reported_yaw(1)) ...
    - reported_yaw)
buttered_yaw_synced_std_error = std( ...
    (buttered_gyro_yaw - buttered_gyro_yaw(1) + reported_yaw(1)) ...
    - reported_yaw)


% Synchronize the buttered gyro yaw with the magnetometer
buttered_gyro_yaw = buttered_gyro_yaw - buttered_gyro_yaw(1) + mag_yaw(1);


% Complementary filter the gyro and magnetometer yaws
compl_alpha = .5;

compl_yaw = mag_yaw;
for i = 2:length(time)
    compl_yaw(i) = (1-compl_alpha) * ...
        (compl_yaw(i-1) + mag_yaw(i) * (time(i) - time(i-1))) ...
        + compl_alpha * buttered_gyro_yaw(i);
end


% Plot the different yaw measurements against the reported yaw
figure;
plot(time, mag_yaw, ...
     time, buttered_gyro_yaw, ...
     time, compl_yaw, ...
     time, reported_yaw);
xlabel("Time (seconds)");
ylabel("Yaw (radians)");
title("All Yaw Measurements");
legend("Magnetometer Yaw", "Gyro Yaw", "Comp Filtered Yaw", ...
    "IMU Reported Yaw");

mag_yaw_mean_error = mean(mag_yaw - reported_yaw)
mag_yaw_std_error = std(mag_yaw - reported_yaw)
gyro_yaw_mean_error = mean(buttered_gyro_yaw - reported_yaw)
gyro_yaw_std_error = std(buttered_gyro_yaw - reported_yaw)
compl_yaw_mean_error = mean(compl_yaw - reported_yaw)
compl_yaw_std_error = std(compl_yaw - reported_yaw)


% Synchronize the GPS data with the IMU data
gps_x_disp = gps_x(82:end);
gps_y_disp = gps_y(82:end);
time_gps = time(1):(time(1) + length(gps_x_disp) - 1);

gps_x_disp = gps_x_disp - gps_x_disp(1);
gps_y_disp = gps_y_disp - gps_y_disp(1);


% Calculate the speed from the gps
gps_speed = pythag2(gps_x_disp(2:end) - gps_x_disp(1:end-1), ...
    gps_y_disp(2:end) - gps_y_disp(1:end-1)) ...
    ./ diff(time_gps);


% Obtain the x velocity from the accelerometer
accel_x_vel = cumtrapz(time, accel_x);


% We forgot to stop the car after circling, so I am going to set the
% initial velocity for the IMU based on the GPS
accel_x_vel = accel_x_vel + gps_speed(1);


% Plot the predicted y acceleration vs. the observed
figure;
plot(time, buttered_yaw_rate .* accel_x_vel, ...
     time, accel_y);
xlabel("Time (seconds)");
ylabel("Y Acceleration (m/s^2)");
title("Predicted Observed Y Accel from X Accel and Gyro");
legend("Predicted", "Observed");

predicted_y_accel_mean_error = mean(buttered_yaw_rate .* accel_x_vel ...
    - accel_y)
predicted_y_accel_std_error = std(buttered_yaw_rate .* accel_x_vel ...
    - accel_y)


% Adjust x accelerometer for gravity from pitch
accel_x = accel_x + sin(reported_pitch) * -9.7452;


% Recalculate accelerometer velocity
accel_x_vel = cumtrapz(time, accel_x);

accel_x_vel = accel_x_vel + gps_speed(1);


% Integrate the x accelerometer, and use the calculated yaw, to find the
% displacement of the car
world_x_vel = accel_x_vel .* sin(compl_yaw);
world_y_vel = accel_x_vel .* cos(compl_yaw);

x_disp = cumtrapz(time, world_x_vel);
y_disp = cumtrapz(time, world_y_vel);


% Force the acceleration to 0 at points where the car is not moving
zero_force_points = [3242, 3682;
    5682, 7362;
    10882, 14882;
    16562, 18442;
    20002, 20962;
    26082, 26762;
    28162, 29402;
    30642, 31002;
    33762, 34762];
force_accel_x = accel_x;
for z = zero_force_points'
    force_accel_x(z(1):z(2)) = zeros(1, z(2) - z(1) + 1);
end

% Recalculate the imu velocity with forced 0 velocity
force_accel_x_vel = cumtrapz(time, force_accel_x);

force_accel_x_vel = force_accel_x_vel + gps_speed(1);

for z = zero_force_points'
    last_vel = force_accel_x_vel(z(2));
    force_accel_x_vel(z(1):z(2)) = zeros(1, z(2) - z(1) + 1);
    force_accel_x_vel(z(2)+1:end) = force_accel_x_vel(z(2)+1:end) ...
        - last_vel;
end
    

% Calculate the displacement of the car with forcing
force_world_x_vel = force_accel_x_vel .* sin(compl_yaw);
force_world_y_vel = force_accel_x_vel .* cos(compl_yaw);

force_x_disp = cumtrapz(time, force_world_x_vel);
force_y_disp = cumtrapz(time, force_world_y_vel);


% Plot the IMU vs. GPS velocities
figure;
plot(time, accel_x_vel, ...
     time, force_accel_x_vel, ...
     time_gps(2:end), gps_speed);
xlabel("Time (seconds)");
ylabel("Veloctity (m/s^2)");
title("Velocity Measure by Accelerometer vs. GPS");
legend("GPS", "Accelerometer", "Zeroed Accelerometer");

vel_mean_error = mean(accel_x_vel(41:40:end-40) - gps_speed)
vel_std_error = std(accel_x_vel(41:40:end-40) - gps_speed)
force_vel_mean_error = mean(force_accel_x_vel(41:40:end-40) - gps_speed)
force_vel_std_error = std(force_accel_x_vel(41:40:end-40) - gps_speed)


% Plot the imu vs. gps paths
figure;
plot(gps_x_disp, gps_y_disp, ...
     x_disp, y_disp, ...
     force_x_disp, force_y_disp);
xlabel("X Displacement (meters)");
ylabel("Y Displacement (meters)");
title("IMU Measured Path vs. GPS Measured Path");
legend("GPS", "IMU", "Zeroed IMU");

disp_mean_error = mean(pythag2(x_disp(1:40:end-40) - gps_x_disp, ...
    y_disp(1:40:end-40) - gps_y_disp))
disp_std_error = std(pythag2(x_disp(1:40:end-40) - gps_x_disp, ...
    y_disp(1:40:end-40) - gps_y_disp))
force_disp_mean_error = ...
    mean(pythag2(force_x_disp(1:40:end-40) - gps_x_disp, ...
    force_y_disp(1:40:end-40) - gps_y_disp))
force_disp_std_error = ...
    std(pythag2(force_x_disp(1:40:end-40) - gps_x_disp, ...
    force_y_disp(1:40:end-40) - gps_y_disp))


% Estimate x_c
all_x_c = (accel_y(2:end) ... 
    - buttered_yaw_rate(2:end) .* force_accel_x_vel(2:end)) ...
    ./ (buttered_yaw_rate(2:end) .* cumtrapz(buttered_yaw_rate(2:end).^2) ...
     + (diff(buttered_yaw_rate) ./ diff(time)));
 
x_c = mean(all_x_c(abs(all_x_c) < 100))


% Plot the x_c estimates
figure;
plot(time(2:end), all_x_c);
xlabel("Time (seconds)");
ylabel("x_c (meters)");
title("x_c Estimates over Time");


% Calculates the 2-variable pythagorean theorem
function a = pythag2(x, y)
    a = sqrt(x.^2 + y.^2);
end
