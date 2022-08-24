# Provenance-Enhanced Knowledge Graphs

This repository contains the source code and the data used for capturing provenance incrementally in RDF knowledge graphs. Specifically, it contains the source code and data used in the following technical report showing how knowledge graph saturation can be enhanced with provenance capture, and how both saturation and provenance capture can be performed efficiently against dynamic knowledge graphs that are subject to triple assertion and deletion. 


Khalid Belhajjame and Mohamed-Yassine Mejri. [Provenance-Enhanced Saturation of Dynamic Knowledge Graphs](https://tinyurl.com/yc5j4zzp). Technical Report. PSL, Paris-Dauphine University, pages 1-59. 2022


## Data Model
To reduce the space occupied by knowledge graphs in the database server and to avoid joining string-encoded RDF attributes (which is costly compared to joining integers), we used a dictionary table **dict(resource,ID)**, which associates an RDF resource (IRI, node literal or empty) with an integer. 
To store RDF triples and their associated why-provenance, we use a single table **triple(s, p, o, witness)** to store the triples and their associated provenance. 

## Code
The source code and data are available. The code is composed of a suite of stored procedures. 

- The main procedures used for teh incremental saturation can be found in the "Functions" directory.
- The schema directory contains a postgres dump of the schema, which includes, in additipon to the procedures, utility procedures, triggres, and the schema of the relational tables that are used for storing the knowledge graph in a compressed manner.
- The data directory contains a link to a dump of the data used, and which comprises the data of the knowledge graphs that were used including DBLP, YAGO and LUBM.


## Datasets

The datasets that are included within the repository are:

DBLP computer science bibliography: https://dblp.uni-trier.de/faq/What+is+dblp.html

YAGO: https://yago-knowledge.org. We used the Taxonomy and the full types

LUBM-10 and LUBM-1000: We generated these datasets using the Lehigh University Benchmark available at http://swat.cse.lehigh.edu/projects/lubm/


