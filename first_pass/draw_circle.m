function draw_circle( ax, c, r, col, N )
%DRAW_CIRCLE Draw a circle.

axis(ax);

tt = linspace(0, 2*pi, N);
x = c(1) + r*cos(tt);
y = c(2) + r*sin(tt);

plot(x, y, col, 'linewidth', 2);

end

