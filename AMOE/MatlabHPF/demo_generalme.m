%% Demo General
% This demo generates the following similrity matrixand 
% finds the corresponding graph minimum-cut

%% Generating the similarity matrix
a = sparse([0 3 4 0 0 0 0 0
    0 0 2 2 0 0 0 0
    0 0 0 1 3 0 0 0
    0 0 0 0 0 4 2 0
    0 0 0 0 0 3 5 0
    0 0 0 0 0 0 0 4
    0 0 0 0 0 0 0 3
    0 0 0 0 0 0 0 0]);

%% SOURCE node is node# 1
source = 1;

%% SINK node is node# 6
sink = 8;

%% Running the minimumcut algorithm
[value,cut] = hpf(a,source,sink)
