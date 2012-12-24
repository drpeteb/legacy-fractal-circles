bps = dbstatus;
vars = who;

close all;
for ii = 1:length(vars)
    if ~strcmp(vars{ii}, 'bps')
        eval(['clear ' vars{ii}]);
    end
end

dbstop(bps);

clear bps ii vars

clc
