 
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
function solutionGurobiStructure=solveTSPABranchAndCutGurobiSeparation(Top)
costMatrix=Top.CM;
% Generate the Gurobi model of Asymmetric Traveling Salesman Problem only
% with Degree Constraints
model=generateGurobiModelWithDegreeConstraintsTSPA( costMatrix )
param.OutputFlag=0;
sol=gurobi(model,param);
solution=vectorToMatrix(sol.x');
X=Top.X;Y=Top.Y;
f1=figure('Name','Cost Matrix of Graph');
graphPlotLoc( costMatrix,X,Y);
f2=figure('Name','Solution for TSPA only with considartion of Degree Constraints');
graphPlotLoc(solution.*costMatrix,X,Y);

%--------------------------------------------------------------------------
numberOfVertices=size(solution,1);
finished = 0;
while (finished ==0)
% Check the if (y, z) takes a value >= 1 this means that all constraints (59)
% are satisfied by the given x*.
% Otherwise, the subset S* := {i ? V : yi = 1} defines the constraint (59) that is most
% violated by x*, and that is added to the current set of (active) constraints in step 3
    
solutionSeparationProblemILP=separationProblemILP( numberOfVertices,solution );
Model_Separation_Problem_ILP=solutionSeparationProblemILP;
sol=gurobi(solutionSeparationProblemILP,param);
Objective_Function_Value_y_Za_value=sol.objval
if (sol.objval>=1) % Check the (y, z) takes a value ? 1 this means that solution.objvalue >= 1 
    finished =1
end
% If not (y, z) takes a value ? 1
% y = SstarVector
SstarVector=sol.x(1:numberOfVertices,1)';
y=SstarVector
% Za = solu
solu=vectorToMatrix(sol.x(numberOfVertices+1:numberOfVertices+numberOfVertices.^2,1)');
f3=figure('Name','Plot of Za - Arc of S*');
graphPlot(solu);


%%-------------------------------------------------------------------------
it=1;
Sstar=[];
% Check the if the Za or Y have value and not be empty 
% this ckeck is not necessary because it is checked above ("% If not (y, z)
% takes a value ? 1")=== Check the (y, z) DO NOT takes a value >= 1 this means that solution.objvalue =< 1  

if(sum(sum(solu>=1))~=0) % I think this not necessary
for i = 1:numberOfVertices
    if(SstarVector(1,i)~=0) 
        Sstar(1,it)=i;
        it=it+1;
    end
end
% Create constraints that should be add to other costraints in order to
% satisfy sub tour elimination.

c99 = zeros(numberOfVertices,numberOfVertices);

for i=1:size(Sstar,2)
    for j=1:size(Sstar,2)
        x=Sstar(1,i);
        y=Sstar(1,j);
        if(x~=y)
            c99(x,y)=1;
        end
        
    end
end
SstarVector=[];
% cons99 is the subset S? := {i ? V : yi = 1} defines the constraint (59) that is most
% violated by x?, and that is added to the current set of (active) constraints in step 3 
cons99=matrixToVector(c99);
cons99sense='<';
cons99rhs=size(Sstar,2)-1;

model.A= sparse(vertcat(model.A,cons99));
model.sense= vertcat(model.sense,cons99sense);
model.rhs=vertcat(model.rhs,cons99rhs);
model.vtype = 'B';
solut=gurobi(model,param);
Total_Cost_Routing=solut.objval
Model_DegreeCon_SubSetAddedCons_TSPA=model
f4=figure('Name','Solution Tour for TSPA');
graphPlotLoc(vectorToMatrix(solut.x').*costMatrix,X,Y);
solution=vectorToMatrix(solut.x');
solutionGurobiStructure=solut;
end % I think this not necessary
end
end
