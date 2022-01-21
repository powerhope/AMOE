%% Vision Demo

%% Load the problem
load gargoyle-smal.mat

%% Running the minimum-cut algorithm
[value,cut] = hpf(sim_mat,source,sink);

% The capacity of the cut is 29696707