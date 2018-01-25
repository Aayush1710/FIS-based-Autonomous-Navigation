function [R,T,h] = generateMap(pi,pf,select)
    
    xdim = 275;
    ydim = 225;
    
    h = figure;
    hold on
    axis([0 xdim 0 ydim]);
    set(gca,'Color','white');
    c = 100/255;
    set(gcf,'color',[c,c,c]);
    grid on
    
    switch select
        case 0
            pos = [10,25;25,55;50,15;80,40;90,110;102,107;110,80;140,135;145,95;175,110;180,150;200,170;215,125;227,135];
            sz = [20,25;33,20;20,15;20,28;10,25;25,10;25,12;25,15;25,20;23,15;25,10;23,12;27,10;25,10];
            Tx = {};
            Ty = {};
        case 1
            pos = [25,10; 78,10; 131,10; 28,70; 50,150;135,100;70,60;175,132];
            sz = [50,30; 50,30; 50,25;20,100;100,20;80,30;60,65;30,50];
            Tx = {};
            Ty = {};
        case 2
            pos = [25,45; 80,30; 175,160];
            sz = [40,40; 50,50; 50,50];
            Tx = {[90,100,140],[100,140,155],[20,65,75]};
            Ty = {[80,140,85],[160,210,140],[95,95,145]};
        otherwise
            pos = [];
            sz = [];
            Tx = {};
            Ty = {};
    end;
    
    n = size(pos);
    m = length(Tx);
    R = {};
    T = {};
    
    for i=1:m
        T{i} = fill(Tx{i},Ty{i},'b');
    end
    
    for i=1:n
        R{i} = rectangle('Position', [pos(i,1),pos(i,2),sz(i,1),sz(i,2)],'FaceColor','yellow');
    end
    
    plot(pi(1),pi(2),'o');
    plot(pf(1),pf(2),'o');
    
end