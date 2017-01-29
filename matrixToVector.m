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
function vector=matrixToVector(matrix)
% convert the matrix to vector
% input= 1 2 3
%        4 5 6
%        7 8 9
% output =  [ 1 2 3 4 5 6 7 8 9] 
[~,n]=size(matrix);
for i=1:n
    for j=1:n
    vector(1,(i-1)*n+j)=matrix(i,j);
    end
end
end