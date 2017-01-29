 
%% please feel free to contact us if you need any further information
% Author: Mohsen Seyedkazemi Ardebili
% Email: mohsen.seyedkazemi@studio.unibo.it
% Supervisor: Professor Daniele Vigo
% Email: 
% Created:   12.09.2016
%
%% Instead of explicitly considering all possible subsets S? (unpractical 
% for values of |V | not too small), the separation problem can be formulated
% (as an ILP) by introducing binary variables
%
% Then, after having solved the complete ILP (76), (70)-(72), (73)-(75), if the optimal solution
% (y,z) takes a value > 1, this means that all constraints (59) are satisfied by the given x*.
% Otherwise, the subset S* := {i ? V : yi = 1} defines the constraint (59) that is most
% violated by x?, and that is added to the current set of (active) constraints in step 3
%
clear;clear all; clear model;clc
Top=randGraph(15)
solveTSPABranchAndCutGurobiSeparation(Top)




