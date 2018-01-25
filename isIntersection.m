function output = isIntersection(R,pos_rob,scope,type)

    if(~type)
        Rx_p = [R.Position(1),R.Position(1)+R.Position(3)];
        Ry_p = [R.Position(2),R.Position(2)+R.Position(4)];
        Rx_lines = [Rx_p(1),Rx_p(2);...
                    Rx_p(2),Rx_p(2);...
                    Rx_p(1),Rx_p(2);...
                    Rx_p(1),Rx_p(1)];
        Ry_lines = [Ry_p(1),Ry_p(1);...
                    Ry_p(1),Ry_p(2);...
                    Ry_p(2),Ry_p(2);...
                    Ry_p(1),Ry_p(2)];
    else
        Rx_p = [R.Vertices(1,1),R.Vertices(2,1),R.Vertices(3,1)];
        Ry_p = [R.Vertices(1,2),R.Vertices(2,2),R.Vertices(3,2)];
        Rx_lines = [Rx_p(1),Rx_p(2);...
                    Rx_p(2),Rx_p(3);...
                    Rx_p(1),Rx_p(3)];
        Ry_lines = [Ry_p(1),Ry_p(2);...
                    Ry_p(2),Ry_p(3);...
                    Ry_p(1),Ry_p(3)];
    end        
    
    Senx_lines = [pos_rob(1),pos_rob(1)+scope*cos(pos_rob(3)+pi/2);...
                  pos_rob(1),pos_rob(1)+scope*cos(pos_rob(3));...
                  pos_rob(1),pos_rob(1)+scope*cos(pos_rob(3)-pi/2);...
                  ];
    Seny_lines = [pos_rob(2),pos_rob(2)+scope*sin(pos_rob(3)+pi/2);...
                  pos_rob(2),pos_rob(2)+scope*sin(pos_rob(3));...
                  pos_rob(2),pos_rob(2)+scope*sin(pos_rob(3)-pi/2);...
                  ];
    
    sen_dist = [Inf,Inf,Inf];
    
    n = length(Rx_lines);
    
              
    for i=1:n %for each side od the rectangle
       [mr,br,invR] = getRectLineParams(Rx_lines(i,:),Ry_lines(i,:));
    
       for j=1:3  %for each sensor
           [ms,bs,invS] = getRectLineParams(Senx_lines(j,:),Seny_lines(j,:));         
           [int_x,int_y] = intersectionPoint(mr,br,invR,ms,bs,invS);
           dist_prev = getSensorDistance(Rx_lines(i,:),Ry_lines(i,:),Senx_lines(j,:),Seny_lines(j,:),int_x,int_y,scope);
           if(dist_prev < sen_dist(j))
               sen_dist(j) = dist_prev;
           end
           
       end
    end
    output = sen_dist;
    %disp(sen_dist)
              
end