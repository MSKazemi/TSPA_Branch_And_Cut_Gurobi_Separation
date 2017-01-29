
%------------------------------------------------------------------------
% please feel free to contact us if you need any further information
% Author: Mohsen Seyedkazemi Ardebili
% Email: mohsen.seyedkazemi@studio.unibo.it
% Supervisor: Professor Daniele Vigo
% Email: 
% Created:   12.09.2016
%
%%
% convert the vector to matrix
% input  =  [ 1 2 3, 4 5 6, 7 8 9,10 11 12]    4*3
% output = 0  1  2  3                          4*4
%          4  0  5  6
%          7  8  0  9
%          10 11 12 0
%
function v2sqm=vectorToMatrixCon(vector,numNodes)
[~,n]=size(vector);
for i=1:n
    x=idivide(int32(i), int32(numNodes-1), 'ceil');
    y=i-(x-1)*(numNodes-1);
    matrix(x,y)=vector(1,i);
end
 
x = zeros(numNodes);
x(1,2:numNodes)= matrix(1,:);
x(numNodes,1:numNodes-1)= matrix(numNodes,:);
for i=2:numNodes-1
    for j=1:numNodes
        x(i,1:i-1)=matrix(i,1:i-1);
        x(i,i+1:numNodes)=matrix(i,i:numNodes-1);
    end
end
v2sqm=x;
end

