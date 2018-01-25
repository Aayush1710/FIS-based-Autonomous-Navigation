function [euclidian_dist,ang_dir] = getDirVector(pos_ini,pos_fin)
    dx = pos_fin(1)-pos_ini(1);
    dy = pos_fin(2)-pos_ini(2);

    euclidian_dist = sqrt(dx^2+dy^2);
    ang_dir = atan2(dy,dx);
end