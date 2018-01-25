function velocities = kinematicModel(w,v,theta)
%This function executes the kinematic model of differentially steered
%wheeled mobile robot
% Inputs:
% w = angular velocity
% v = lineal velocity
% theta = angle
% Outputs:
% vx = linear velocity in x-axis
% vy = linear velocity in y-axis
% vtheta = angular velocity in theta

    vx = v.*cos(theta);
    vy = v.*sin(theta);
    vtheta = w;
    velocities = [vx,vy,vtheta];
    
    %disp([strcat('Velocidad angular: ', num2str(w), '   Angulo: ', num2str(theta)), strcat('   Vx: ',num2str(vx),'   Vy: ',num2str(vy))]);


end