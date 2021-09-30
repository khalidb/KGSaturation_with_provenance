#Provenance-Enhanced Knowledge Graphs
This repository contains the source code and data used for capturing provenance incrementally in RDF knowledge graphs. Specifically, it contains the source code and data used in the following technical report showing how knowledge graph saturation can be enhanced with provenance capture, and how both saturation and provenance capture can be performed efficiently against dynamic knowledge graphs that are subject to triple assertion and deletion. 


Khalid Belhajjame and Mohamed-Yassine Mejri. Provenance-Enhanced Saturation of Dynamic Knowledge Graphs. Technical Report. PSL, Paris-Dauphine University, pages 1-59. 2021


The source code and data are available as a postgres dump. The code is composed of a suite of stored procedures. The code is composed of the following kinds of stored procedures:

- Dataset Loading
- Classical bulk-based saturation with no provenance capture
- Bulk-based saturation with provenance capture
- Incremental saturation with provenance capture under batch insertion
- Incremental saturation with provenance capture under batch deletion

The datasets that are included within the repository are DBLP, YAGO, LUBM-10 ansd LUBM-1000.


