
# Network Analysis for Breast Cancer Proteogenomics Landscape Study 

This repository illustrates [spacemap's](https://topherconley.github.io/spacemap/index.html) network analysis toolkit applied to data from the Breast Cancer Proteogenomics Landscape Study (Mertins *et al.*, 2016, Nature). The repository hosts the detailed `R` notebooks that formed the basis of conclusions of section 4 of the spaceMap publication. For the scientific context and documentation of the `R` notebooks please go to the [neta-bcpls home page](https://topherconley.github.io/neta-bcpls/). 


## R Notebooks  

- **data.Rmd:** Bioinformatic pre-processing and dimension reduction of the original BCPLS data. The output of this analysis is stored in the `data/` folder. For access to the original data sets not stored in the repository, [please reach out to the authors of spaceMap](https://topherconley.github.io/spacemap/contact.html). 
- **mfits.Rmd:** An outline of how spaceMap was fit to the BCPLS data. The Boot.Vote networks for spaceMap and scggm are located in the `model-fits/` directory in serialized form. See R's `readRDS` function for import. 
- **annot.Rmd:** An illustration of how to form an GO-gene mapping for input to the network analysis toolkit. The GO-gene mapping is stored in `data/`.
- **neta.Rmd:** Application of the network analysis toolkit from the [spacemap](https://topherconley.github.io/spacemap/index.html) R package to the BCPLS data set.
