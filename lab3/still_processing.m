%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots the IMU data for the still collect and calculates noise
% characteristics
% Run lcm_read.m on flat.log before using
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Bring the starting time to 0
time = imu_time - 1519499147;


% Reported yaw
reported_yaw = deg2rad(imu_yaw);

figure;
plot(time, wrapToPi(reported_yaw));
xlabel("Time (seconds)");
ylabel("Yaw (radians)");
title("Still Collect Reported Yaw");
axis([time(1) time(end) -pi pi]);

reported_yaw_mean = mean(reported_yaw)
reported_yaw_std = std(reported_yaw)


% Reported pitch
reported_pitch = deg2rad(imu_pitch);

figure;
plot(time, wrapToPi(reported_pitch));
xlabel("Time (seconds)");
ylabel("Pitch (radians)");
title("Still Collect Reported Pitch");
axis([time(1) time(end) -pi pi]);

reported_pitch_mean = mean(reported_pitch)
reported_pitch_std = std(reported_pitch)


% Reported roll
reported_roll = deg2rad(imu_roll);

figure;
plot(time, wrapToPi(reported_roll));
xlabel("Time (seconds)");
ylabel("Roll (radians)");
title("Still Collect Reported Roll");
axis([time(1) time(end) -pi pi]);

reported_roll_mean = mean(reported_roll)
reported_roll_std = std(reported_roll)


% Magnetometer X
figure;
plot(time, imu_mag_x);
xlabel("Time (seconds)");
ylabel("mx (Gauss)");
title("Still Collect Magnetometer X");

mag_x_mean = mean(imu_mag_x)
mag_x_std_percent = 100 * std(imu_mag_x) / abs(mag_x_mean)


% Magnetometer Y
figure;
plot(time, imu_mag_y);
xlabel("Time (seconds)");
ylabel("my (Gauss)");
title("Still Collect Magnetometer Y");

mag_y_mean = mean(imu_mag_y)
mag_y_std_percent = 100 * std(imu_mag_y) / abs(mag_y_mean)


% Magnetometer Z
figure;
plot(time, imu_mag_z);
xlabel("Time (seconds)");
ylabel("mz (Gauss)");
title("Still Collect Magnetometer Z");

mag_z_mean = mean(imu_mag_z)
mag_z_std_percent = 100 * std(imu_mag_z) / abs(mag_z_mean)


% Gyro X
figure;
plot(time, imu_gyro_x);
xlabel("Time (seconds)");
ylabel("X Axis Angular Rate (radians/second)");
title("Still Collect Gyro X");
axis([time(1) time(end) -5e-3 5e-3]);

gyro_x_mean = mean(imu_gyro_x)
gyro_x_std = std(imu_gyro_x)


% Gyro Y
figure;
plot(time, imu_gyro_y);
xlabel("Time (seconds)");
ylabel("Y Axis Angular Rate (radians/second)");
title("Still Collect Gyro Y");
axis([time(1) time(end) -5e-3 5e-3]);

gyro_y_mean = mean(imu_gyro_y)
gyro_y_std = std(imu_gyro_y)


% Gyro Z
figure;
plot(time, imu_gyro_z);
xlabel("Time (seconds)");
ylabel("Z Axis Angular Rate (radians/second)");
title("Still Collect Gyro Z");
axis([time(1) time(end) -5e-3 5e-3]);

gyro_z_mean = mean(imu_gyro_z)
gyro_z_std = std(imu_gyro_z)


% Accelerometer X
figure;
plot(time, imu_accel_x);
xlabel("Time (seconds)");
ylabel("X Axis Acceleration (m/s^2)");
title("Still Collect X Accelerometer");
axis([time(1) time(end) -0.1 0.1]);

accel_x_mean = mean(imu_accel_x)
accel_x_std = std(imu_accel_x)


% Accelerometer Y
figure;
plot(time, imu_accel_y);
xlabel("Time (seconds)");
ylabel("Y Axis Acceleration (m/s^2)");
title("Still Collect Y Accelerometer");
axis([time(1) time(end) -0.1 0.1]);

accel_y_mean = mean(imu_accel_y)
accel_y_std = std(imu_accel_y)


% Accelerometer Z
figure;
plot(time, imu_accel_z);
xlabel("Time (seconds)");
ylabel("Z Axis Acceleration (m/s^2)");
title("Still Collect Z Accelerometer");
axis([time(1) time(end) -9.84 -9.64]);

accel_z_mean = mean(imu_accel_z)
accel_z_std = std(imu_accel_z)


