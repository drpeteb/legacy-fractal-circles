function [ grid ] = fractalcircle_addtriangle( grid, triangle, halfwidth )
%FRACTALCIRCLE_ADDTRIANGLE 

[hei, wid] = size(grid);

% Loop through three sides
for nn = 1:3
    
    % Vertexes
    vstart = triangle(:,nn);
    vstop = triangle(:,mod(nn,3)+1);
    vmid = 0.5*(vstop+vstart);
    
    % Unit vectors
    ed = unit(vstop-vstart);
    en = [0 1; -1 0]*ed;
    
    % Length
    len = magn(vstop-vstart);
    
    % Loop through particles
    for ii = 1:hei
        for jj = 1:wid
            
            p = [jj; ii];
            
            % Test whether pixel is close enough to line
            if magn(dot((p-vstart),en))<halfwidth
                
                % Test whether pixel is within limits of line
                if magn(dot(p-vmid,ed))<(len/2)
                    
                    grid(ii,jj) = 1;
                    
                end
            end
            
        end
    end
    
end

end

