model;
param N;
set I := 1..N;

set NODES;

param START_NODE;
param END_NODE;

set ARCS within (NODES cross NODES);

param DIST {ARCS}, >= 0;
