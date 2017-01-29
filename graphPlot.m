%% When I wrote this, only God and I understood what I was doing
% Now, God only knows
%------------------------------------------------------------------------

% please feel free to contact us if you need any further information
% Author: Mohsen Seyedkazemi Ardebili
% Email: mohsen.seyedkazemi@studio.unibo.it
% Supervisor: Professor Daniele Vigo
% Email: 
% Created:   12.09.2016
% (c) Copyright by University of Bologna.
%
%%
function graphPlot( adjacencyMatrix)
% Plot of directed graph  

G = digraph(adjacencyMatrix);
G.Edges;
G.Edges.Weight;

p=plot(G,'Layout','force','EdgeLabel',G.Edges.Weight);
p.Marker = 's';
p.NodeColor = 'r';
p.MarkerSize = 12;
p.LineWidth=2.5;
p.ArrowSize=25;
end

