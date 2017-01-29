% please feel free to contact us if you need any further information
% Author: Mohsen Seyedkazemi Ardebili
% Email: mohsen.seyedkazemi@studio.unibo.it
% Supervisor: Professor Daniele Vigo
% Email: 
% Created:   12.09.2016
%
%
%%
% This function vector = bm2bv(matrix)input is a sqr (n*n) binary matrix
% output will show the the the rows and columns that are equal one
% for example:
% x=[0 0 0;
%    0 0 0;
%    1 0 1];
% has two 1 in row 3 and columns 1 and 3 so answer should show the the
% poistion of 1 and 3
% bm2bv(x)
% ans =[1;
%       0;
%       1]
% 
function vector = bm2bv(matrix)
[n,~]=size(matrix);
r=ones(1,n)
c=ones(n,1)
x=r*matrix
y=matrix*c
pp=r*matrix*c
z=y+x'
vector=[];
for i =1:n
    if(z(i,1)>=1)
        vector(i,1)=1;else vector(i,1)=0;
    end 
    end
vector
end