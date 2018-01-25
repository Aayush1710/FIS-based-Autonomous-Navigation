function new_pos = getDisplacement(pos,vel,ts)
    x = pos(1) + vel(1)*ts;
    y = pos(2) + vel(2)*ts;
    theta = pos(3) + vel(3)*ts;
    new_pos = [x,y,theta];
end