%% When I wrote this, only God and I understood what I was doing
% Now, God only knows
%------------------------------------------------------------------------

% please feel free to contact us if you need any further information
% Author: Mohsen Seyedkazemi Ardebili
% Email: mohsen.seyedkazemi@studio.unibo.it
% Supervisor: Professor Daniele Vigo
% Email: 
% Created:   12.09.2016
% 
% (c) Copyright by University of Bologna.
%
%
%%
function model=generateGurobiModelWithDegreeConstraintsTSPA( costMatrix )
% The generateGurobiModelTSPA generate the Gurobi model of the Asymmetric Traveling Salesman Problem
% Input of this function is the cost matrix the weigth of each edge in graph
% the output of this function is the Gurobi model structure.
[n,~]=size(costMatrix);
% Objective Function
% nininize    Sun Ca*Xa when a belong to Arces 
sumCaXa=zeros(n*n,1);
for i =1:n
    for j =1:n
     sumCaXa(j+(i-1)*n,1)=costMatrix(i,j);   
    end
end
model.obj = sumCaXa;


% Subject to:
% Constraints  the so-called degree constraints
% model.A=zeros(n,n);
degreeConstraints=generateDegreeConstraintsTSPA(n);
% sense of degree constraints =
model.sense(1:2*n,1)= '=';
model.rhs(1:2*n,1) = 1;
model.A = sparse( double( degreeConstraints ) );
end