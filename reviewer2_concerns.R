

###Adjacent CNA hubs analysis


#protein 
library(Biobase)
prot <- readRDS(file = "../neta-bcpls/data/prot-expression-set.rds")
cna <- readRDS(file = "../neta-bcpls/data/cna-expression-set.rds")
ecna <- exprs(cna)
eprot <- exprs(prot)


#pair 1
ov16 <- c("16_68039840_68051376_0","16_68063383_71366920_0")
ov16a <- as_ids(E(ig)[inc(V(ig)$name %in% ov16[1])])
ov16b <- as_ids(E(ig)[inc(V(ig)$name %in% ov16[2])])
a <- sapply(strsplit(x = ov16a, split = "|", fixed = TRUE), function(x) x[2])
b <- sapply(strsplit(x = ov16b, split = "|", fixed = TRUE), function(x) x[2])
intersect(a, b)
library(ggplot2)
qplot(x = ecna[ov16[1],], y  = ecna[ov16[2],],
      ylab = "16q22.1-22.2 (68-71 Mb)",
      xlab = "16q22.1 (68-68 Mb)") + theme_bw() + 
  annotate(geom="text", x=-1, y=1, label=paste("Correlation", 
                                               round(cor(ecna[ov16[1],], ecna[ov16[2],]),2)),
           color="red")




ov16 <- c("17_20255440_20890727_0", "17_19777544_19864430_0")

ov16


###BRCA1 (comment 4)
#not in the analysis
"BRCA1" %in% yinfo$alias 

#17q12 hub location
chr17q12 <- c(37789432, 37942738)
brca1 <- c(43044295, 43125483)
#is brca1 2 mb upstream of 17q12 hub? No
(chr17q12[2] + 2e6) > brca1[1]
#how far upstream is it?
(brca1[1] - chr17q12[2]) / 1e6

