function output = isCollision(data)
    output = 0;
    dist_th = 2;
    for i=1:3
        if(data(i)<=dist_th)
           output = 1; 
        end
    end
end