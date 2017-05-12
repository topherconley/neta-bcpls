s03 <- new.env()
load(envir = s03, file = "~/scratch-data/cptac/tuning/cptac_vt80_prot_spacemap=02_tol=1e-04_ridge=0p1.RData")
eps.05 <- 0.05
eps.10 <- 0.1
lam1 <- s03$cvSpmap$tuneGrid$slasso
lam2 <- s03$cvSpmap$tuneGrid$rlasso
lam3 <- s03$cvSpmap$tuneGrid$rgroup
tuneSpmap <- expand.grid(lam1 = exp(seq(log(lam1*(1 - eps.05)), log(lam1*(1 + eps.05)), length = 10)),
                         lam2 = sqrt(seq((lam2*(1 - eps.10))^2, (lam2*(1 + eps.10))^2, length = 15)),
                         lam3 = sqrt(seq((lam3*(1 - eps.10))^2, (lam3*(1 + eps.10))^2, length = 15)))
saveRDS(object = tuneSpmap, file = "data/prot_last_tune_grid.rds")

#best 
load(file = "~/scratch-data/cptac/tuning/cptac_vt80_prot_spacemap=02_tol=1e-04_ridge=0p1.RData")
tune <- cvSpmap$tuneGrid
names(tune) <- c("lam1", "lam2", "lam3")
saveRDS(object = tune, file = "data/best_prot_tune_params.rds")