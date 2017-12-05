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
    file = "mpg_vs_cyl.eps",
    width = 7,
    height = 5,
    pointsize = 12
)

boxplot(
    mpg ~ cyl, mtcars,
    col = "lightgrey",
    xlab = "poèet cylindrù",
    ylab = "mílí na galon"
)

dev.off()


## histogram ------------------------------------------------------------------

cairo_ps(
    file = "histogram.eps",
    width = 7,
    height = 5,
    pointsize = 12
)
 
set.seed(1)
x <- rnorm(1000)

hist(
    x,
    col = "lightgrey",
    xlim = c(-4, 4),
    main = "",
    ylab = "absolutní èetnost",
    xlab = expression(italic(x))
)

dev.off()


## scatter plot ---------------------------------------------------------------

cairo_ps(
    file = "brain_vs_body.eps",
    width = 5,
    height = 5,
    pointsize = 12
)

par(mar = c(4.1, 4.1, 0.1, 0.1))

set.seed(1)

plot(
    log(brain) ~ log(body),
	Animals,
	xlab = "log(hmotnost tìla [kg])",
	ylab = "log(hmotnost mozku [g])"
)

abline(
    lm(log(brain) ~ log(body), Animals),
	col = "red"
)

dev.off()


## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################





