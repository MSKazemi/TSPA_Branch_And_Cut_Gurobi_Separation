function graphPlotLoc(CM,X,Y)
% CM is Cost Matrix
Top.X=X;Top.Y=Y;
[n,~]=size(CM);
p=1;
for i=1:n
    for j=1:n
        if(i~=j&&CM(i,j)~=0)
            Top.G1(1,p)=i;
            Top.G2(1,p)=j;
            Top.CV(1,p)=CM(i,j);
            p=p+1;
        end
    end
end

G = digraph(Top.G1,Top.G2);
p=plot(G);

p.XData=Top.X;
p.YData=Top.Y;
p.Marker = 'h';
p.NodeColor = 'r';
p.MarkerSize = 8;
p.LineWidth=1;
p.ArrowSize=10;
p.EdgeLabel=Top.CV
p.NodeLabel=[1:size(CM,2)];
% end