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
%% Instead of explicitly considering all possible subsets S? (unpractical 
% for values of |V | not too small), the separation problem can be formulated
% (as an ILP) by introducing binary variables
%
% Then, after having solved the complete ILP (76), (70)-(72), (73)-(75), if the optimal solution
% (y,z) takes a value ? 1, this means that all constraints (59) are satisfied by the given x?.
% Otherwise, the subset S? := {i ? V : yi = 1} defines the constraint (59) that is most
% violated by x?, and that is added to the current set of (active) constraints in step 3
%
% solutionSeparationProblemILP = separationProblemILP( numberOfVertices,solutionTSPA )

function solutionSeparationProblemILP = separationProblemILP(numberOfVertices,solutionTSPA)
% Objective Function
% mininize

solutionTSPAV=matrixToVector(solutionTSPA);
model.obj=horzcat(ones(1,numberOfVertices),-solutionTSPAV);

% Constraint 70
cons70=zeros(1,numberOfVertices+numberOfVertices.^2);
cons70(1,1:numberOfVertices)=1;
cons70sense='>';
cons70rhs=2;
% Constraint 71
cons71=zeros(1,numberOfVertices+numberOfVertices.^2);
cons71(1,1:numberOfVertices)=1;
cons71sense= '<';
cons71rhs=numberOfVertices-2;
%% Constraints 73 ---------------------------------------------------------
con73=[];
c73=zeros(numberOfVertices,numberOfVertices);
y73=zeros(1,numberOfVertices);
r=1;
for i=1:numberOfVertices
    for j=1:numberOfVertices
        if(i~=j)
            c73(i,j)=1;
            y73(1,i)=-1;
            con73(r,:)=matrixToVector(c73);
            yi73(r,:)=y73;
            c73=zeros(numberOfVertices,numberOfVertices);
            y73=zeros(1,numberOfVertices);
            cons73=horzcat(yi73,con73);
            cons73rhs(r,1)=0;
            cons73sense(r,1)='<';
            r=r+1;
        end
    end
end

%--------------------------------------------------------------------------
%% Constraint 74 ----------------------------------------------------------
con74=[];
c74=zeros(numberOfVertices,numberOfVertices);
y74=zeros(1,numberOfVertices);
r=1;
for i=1:numberOfVertices
    for j=1:numberOfVertices
        if(i~=j)
            c74(i,j)=1;
            y74(1,j)=-1;
            con74(r,:)=matrixToVector(c74);
            yi74(r,:)=y74;
            c74=zeros(numberOfVertices,numberOfVertices);
            y74=zeros(1,numberOfVertices);
            cons74=horzcat(yi74,con74);
            cons74rhs(r,1)=0;
            cons74sense(r,1)='<';
            r=r+1;
        end
    end
end
%--------------------------------------------------------------------------
%% Constraint 75-----------------------------------------------------------
con75=[];
c75=zeros(numberOfVertices,numberOfVertices);
y75=zeros(1,numberOfVertices);
r=1;
for i=1:numberOfVertices
    for j=1:numberOfVertices
        if(i~=j)
            c75(i,j)=1;
            y75(1,i)=-1;
            y75(1,j)=-1;
            con75(r,:)=matrixToVector(c75);
            yi75(r,:)=y75;
            c75=zeros(numberOfVertices,numberOfVertices);
            y75=zeros(1,numberOfVertices);
            cons75=horzcat(yi75,con75);
            cons75rhs(r,1)=-1;
            cons75sense(r,1)='>';
            r=r+1;
        end
    end
end
%--------------------------------------------------------------------------
model.A= sparse(vertcat(cons70,cons71,cons73,cons74,cons75));
model.sense= vertcat(cons70sense,cons71sense,cons73sense,cons74sense,cons75sense);
model.rhs=vertcat(cons70rhs,cons71rhs,cons73rhs,cons74rhs,cons75rhs);
model.vtype = 'B';
solutionSeparationProblemILP=model;
end
