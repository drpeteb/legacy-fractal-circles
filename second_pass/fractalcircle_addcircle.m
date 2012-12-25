function [ grid ] = fractalcircle_addcircle( grid, c, r, halfwidth )
%FRACTALCIRCLE_ADDCIRCLE Add a circle to the grid

[hei, wid] = size(grid);

x = repmat((1:wid), hei, 1);
y = repmat((1:hei)', 1, wid);
d = sqrt((x-c(1)).^2+(y-c(2)).^2);

grid(d<(r-halfwidth)) = 0;
grid( (d<(r+halfwidth))&(d>(r-halfwidth)) ) = 1;

end

