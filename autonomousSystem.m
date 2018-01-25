clear *
close all
clc

pos_ini = [10,10];
pos_fin = [250,200];

%Note: selected_map variable can take 3 values = {0,1,2}. Each one contains
%a different map.

selected_map = 1;

[R,T,h] = generateMap(pos_ini,pos_fin,selected_map);


[euclidian_dist,ang_dir] = getDirVector(pos_ini,pos_fin);
ang_rob = ang_dir;
pos_rob = [pos_ini,ang_rob];
et = 1;
scope = 20;
collisionFlag = 0;
controlSen = readfis('sensorFS.fis');
controlPD = readfis('fuzzyPD.fis');
L = {};
angVel = 0.5;
linVel = 1.0;
while(euclidian_dist>et && ~collisionFlag)
    ts = 0.3;
    
    %state variables
    
    if(~isempty(L))
        for i=1:3
           L{i}.delete; 
        end
    end
    
    velocities = kinematicModel(angVel,linVel,pos_rob(3));
    position = getDisplacement(pos_rob,velocities,ts);
    pos_rob = position;
    %Draw motion and sensor ranges
    
    drawPoint(pos_rob)
    L = getParameters(pos_rob,scope);
    [euclidian_dist,ang_dir] = getDirVector(pos_rob(1:2),pos_fin);
    sens_dist = readSensors(R,T,pos_rob,scope);
    %disp(sens_dist)
    collisionFlag = isCollision(sens_dist);
    errAng = ang_dir - pos_rob(3);
    U1 = evalfis(([sens_dist(1),sens_dist(3),sens_dist(2)]./scope)',controlSen);
    U2 = evalfis([errAng/(pi/2);angVel/0.4],controlPD);
    linVel = 1 - (scope-sens_dist(2))/scope;
    angVel = -U1/pi+U2/4;
    disp([strcat('FIS-Sen: ',num2str(U1),'   FIS-PD: ',num2str(U2), '   Error Angle: ', num2str(errAng/(pi/2)), '   AV: ', num2str(angVel/0.2),'   LV:  ', num2str(linVel) )]);
    
    %euclidian_dist = 0;
    
    pause(0.01)
end