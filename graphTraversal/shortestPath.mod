set NODES; # All Nodes

# START NODE from where the path is required
param START_NODE symbolic in NODES;               

# END NODE from where the path should end
param END_NODE symbolic in NODES, <> START_NODE;  

set LINKS within (NODES cross NODES);

param DIST {LINKS} >= 0;            # distance of the link
var Use {(i,j) in LINKS}, binary;   # 1 if link selected

minimize Total_Time: 
    sum {(i,j) in LINKS} DIST[i,j] * Use[i,j];

subject to Start:
    sum {(START_NODE,j) in LINKS} Use[START_NODE,j] = 1;

subject to Balance {k in NODES diff {START_NODE,END_NODE}}:
    sum {(i,k) in LINKS} Use[i,k] = sum {(k,j) in LINKS} Use[k,j];
