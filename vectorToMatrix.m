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
% input  =  [ 1 2 3 4 5 6 7 8 9]
% output = 1 2 3
%          4 5 6
%          7 8 9
%
function matrix=vectorToMatrix(vector)

[~,n]=size(vector);
m=sqrt(n);
for i=1:n
    x=idivide(int32(i), int32(m), 'ceil');
    y=i-(x-1)*m;
    mat(x,y)=vector(1,i);
end
matrix=mat;
end