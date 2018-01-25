function [m,b,inv] = getRectLineParams(x,y)
    m = (y(2)-y(1))/(x(2)-x(1));
    if(abs(m)==0) % Horizontal line
        inv = 0;
        m = 0;
        b = y(1);
    elseif(abs(m)==Inf) % Vertical line
        inv = 1;
        m = 0;
        b = x(1);
    else % Line with slope
        inv = 0;
        b = y(1)-m*x(1);
    end
end