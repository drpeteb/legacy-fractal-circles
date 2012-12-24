

% Start with three circles
s1 = init_circle([0 0], 1, []);
s2 = init_circle([2 0], 1, []);
s3 = init_circle([1 sqrt(3)], 1, []);
circ_list = [s1; s2; s3];
todo_list = [1 2 3];

% while ~isempty(todo_list)
%     
% end

% Plot them
figure, hold on,
for ii = 1:length(circ_list)
    draw_circle(gca, circ_list(ii).c, circ_list(ii).r, 1000);
end

d = [2; 0];
R1 = 1; R2 = 1; R3 = 1;
R = R1*R2*R3/( R1*R2 + R2*R3 + R3*R1 + 2*sqrt( R1*R2*R3*( R1 + R2 + R3 ) ) );

a = -(R1+R); b = (R2+R);

A = 4*a^2*(d(1)^2+d(2)^2);
B = -4*d(1)*a*( ( a^2 - b^2 ) + ( d(1)^2 + d(2)^2 ) );
C = ( d(1)^2 + d(2)^2 )^2 + ( a^2 - b^2 )^2 + 2*( a^2*( d(1)^2 - d(2)^2 ) - b^2*( d(1)^2 + d(2)^2 ) );

x = zeros(2,1);
x(1) = (-B+sqrt(B^2-4*A*C))/(2*A);
x(2) = -sqrt(1-x(1)^2);

draw_circle(gca, -x*(R+R1), R, 1000);

%%

vertexes = [0 1 2; 0 sqrt(3), 0];
[c, r] = incircle(vertexes);
figure, hold on
plot(vertexes(1,:), vertexes(2,:));
draw_circle(gca, c, r, 1000);