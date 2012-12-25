% Set up
clup
dbstop if warning

% Image size in pixels
wid = 1000;
hei = 600;

% Define triangles
triangles = { [10 490 250; 10 10 290] };

% Create pixel grid
pixels = false(hei, wid);

% Draw fractal triangles
for ii = 1:length(triangles)
    fractal = fractalcircle_fractal(triangles{ii}, wid, hei);
%     pixels = pixels | fractal;
end

% pixels(isnan(pixels))=0;
fractal(isnan(fractal))=0;

% Add embelishment

% Draw
% image(pixels);
image(fractal*256);