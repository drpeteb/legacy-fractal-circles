clup
dbstop if error

% Settings
radius_threshold = 0.002;
max_circles = 10000;

% Triangle list
xmin = 0; xmax = 6;
ymin = -1; ymax = 8;
xrange = xmax - xmin;
yrange = ymax - ymin;

triangles = { [1.5 3 4.5; 1 4 1], ...
              [2 3 4; 4 6 4], ...
              [2.5 3 3.5; 6 7 6], ...
              [2.5 2.5 3.5; 1 0 0], ...
              [3.5 3.5 2.5; 1 0 1], ...
              };

colours = { 'g', ...
            'g', ...
            'g', ...
            'r', ...
            'r', ...
            };

% Create figure
fig = figure; hold on,
        
for ii = 1:length(triangles);
    circ_list = triangle_circle_packing( triangles{ii}, radius_threshold, max_circles );
    draw_triangle_circle(gca, triangles{ii}, circ_list, colours{ii});
end

xlim([xmin xmax]);
ylim([ymin ymax]);
set(fig, 'units', 'inches');
set(fig, 'position', [2 2 xrange, yrange]);