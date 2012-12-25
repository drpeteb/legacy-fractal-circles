function [ circ ] = soddy_circle_edge( circ1, circ2, edge )
%SODDY_CIRCLE_EDGE Find the soddy circle when one is a straight line

% Bends
b1 = 1/circ1.r;
b2 = 1/circ2.r;

% Solve the Descartes circle theorem
b = b1 + b2 + 2*sqrt(b1*b2);
r = 1/b;

% Get vectors and shizzle
v = edge.start;
rva = circ1.c - v;
el = edge.stop-edge.start; el = unit(el);
ep = [0 1; -1 0]*el;
if dot(rva, ep) < 0
    ep = -ep;
end
z = r*ep-rva;

% Solve quadratic
qa = 1; qb = -2*z'*el; qc = z'*z - (r+circ1.r)^2;
lam1 = ( -qb + sqrt( qb^2 - 4*qa*qc ) )/(2*qa);
lam2 = ( -qb - sqrt( qb^2 - 4*qa*qc ) )/(2*qa);

% Resolve the ambiguity
int1 = v + r*ep - lam1*el;
int2 = v + r*ep - lam2*el;
if dot( (circ1.c-int1), (circ2.c-int1) ) < dot( (circ1.c-int2), (circ2.c-int2) )
    c = int1;
else
    c = int2;
end

% Make the circle
circ = init_circle(c, r, []);

end

