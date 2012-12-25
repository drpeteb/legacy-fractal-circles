function draw_triangle_circle( ax, vertexes, circ_list, col )
%DRAW_TRIANGLE_CIRCLE Draw a triangle filled with circles

vert = [vertexes vertexes(:,1)];

axis(ax);
plot(vert(1,:), vert(2,:), col, 'linewidth', 2);

% Draw the circles
for ii = 4:length(circ_list)
    
    draw_circle(gca, circ_list{ii}.c, circ_list{ii}.r, col, 100);
    
end

end

