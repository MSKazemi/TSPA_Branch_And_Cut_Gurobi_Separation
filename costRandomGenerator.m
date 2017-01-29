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
function costMatrix = costRandomGenerator( lowerBound,upperBound,matrixSize )
%   costMatrix function generate the matrix with the uniformly random distributed numbers
%   The size of matrix is matrixSize * matrixSize
%   The lower/upper bound of random numbers is limted by
%   lowerBound and upperBound respectively
%   Use the randi function to generate matrixSize*matrixSize random matrix
%   from the uniform distribution between lowerBound and upperBound.
costMatrix=randi([lowerBound upperBound],matrixSize,matrixSize);

end

