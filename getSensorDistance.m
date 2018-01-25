function distance = getSensorDistance(xr,yr,xs,ys,xp,yp,scope)
    if(xp ~=Inf)
        xi = xs(1);
        yi = ys(1); 
        xr = sort(xr);
        yr = sort(yr);
        xs = sort(xs);
        ys = sort(ys);
        if(xp >= xr(1) && xp <= xr(2) && yp >= yr(1) && yp <= yr(2) &&...
           xp >= xs(1) && xp <= xs(2) && yp >= ys(1) && yp <= ys(2))
            distance = sqrt((xp-xi)^2+(yp-yi)^2);
        else
            distance = scope;
        end
    else
        distance = scope;
    end
    
end