function [ grid ] = fractalcircle_addtriangle( grid, triangle, halfwidth )
%FRACTALCIRCLE_ADDTRIANGLE 

% Loop through three sides
for nn = 1:3
    
    % Vertexes
    vstart = triangle(:,nn);
    vstop = triangle(:,mod(nn,3)+1);
    
    % Add line
    grid = fractalcircle_addline(grid, vstart, vstop, halfwidth);
    
end

end

