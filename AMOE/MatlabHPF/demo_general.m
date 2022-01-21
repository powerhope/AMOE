%% Demo General
% This demo generates the following similrity matrixand 
% finds the corresponding graph minimum-cut

%% Generating the similarity matrix
a = sparse([0 3 3 0 0 0
    0 0 0 2 0 0
    0 0 0 1 2 0
    0 0 0 0 0 3
    0 0 0 0 0 3
    0 0 0 0 0 0 ]);

%% SOURCE node is node# 1
source = 1;

%% SINK node is node# 6
sink = 6;

%% Running the minimumcut algorithm
[value,cut] = hpf(a,source,sink)

% The capacity of the cut is 5 and Nodes 1 (the source) and 2 are the
% source set