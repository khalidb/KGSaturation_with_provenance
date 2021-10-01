# Provenance-Enhanced Knowledge Graphs

This [repository](https://universitedauphine-my.sharepoint.com/:u:/g/personal/khalid_belhajjame_lamsade_dauphine_fr/ERtD-VBJNjtMoE05NFRAmIQBFqWqBhAoGRThG6v65aJaJw?e=HbnQvD), which can be downloaded at the following [URL](https://universitedauphine-my.sharepoint.com/:u:/g/personal/khalid_belhajjame_lamsade_dauphine_fr/ERtD-VBJNjtMoE05NFRAmIQBFqWqBhAoGRThG6v65aJaJw?e=HbnQvD), contains the source code and data used for capturing provenance incrementally in RDF knowledge graphs. Specifically, it contains the source code and data used in the following technical report showing how knowledge graph saturation can be enhanced with provenance capture, and how both saturation and provenance capture can be performed efficiently against dynamic knowledge graphs that are subject to triple assertion and deletion. 


Khalid Belhajjame and Mohamed-Yassine Mejri. [Provenance-Enhanced Saturation of Dynamic Knowledge Graphs](https://tinyurl.com/4tkd2rxa). Technical Report. PSL, Paris-Dauphine University, pages 1-59. 2021


## Data Model
To reduce the space occupied by knowledge graphs in the database server and to avoid joining string-encoded RDF attributes (which is costly compared to joining integers), we used a dictionary table **dict(resource,ID)**, which associates an RDF resource (IRI, node literal or empty) with an integer. 
To store RDF triples and their associated why-provenance, we use a single table **triple(s, p, o, witness)** to store the triples and their associated provenance. 

## Code
The source code and data are available as a postgres dump. The code is composed of a suite of stored procedures. The code is composed of the following kinds of stored procedures. Note that such procedures needs to be configured to specify, for example, the name of the dataset, for instance.

- Dataset Loading: prepare_data()
- Classical bulk-based saturation with no provenance capture: saturate() and saturate_full()
- Bulk-based saturation with provenance capture: p_saturate(), p_saturate_full(), bulk°saturation() and bulk_saturation_driver()
- Incremental saturation with provenance capture under batch insertion: incremental_saturation_driver(), incremental_qualtile_saturation_driver() 
- Incremental saturation with provenance capture under batch deletion: delete_instance_saturation() and delete_schema_saturation

There are also a number of other auxiliary sub-routines that are called from within the above procedures.

## Datasets

The datasets that are included within the repository are:

DBLP computer science bibliography: https://dblp.uni-trier.de/faq/What+is+dblp.html

YAGO: https://yago-knowledge.org. We used the Taxonomy and the full types

LUBM-10 and LUBM-1000: We generated these datasets using the Lehigh University Benchmark available at http://swat.cse.lehigh.edu/projects/lubm/


