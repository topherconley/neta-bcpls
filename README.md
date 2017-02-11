#Network Analysis for Breast Cancer Proteogenomics Landscape Study 

This repository contains the `R` notebooks illustrating the `spaceMap` model's network analysis toolkit in regards to the CPTAC Breast Cancer Proteogenomics Landscape Study. For the scientific context and documentation of the `R` noteboks please go to the [neta-bcpls home page](https://topherconley.github.io/neta-bcpls/). 

## Analysis Outline

- **Data cleaning:**
The folder `clean-data` contains the pre-processing steps taken prior to model fitting. The output of this analysis is stored in the `data` folder. For access to the original data sets not stored in the repository, please reach out to the authors. 
- **Networks:** The Boot.Vote networks for spaceMap and sCGGM are located in the `model-fits` directory in serialized form. See R's `readRDS` function for import. 
- **Analysis:**
The folder `neta` contains R notebooks for GO ontology handling, network analyses for spaceMap under protein and RNA responses coupled with the CNA predictors, as well as a network analysis with sCGGM. The outcome these notebooks is currently under review. 
