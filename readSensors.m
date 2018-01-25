function output = readSensors(R,T,pos_rob,scope)
    output = [Inf,Inf,Inf];
  
    for i=1:length(R)
        aux = isIntersection(R{i},pos_rob,scope,0);
        for j=1:3
           if(aux(j)<output(j))
              output(j)=aux(j); 
           end
        end
    end
    
    for i=1:length(T)
        aux = isIntersection(T{i},pos_rob,scope,1);
        for j=1:3
           if(aux(j)<output(j))
              output(j)=aux(j); 
           end
        end
    end
end