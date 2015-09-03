function [ cen, rad ] = incircle( vertexes )
%INCIRCLE Find the incircle for a given triangle.
% Input is a 2x3 matrix.
% Output is a centre and a radius

% Vertexes
va = vertexes(:,1);
vb = vertexes(:,2);
vc = vertexes(:,3);

% Edge vectors
rab = vb-va;
rbc = vc-vb;
rca = va-vc;
eab = unit(rab);
ebc = unit(rbc);
eca = unit(rca);

% Unit vectors
ea = eca-eab; ea = unit(ea);
eb = eab-ebc; eb = unit(eb);

% Solve for the centre
x = [-ea eb]\rab;
cen = va - x(1)*ea;

% More unit vectors
ep = zeros(2,1);
ep(1) = -rab(2);
ep(2) =  rab(1);
ep = unit(ep);

% Solve for radius
x = [-eab ep]\(va-cen);
int = va + x(1)*eab;
rad = norm(int-cen,2);

end


