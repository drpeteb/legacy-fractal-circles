function [ circ ] = soddy_circle( circ1, circ2, circ3 )
%SODDY_CIRCLE Find the soddy circle

% Bends
b1 = 1/circ1.r;
b2 = 1/circ2.r;
b3 = 1/circ3.r;

% Centres
c1 = circ1.c(1) + circ1.c(2)*1i;
c2 = circ2.c(1) + circ2.c(2)*1i;
c3 = circ3.c(1) + circ3.c(2)*1i;

% Products
z1 = b1*c1;
z2 = b2*c2;
z3 = b3*c3;

% Solve the Descartes circle theorem
b = b1 + b2 + b3 + 2*sqrt(b1*b2 + b2*b3 + b3*b1);
rad = 1/b;

% Solve the complex Descartes circle theorem
z = z1 + z2 + z3 + 2*sqrt(z1*z2 + z2*z3 + z3*z1);
c = z/b;
cen = [real(c); imag(c)];

% Make the circle
circ = init_circle(cen, rad, []);

end

