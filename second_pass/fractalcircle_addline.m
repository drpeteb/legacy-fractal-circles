function [ grid ] = fractalcircle_addline( grid, vstart, vstop, halfwidth )
%FRACTALCIRCLE_ADDLINE Draw a line on a pixel grid

[hei, wid] = size(grid);

vmid = 0.5*(vstop+vstart);
len = norm(vstop-vstart,2);

% Transformation
ang = atan2(vstop(2)-vstart(2), vstop(1)-vstart(1));
rot = [cos(ang) -sin(ang); sin(ang) cos(ang)];
shift = vmid;

% Make an array of pixel locations
pix = zeros(2,wid*hei);
tmp = repmat( (1:hei)', 1, wid )';
pix(1,:) = repmat( (1:wid), 1, hei);
pix(2,:) = tmp(:)';

% Transform
trans_pix = rot\(bsxfun(@minus, pix, shift));

% Test position
trans_grid = zeros(1,hei*wid);
trans_grid( (abs(trans_pix(1,:))<=(len/2))&(abs(trans_pix(2,:))<=halfwidth) ) = 1;

grid = grid | reshape( trans_grid, wid, hei)';

end

