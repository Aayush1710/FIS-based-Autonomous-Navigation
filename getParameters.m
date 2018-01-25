function L = getParameters(posRob,scope)

    L = {};
    %sensors = [Inf,Inf,Inf];
    ang = posRob(3);
    
    viewVectors = [posRob(1)+scope*cos(ang+pi/2),posRob(2)+scope*sin(ang+pi/2);...
                   posRob(1)+scope*cos(ang),posRob(2)+scope*sin(ang);...
                   posRob(1)+scope*cos(ang-pi/2),posRob(2)+scope*sin(ang-pi/2)];
    
    
    for i=1:3
       X = [posRob(1),viewVectors(i,1)];
       Y = [posRob(2),viewVectors(i,2)];
       L{i} = line(X,Y,'Color','green');
    end
    

end