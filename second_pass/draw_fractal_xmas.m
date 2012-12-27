% Set up
% clup
% dbstop if error

% Image size in pixels
wid = 600;
hei = 900;

% % Define triangles
triangles = { [75  300 525; 700 400 700],...
              [150 300 450; 400 200 400],...
              [225 300 375; 200 100 200],...
              [225 250 375; 700 800 700],...
              [375 350 250; 700 800 800],...
              [274 300 326; 85  40  85 ],...
              [274 300 326; 55  100 55 ],...
              };

colours = { };

% Create pixel grid
pixels = false(hei, wid);

% Draw fractal triangles
for ii = 1:length(triangles)
    fractal = fractalcircle_fractal(triangles{ii}, wid, hei);
    pixels = pixels | fractal;
end

% Add embelishment

% Draw
image(pixels*256);