function Top=randGraph(numNodes)
% Top.CV Is a cost vector without the cost of travel from point one to itself. 
% Top.CM is a cost matrix that is a sqr matrix in other word is an adjacency cost matrix. 
% Top.G1 = [ 1 2 3 3 3 4 5 5 5 5 ] Is the source point of travel.
% Top.G2 = [ 2 1 4 5 1 5 1 2 3 4 ] Is the the destination point of travel.
for i=1:numNodes
    for j =1:numNodes-1
        Top.G1(1,j+(i-1)*(numNodes-1))=i;
    end
end
p=1;
for i = 1:numNodes
    for j = 1:numNodes
        if(i~=j)
       Top.G2(1,p)=j;
       p=p+1;
        end
    end
end

Top.X=randi([0 20],1,numNodes);
Top.Y=randi([0 20],1,numNodes);
Top.L(1,:)=Top.X;
Top.L(2,:)=Top.Y;

for i=1:size(Top.G1,2)
    Top.CV(1,i)=euclideanDis(Top.L(:,Top.G1(1,i))',Top.L(:,Top.G2(1,i))');
end
Top.NodeLabel=[1:numNodes];
% Top.CV Is a cost vector without the cost of travel from point one to itself. 
% Top.CM is a cost matrix that is a sqr matrix in other word is an adjacency cost matrix
Top.CM = vectorToMatrixCon(Top.CV,numNodes);
end