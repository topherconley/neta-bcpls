#DESCRIPTION: 
#Reduce final boot.vote networks object size through sparse representation
#for inclusion in repository 

###########################
#spacemap protein

#boot.vote
prot_smap <- readRDS(file = "~/scratch-data/cptac/rep/spacemap_prot_boot_vote.rds")
library(Matrix)
prot_smap$bv$ParCor <- Matrix(data = (prot_smap$bv$ParCor) + 0, sparse = TRUE)
prot_smap$bv$Gamma <- Matrix(data = (prot_smap$bv$Gamma) + 0, sparse = TRUE)
saveRDS(object = prot_smap$bv, file = "~/repos/neta-bcpls/model-fits/smap_prot_boot_vote.rds")

#degree size
protbdeg <- readRDS(file = "~/scratch-data/cptac/rep/spacemap_prot_boot_degree.rds")
xbdeg <- protbdeg$xbdeg
ybdeg <- protbdeg$ybdeg
cnaset <- readRDS(file = "~/repos/neta-bcpls/data/cna-expression-set.rds")
colnames(xbdeg) <- featureNames(cnaset)
protset <- readRDS(file = "~/repos/neta-bcpls/data/prot-expression-set.rds")
colnames(ybdeg) <- featureNames(protset)
object.size(protbdeg)
protbdeg$xbdeg <- Matrix(xbdeg)
protbdeg$ybdeg <- Matrix(ybdeg)
saveRDS(object = protbdeg, file = "~/repos/neta-bcpls/model-fits/smap_prot_boot_degree.rds")

###########################
#spacemap rna
rna_smap <- readRDS(file = "~/scratch-data/cptac/rep/spacemap_rna_boot_vote_matched_sdfilter.rds")
rna_smap$bv$ParCor <- Matrix(data = (rna_smap$bv$ParCor) + 0, sparse = TRUE)
rna_smap$bv$Gamma <- Matrix(data = (rna_smap$bv$Gamma) + 0, sparse = TRUE)
saveRDS(object = rna_smap$bv, file = "~/repos/neta-bcpls/model-fits/smap_rna_boot_vote.rds")

#degree size
rnabdeg <- readRDS(file = "~/scratch-data/cptac/rep/spacemap_rna_bdeg_matched_sdfilter.rds")
xbdeg <- rnabdeg$xbdeg
ybdeg <- rnabdeg$ybdeg
cnaset <- readRDS(file = "~/repos/neta-bcpls/data/cna-expression-set.rds")
colnames(xbdeg) <- featureNames(cnaset)
rnaset <- readRDS(file = "~/repos/neta-bcpls/data/rna-expression-set.rds")
colnames(ybdeg) <- featureNames(rnaset)
#remove non-convergent replicate
xbdeg <- xbdeg[-41,]
ybdeg <- ybdeg[-41,]
rnabdeg$xbdeg <- Matrix(xbdeg)
rnabdeg$ybdeg <- Matrix(ybdeg)
saveRDS(object = rnabdeg, file = "~/repos/neta-bcpls/model-fits/smap_rna_boot_degree.rds")

###########################
#scggm
bvscggm7 <- readRDS(file = "~/scratch-data/cptac/rep/scggm/cptacprot77/scggm_boot_vote_7.rds")
bvscggm7$xy <- Matrix(bvscggm7$xy)
bvscggm7$yy <- Matrix(bvscggm7$yy)
colnames(bvscggm7$deg_xy) <- featureNames(cnaset)
colnames(bvscggm7$deg_yy) <- featureNames(protset)
bvscggm7$deg_xy <- Matrix(bvscggm7$deg_xy)
bvscggm7$deg_yy <- Matrix(bvscggm7$deg_yy)
saveRDS(object = bvscggm7, file = "~/repos/neta-bcpls/model-fits/scggm_boot.rds")