clup
dbstop if error

radius_threshold = 0.002;
max_circles = 10000;

% Assign three starting vertexes
v1 = [0 0]';
v2 = [2 0]';
v3 = [1 sqrt(3)]';

% Edges
e1.start = v1; e1.stop = v2;
e2.start = v2; e2.stop = v3;
e3.start = v3; e3.stop = v1;

% Create lists
circ_list = {e1; e2; e3};       % First three are special cases
todo_list = {[1 2 3]};

% % Drawing
% figure, hold on
% vert = [v1 v2 v3 v1];
% plot(vert(1,:), vert(2,:));
% xlim([0 4])

% Loop
counter = 3;
id = 4;
while ~isempty(todo_list)
    
    counter = counter +1;
    
    % Get next triple
    triple = todo_list{1};
    todo_list(1) = [];
    
    % See what sort it is
    num_of_lines = length(intersect(triple, [1 2 3]));
    
    if num_of_lines == 3
        % Initial circle - incircle of starting triangle
        
        % Get vertexes
        vert = [e1.start e2.start e3.start];
        
        % Find circle
        [c, r] = incircle(vert);
        circ = init_circle(c, r, triple);
        
    elseif num_of_lines == 2
        % Corner - incircle of isosceles triangle
        
        % Which one is the circle
        idx = setdiff(triple, [1 2 3]);
        circ = circ_list{idx};
        
        % Find the edges and vertexes
        idxs = intersect(triple, [1 2 3]);
        if circ_list{idxs(1)}.start==circ_list{idxs(2)}.stop
            v = circ_list{idxs(1)}.start;
            p1 = circ_list{idxs(1)}.stop;
            p2 = circ_list{idxs(2)}.start;
        elseif circ_list{idxs(2)}.start==circ_list{idxs(1)}.stop
            v = circ_list{idxs(2)}.start;
            p1 = circ_list{idxs(2)}.stop;
            p2 = circ_list{idxs(1)}.start;
        else
            error('Invalid edges');
        end
        
        % Find isosceles triangle
        vert = corner_triangle(circ.c, circ.r, v, p1, p2);
        
        % Find circle
        [c, r] = incircle(vert);
        circ = init_circle(c, r, triple);
        
    elseif num_of_lines == 1
        % Edge - treat as three circles, one with 0 bend
        
        % Create infinite circle
        
        % Which circles and which edge
        idxs = setdiff(triple, [1 2 3]);
        idx = intersect(triple, [1 2 3]);
        
        % Soddy circle
        circ = soddy_circle_edge(circ_list{idxs(1)}, circ_list{idxs(2)}, circ_list{idx});
        
        % Parents
        circ.par = triple;
        
    else
        % Standard, Appolonian packing
        
        % Soddy circle
        circ = soddy_circle(circ_list{triple(1)}, circ_list{triple(2)}, circ_list{triple(3)});
        
        % Parents
        circ.par = triple;
        
    end
    
    % Is it large enough?
    if circ.r > radius_threshold
        
        % Add circle to list
        circ_list = [circ_list; circ];
        
        % Add new combinations to to-do list
        new_triples = repmat(triple, 3, 1);
        new_triples(logical(eye(3))) = id;
        todo_list = [todo_list; mat2cell(new_triples, [1 1 1], 3)];
        
        % Say something
        fprintf(1, 'Now calculated %u circles.\n', id);
        
%         draw_circle(gca, circ_list{id}.c, circ_list{id}.r, 100);
        
        % Increment id
        id = id + 1;
        
    end
    
    % Stop conditions
    if counter>=max_circles
        break;
    end
    
end

%% Drawing

figure, hold on

% Draw the initial triangle
vert = [v1 v2 v3 v1];
plot(vert(1,:), vert(2,:), 'linewidth', 2);
% xlim([0 4])

% Draw the circles
for ii = 4:length(circ_list)
    
    draw_circle(gca, circ_list{ii}.c, circ_list{ii}.r, 'b', 100);
    
end