% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 636.714694263937758 ; 639.794266460974995 ];

%-- Principal point:
cc = [ 394.980831483395718 ; 288.355700673053889 ];

%-- Skew coefficient:
alpha_c = 0.001085773312290;

%-- Distortion coefficients:
kc = [ 0.205480778103204 ; -0.913204637885517 ; -0.002927744721415 ; 0.000526079494763 ; 1.172430236720515 ];

%-- Focal length uncertainty:
fc_error = [ 4.301057480164800 ; 3.972643552285512 ];

%-- Principal point uncertainty:
cc_error = [ 4.846830713535460 ; 4.311853461027734 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.001384081437996;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.061755579504905 ; 0.524950864446450 ; 0.002862181017642 ; 0.003087610791446 ; 1.300297168031783 ];

%-- Image size:
nx = 807;
ny = 605;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 14;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 1;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 1 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 3.061967e+00 ; 4.621715e-02 ; -1.984499e-02 ];
Tc_1  = [ -8.873411e+01 ; 6.719134e+01 ; 2.516218e+02 ];
omc_error_1 = [ 8.593695e-03 ; 1.917108e-03 ; 1.392504e-02 ];
Tc_error_1  = [ 1.938245e+00 ; 1.729934e+00 ; 1.996397e+00 ];

%-- Image #2:
omc_2 = [ 2.958877e+00 ; 4.000989e-01 ; -3.423898e-01 ];
Tc_2  = [ -1.259513e+02 ; 5.656769e+01 ; 3.145444e+02 ];
omc_error_2 = [ 9.009303e-03 ; 2.914843e-03 ; 1.401102e-02 ];
Tc_error_2  = [ 2.399430e+00 ; 2.166305e+00 ; 2.459249e+00 ];

%-- Image #3:
omc_3 = [ 2.827332e+00 ; -4.508635e-03 ; 5.736018e-01 ];
Tc_3  = [ -8.829977e+01 ; 8.058208e+01 ; 2.913393e+02 ];
omc_error_3 = [ 9.166787e-03 ; 3.347794e-03 ; 1.267758e-02 ];
Tc_error_3  = [ 2.302469e+00 ; 2.027203e+00 ; 2.456212e+00 ];

%-- Image #4:
omc_4 = [ NaN ; NaN ; NaN ];
Tc_4  = [ NaN ; NaN ; NaN ];
omc_error_4 = [ NaN ; NaN ; NaN ];
Tc_error_4  = [ NaN ; NaN ; NaN ];

%-- Image #5:
omc_5 = [ 2.978221e+00 ; 2.054070e-01 ; -3.807858e-01 ];
Tc_5  = [ -1.189469e+02 ; 6.293753e+01 ; 3.171393e+02 ];
omc_error_5 = [ 9.055300e-03 ; 2.774616e-03 ; 1.377461e-02 ];
Tc_error_5  = [ 2.413399e+00 ; 2.176178e+00 ; 2.441906e+00 ];

%-- Image #6:
omc_6 = [ -2.857353e+00 ; -5.100167e-02 ; -8.675699e-01 ];
Tc_6  = [ -4.821945e+01 ; 7.324839e+01 ; 2.590223e+02 ];
omc_error_6 = [ 8.267862e-03 ; 4.074175e-03 ; 1.159246e-02 ];
Tc_error_6  = [ 1.986200e+00 ; 1.738348e+00 ; 1.902074e+00 ];

%-- Image #7:
omc_7 = [ -2.212012e+00 ; -5.909681e-01 ; 1.525917e+00 ];
Tc_7  = [ -2.521097e+01 ; -8.415373e-01 ; 4.769501e+02 ];
omc_error_7 = [ 8.492316e-03 ; 5.704536e-03 ; 9.734713e-03 ];
Tc_error_7  = [ 3.656726e+00 ; 3.198463e+00 ; 2.250793e+00 ];

%-- Image #8:
omc_8 = [ -2.644518e+00 ; -1.022240e+00 ; 7.511624e-01 ];
Tc_8  = [ -8.011265e+01 ; -1.094417e+01 ; 4.602463e+02 ];
omc_error_8 = [ 9.166865e-03 ; 4.801196e-03 ; 1.396181e-02 ];
Tc_error_8  = [ 3.506866e+00 ; 3.071941e+00 ; 2.744780e+00 ];

%-- Image #9:
omc_9 = [ 3.034342e+00 ; 3.038384e-01 ; 5.888538e-01 ];
Tc_9  = [ -9.468901e+01 ; 6.924919e+01 ; 2.496062e+02 ];
omc_error_9 = [ 8.545146e-03 ; 2.824185e-03 ; 1.296705e-02 ];
Tc_error_9  = [ 1.974524e+00 ; 1.723239e+00 ; 1.984612e+00 ];

%-- Image #10:
omc_10 = [ -2.600013e+00 ; -9.288163e-01 ; 6.355430e-01 ];
Tc_10  = [ -6.319607e+01 ; -1.312959e+01 ; 4.635997e+02 ];
omc_error_10 = [ 9.343949e-03 ; 4.916191e-03 ; 1.424649e-02 ];
Tc_error_10  = [ 3.533883e+00 ; 3.085049e+00 ; 2.790206e+00 ];

%-- Image #11:
omc_11 = [ -2.853376e+00 ; -6.885289e-01 ; 5.568324e-01 ];
Tc_11  = [ -9.121717e+01 ; 6.671622e+01 ; 4.289180e+02 ];
omc_error_11 = [ 9.394367e-03 ; 3.534564e-03 ; 1.585027e-02 ];
Tc_error_11  = [ 3.255844e+00 ; 2.872059e+00 ; 2.792147e+00 ];

%-- Image #12:
omc_12 = [ -2.666041e+00 ; 4.374789e-02 ; 1.636356e+00 ];
Tc_12  = [ -4.736465e+01 ; 8.223194e+01 ; 4.062914e+02 ];
omc_error_12 = [ 8.017254e-03 ; 6.140002e-03 ; 1.120627e-02 ];
Tc_error_12  = [ 3.106808e+00 ; 2.729225e+00 ; 1.980431e+00 ];

%-- Image #13:
omc_13 = [ -2.751728e+00 ; -4.739412e-01 ; 8.502053e-01 ];
Tc_13  = [ -1.034117e+02 ; 3.232187e+01 ; 3.564211e+02 ];
omc_error_13 = [ 7.892729e-03 ; 3.548107e-03 ; 1.170930e-02 ];
Tc_error_13  = [ 2.710735e+00 ; 2.401601e+00 ; 2.078561e+00 ];

%-- Image #14:
omc_14 = [ -2.472454e+00 ; -6.881446e-01 ; 3.572405e-01 ];
Tc_14  = [ -1.303245e+02 ; 2.296652e+01 ; 3.645170e+02 ];
omc_error_14 = [ 7.464912e-03 ; 4.082750e-03 ; 1.112260e-02 ];
Tc_error_14  = [ 2.775150e+00 ; 2.488158e+00 ; 2.435717e+00 ];

