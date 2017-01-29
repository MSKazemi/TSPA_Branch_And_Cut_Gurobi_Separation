%% I dedicate all this code, all my work, to my wife, Fershteh.
%------------------------------------------------------------------------

% please feel free to contact us if you need any further information
% Author: Mohsen Seyedkazemi Ardebili
% Email: mohsen.seyedkazemi@studio.unibo.it
% Supervisor: Professor Daniele Vigo
% Email: 
% Created:   12.09.2016
% (c) Copyright by University of Bologna.
%
%
%%
function [degreeConstraints]=generateDegreeConstraintsTSPA(n) 
% The generateConstraintsTSPA function generate the two type of Asymmetric Traveling
% Salesman Problems constraints the so-called degree constraints and
% subtours costraints.
% In order to obtain a valid ILP model for the ATSP we need to add constraints
% forbidding the existence of subtours, i.e., tours visiting only a subset of the
% vertices.
% function [degreeConstraints,subToursCostraints]=generateConstraintsTSPA(n)
% in put of this function is n intger number that is equal to the number of
% city or vertices in gragh.
%% DEGREE CONTRAINTS 
degreeConstraintsFirstPart=zeros(n,n*n);
degreeConstraintsSecondPart=zeros(n,n*n);
for i=1:n
    for j=1:n
        
    degreeConstraintsFirstPart(i,(i-1)*n+j)=1;
    degreeConstraintsFirstPart(i,(i-1)*n+i)=0;
    degreeConstraintsSecondPart(i,i+(j-1)*n)=1;
    degreeConstraintsSecondPart(i,(i-1)*n+i)=0;
    end
end
degreeConstraints(1:n,1:n*n)=degreeConstraintsFirstPart;
degreeConstraints(n+1:2*n,1:n*n)=degreeConstraintsSecondPart;
end



