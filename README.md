# FIS based Autonomous Navigation
This code is done in MATLAB.
The project consists basically in setting 2 fuzzy systems to reach the target. 
The first one is a MISO system to avoid that the car does not crash with an obstacle. The two inputs of the system are the left and right sensors of the car, and the output increases or decreases the angular velocity. Each discursive universe is normalized to simplify every modification to the control system. 
The other system is a PD fuzzy controller, and it is used to reach the target. As same as the other controller, the output is a part of the final angular velocity and depends on the error between the actual angle position of the robot and the desired angle to reach the target. There are some cases where the lineal velocity does not allow to give the turn in time to avoid the obstacle; therefore, the third sensor (front sensor) is used to decrease the lineal velocity if the robot is coming near to the obstacle. 
The green lines represent the range of vision of the sensors while the red point simulates de center of mass of the vehicle.
