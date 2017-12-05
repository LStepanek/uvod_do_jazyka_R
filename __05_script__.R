###############################################################################
###############################################################################
###############################################################################

## instaluji a loaduji balíèky ------------------------------------------------

invisible(
    lapply(
        c(
            "openxlsx",
            "xtable"
        ),
        function(package){
            
            if(!(package %in% rownames(installed.packages()))){
                
                install.packages(
                    package,
                    dependencies = TRUE,
                    repos = "http://cran.us.r-project.org"
                )
                
            }
            
            library(package, character.only = TRUE)
            
        }
    )
)


## ----------------------------------------------------------------------------

###############################################################################

## nastavuji pracovní složku --------------------------------------------------

while(!"script.R" %in% dir()){
    setwd(choose.dir())
}

mother_working_directory <- getwd()


## ----------------------------------------------------------------------------

###############################################################################

## vytváøím posložky pracovní složky ------------------------------------------

setwd(mother_working_directory)

for(my_subdirectory in c("figures")){
    
    if(!file.exists(my_subdirectory)){
        
        dir.create(file.path(
            
            mother_working_directory, my_subdirectory
            
        ))
        
    }
    
}


## ----------------------------------------------------------------------------

###############################################################################

## ukládám obrázky ------------------------------------------------------------

setwd(paste(mother_working_directory, "figures", sep = "/"))

cairo_ps(
    file = "f_x_normal_distribution.eps",
    width = 5,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 2.1, 2.1))

plot(
    x = seq(-4, 4, by = 0.001),
    y = dnorm(seq(-4, 4, by = 0.001)),
    type = "l",
    xlab = expression(italic(x)),
    ylab = expression(paste(italic(f[X]), "(", italic(x), ")", sep = ""))
)

dev.off()


cairo_ps(
    file = "dist_F_x_normal_distribution.eps",
    width = 5,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 2.1, 2.1))

plot(
    x = seq(-4, 4, by = 0.001),
    y = pnorm(seq(-4, 4, by = 0.001)),
    type = "l",
    xlab = expression(italic(x)),
    ylab = expression(paste(italic(F[X]), "(", italic(x), ")", sep = ""))
)

dev.off()


## Poisson --------------------------------------------------------------------

cairo_ps(
    file = "f_x_poisson_distribution.eps",
    width = 5,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 2.1, 2.1))

plot(
    x = seq(0, 10, by = 1),
    y = dpois(seq(0, 10, by = 1), lambda = 3),
    type = "b",
    xlab = expression(italic(k)),
    ylab = expression(paste(italic(f[X]), "(", italic(k), ")", sep = ""))
)

dev.off()


cairo_ps(
    file = "dist_F_x_poisson_distribution.eps",
    width = 5,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 2.1, 2.1))

plot(
    x = seq(0, 10, by = 1),
    y = ppois(seq(0, 10, by = 1), lambda = 3),
    type = "b",
    xlab = expression(italic(k)),
    ylab = expression(paste(italic(F[X]), "(", italic(k), ")", sep = ""))
)

dev.off()


## Anscombe -------------------------------------------------------------------

cairo_ps(
    file = "anscombe.eps",
    width = 8,
    height = 8,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 2.1, 2.1))

pairs(anscombe, panel = panel.smooth)

dev.off()


## x_vs_y ---------------------------------------------------------------------

cairo_ps(
    file = "x_vs_y.eps",
    width = 5,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 0.1, 0.1))

boxplot(
    cbind(x, y),
    col = "lightgrey",
    xlab = "promìnná"
)

dev.off()


## muži vs. ženy --------------------------------------------------------------

cairo_ps(
    file = "muzi_vs_zeny.eps",
    width = 5,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 0.1, 0.1))

set.seed(1) 
muzi <- rnorm(30, 180, 10)
zeny <- rnorm(30, 165, 10)

boxplot(
    cbind(
        ženy = zeny,
        muži = muzi
    ),
    col = "lightgrey",
    xlab = "pohlaví",
    ylab = "výška [cm]"
)

dev.off()


## pacienti pøed a po ---------------------------------------------------------

cairo_ps(
    file = "pacienti_pred_vs_po.eps",
    width = 5,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 0.1, 0.1))

set.seed(1) 
pacienti_pred <- rnorm(50, 160, 15)
pacienti_po <- rnorm(50, 140, 15)

boxplot(
    cbind(
        "pøed terapií" = pacienti_pred,
        "po terapii" = pacienti_po
    ),
    col = "lightgrey",
    xlab = "pacienti",
    ylab = "sTK [mm Hg]"
)

dev.off()


## wilcoxon -------------------------------------------------------------------

cairo_ps(
    file = "muzi_zeny_wilcoxon.eps",
    width = 5,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 0.1, 0.1))

set.seed(1) 
muzi <- exp(rnorm(30, 2.5, 1))
zeny <- exp(rnorm(30, 1.5, 1))

boxplot(
    cbind(
        ženy = zeny,
        muži = muzi
    ),
    col = "lightgrey",
    xlab = "pohlaví"
)

dev.off()


## pacienti pøed a po podle Wilcoxona -----------------------------------------

cairo_ps(
    file = "pacienti_pred_vs_po_wilcoxon.eps",
    width = 5,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 0.1, 0.1))

set.seed(1)
pacienti_pred<- exp(rnorm(30, 2.5, 1))
pacienti_po <- exp(rnorm(30, 1.5, 1))

boxplot(
    cbind(
        "pøed terapií" = pacienti_pred,
        "po terapii" = pacienti_po
    ),
    col = "lightgrey",
    xlab = "pacienti"
)

dev.off()


## kruskal-wallis -------------------------------------------------------------

cairo_ps(
    file = "kruskal_wallis.eps",
    width = 7,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 0.1, 0.1))

set.seed(1) 
lek_A <- exp(rnorm(30, 2.5, 1))
lek_B <- exp(rnorm(30, 2.0, 1))
lek_C <- exp(rnorm(30, 1.5, 1))

my_data <- data.frame(
  "mira" = c(lek_A, lek_B, lek_C),
  "lek" = c(rep("A", 30), rep("B", 30),
            rep("C", 30))
)

boxplot(
    mira ~ lek, my_data,
    col = "lightgrey",
    xlab = "lék"
)

dev.off()


## friedman -------------------------------------------------------------------

cairo_ps(
    file = "friedman.eps",
    width = 7,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 0.1, 0.1))

set.seed(2) 
cas_1 <- exp(rnorm(30, 2.5, 1))
cas_2 <- exp(rnorm(30, 2.0, 1))
cas_3 <- exp(rnorm(30, 1.5, 1))

my_data <- data.frame(
  "mira" = c(cas_1, cas_2, cas_3),
  "kontrola" = c(rep("1", 30), rep("2", 30),
                 rep("3", 30))
)

boxplot(
    mira ~ kontrola, my_data,
    col = "lightgrey",
    xlab = "kontrola"
)

dev.off()


## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################





