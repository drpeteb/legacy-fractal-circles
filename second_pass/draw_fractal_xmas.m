% Set up
% clup
% dbstop if error

% Settings
radius_threshold = 0.5;
max_circles = 10000;
halfwidth = 1.1;

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

colours = { [0 1 0],...
            [0 1 0],...
            [0 1 0],...
            [1 0 0],...
            [1 0 0],...
            [1 1 0],...
            [1 1 0],...
            };

% Increase Resolution
sf = 3;
triangles = cellfun(@(x) {x*sf}, triangles);
hei = hei*sf;
wid = wid*sf;
        
% Create pixel grid
pixels = false(hei, wid, 3);

% Draw fractal triangles
for ii = 1:length(triangles)
    fractal = fractalcircle_fractal(triangles{ii}, wid, hei, halfwidth, radius_threshold, max_circles);
    pixels(:,:,1) = pixels(:,:,1) | (fractal*colours{ii}(1));
    pixels(:,:,2) = pixels(:,:,2) | (fractal*colours{ii}(2));
    pixels(:,:,3) = pixels(:,:,3) | (fractal*colours{ii}(3));
end

% Convert to 16-bit int
save_pixels = pixels*2^16;

% Draw
image(pixels);

% Save
imwrite(save_pixels, 'fractal_xmas.png', 'png');