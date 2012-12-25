function [ vert ] = corner_triangle( c, r, v, p1, p2 )
%CORNER_TRIANGLE Find the vertexes of an isosceles triangle in the corner
%of a triangle filled by a circle.

% c and r describe the circle. v is the point of the triangle. p1 and p2
% are two other points on the two edges.

% Unit vectors
e1 = p1-v; e1 = unit(e1);
e2 = p2-v; e2 = unit(e2);
ec = c-v;  ec = unit(ec);
ep = [0 -1; 1 0]*ec;

% Intersection of circle and triangle
int = c - r*ec;

% New triangle vertexes
x = [-ep e1]\(int-v);
v1 = int + x(1)*ep;
v2 = int - x(1)*ep;

% Collate vertexes
vert = [v v1 v2];

end

