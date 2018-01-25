function [int_x,int_y] = intersectionPoint(ma,ba,fa,mb,bb,fb)
    if(fa == 0)
       if(fb == 0)
          if((ma-mb)~=0)
            int_x = (bb-ba)/(ma-mb);
            int_y = ma*int_x+ba;
          else
            int_x = Inf;
            int_y = Inf;
          end
       else
          int_x = bb;
          int_y = ma*int_x+ba;
       end     
    else
       if(fb == 0)
          int_x = ba;
          int_y = mb*int_x+bb;
       else
          int_x = Inf;
          int_y = Inf;
       end    
    end
    
end