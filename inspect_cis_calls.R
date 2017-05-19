

##RNA: 17q12 and RND2 SHOULD NOT BE IN CIS 
library(Biobase)
yinfo <- pData(featureData(readRDS(file = "data/rna-expression-set.rds")))
xinfo <- pData(featureData(readRDS(file = "data/cna-expression-set.rds")))
s <- xinfo[xinfo$alias %in% "17q12",c("start")] - 2e6
e <- xinfo[xinfo$alias %in% "17q12",c("end")] + 2e6

cs <- yinfo[yinfo$alias %in% "RND2","start"] - 2e6
ce <- yinfo[yinfo$alias %in% "RND2","end"] + 2e6


yinfo[yinfo$alias %in% "RND2","id"]
any(ce > s & cs < s)
any(cs > s & ce < e)
any(cs < e & ce > e)

xinfo[xinfo$alias %in% "17q12",c("id", "alias")]


#check previous annotation
tmp <- pData(featureData(readRDS("~/../Downloads/rna-expression-set.rds")))
tmp[tmp$symbol %in% "RND2",]
yinfo[yinfo$alias %in% "RND2",]

#evaluate previous code in debugger and compare potcis2 to potcis
preggc <- allYNodesGC
pactgc <- fromgc
GenomicRanges::findOverlaps(query = gr[fromgc[17],], subject = gr[allYNodesGC,], ignore.strand = TRUE)
GenomicRanges::findOverlaps(query = gr["5_89203610_90774367_0",], subject = gr[allYNodesGC,], ignore.strand = TRUE)
gr[fromgc[17],]
gr[allYNodesGC[89],]
pregquery <- GenomicRanges::findOverlaps(query = gr[preggc,], subject = gr[pactgc,], ignore.strand = TRUE)
#pactquery <- GenomicRanges::findOverlaps(query = gr[pactgc,], subject = gr[preggc,], ignore.strand = TRUE)
pactgctab <- table(pactgc[pregquery@to])
pact <- unique(de$from[de$from %in% names(gr)])
potcis2 <- vector(mode = "numeric", length = length(pact))
names(potcis2) <- pact
potcis2[match(names(pactgctab), names(potcis2))] <- pactgctab
potcis2



##SCGGM: 17q21.32 (selected by scggm, not spacemap) and LRRC59 SHOULD NOT IN CIS
library(Biobase)
yinfo <- pData(featureData(readRDS(file = "data/prot-expression-set.rds")))
xinfo <- pData(featureData(readRDS(file = "data/cna-expression-set.rds")))

s <- xinfo[xinfo$alias %in% "17q21.32",c("start")] - 2e6
e <- xinfo[xinfo$alias %in% "17q21.32",c("end")] + 2e6

cs <- yinfo[yinfo$alias %in% "LRRC59","start"] - 2e6
ce <- yinfo[yinfo$alias %in% "LRRC59","end"] + 2e6

yinfo[yinfo$alias %in% "LRRC59","id"]
any(ce > s & cs < s)
any(cs > s & ce < e)
any(cs < e & ce > e)

xinfo[xinfo$alias %in% "17q21.32",c("id", "alias")][which(cs < e & ce > e),]
