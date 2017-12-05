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
        function(my_package){
            
            if(!(my_package %in% rownames(installed.packages()))){
                
                install.packages(
                    package,
                    dependencies = TRUE,
                    repos = "http://cran.us.r-project.org"
                )
                
            }
            
            library(my_package, character.only = TRUE)
            
        }
    )
)


## ----------------------------------------------------------------------------

###############################################################################

## nastavuji pracovní složku --------------------------------------------------

while(!"__script__.R" %in% dir()){
    setwd(choose.dir())
}

mother_working_directory <- getwd()


## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################

## Úvod, význam a výhody jazyka R, instalace a motivace, proè se ho uèit ------

print("hello world")

help(print)    ## nápovìda k funkci print()

?print

??print 

install.packages(
    "swirl",
    dependencies = TRUE,
    repos = "http://cran.us.r-project.org"
)


## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################

## Pøehled datových typù a struktur, jednoduché operace -----------------------

## numerická hodnota ----------------------------------------------------------

is.numeric(-13.8)   # TRUE
class(-13.8)        # "numeric"
class(Inf)          # "numeric"


## celé èíslo -----------------------------------------------------------------

is.integer(-13L)   # TRUE
class(-13L)        # "integer"
is.integer(-13)    # FALSE
class(-13)         # "numeric"      


## komplexní èíslo ------------------------------------------------------------

is.complex(1 + 2i)   # TRUE
class(0 + 1i)        # "complex"
class(sqrt(-1 + 0i)) # "complex"
class(sqrt(-1))      # Warning message:
                     # NaNs produced
                     

## logická hodnota ------------------------------------------------------------

is.logical(TRUE)     # TRUE
class(FALSE)         # "logical"
class("TRUE")        # "character"
class(T)             # "logical"
class(F)             # "logical"


## textový øetìzec ------------------------------------------------------------

is.character("ahoj")  # TRUE
class("bla bla")      # "character"
class("123")          # "character"
class(123)            # "numeric"
is.numeric(Inf)       # TRUE
is.numeric("Inf")     # FALSE

as.character(123)


## NA, NaN, NULL --------------------------------------------------------------

log(-1)          # NaN
is.na(NaN)       # TRUE
is.nan(NA)       # FALSE
is.nan(1 / 0)    # FALSE
1 / 0            # Inf


## atributy objektu -----------------------------------------------------------

class("ahoj")    # "character"
class(NaN)       # "numeric"
class(NA)        # "logical"
class(class(NA)) # "character"
length("123")    # 1
length(123)      # 1
length(NaN)      # 1
length(NA)       # 1


## pøøazení hodnoty k promìnné ------------------------------------------------

x = 5

x <- 5
5 -> x          # totéž
assign("x", 5)  # analogické k x <- 5 èi x = 5


## intermezzo -- zkusme apriornì (bez ovìøení v R) vyslovit,
## o jaké datové typy jde v následujících pøípadech ---------------------------

1.8
is.logical(is.numeric(-5000))
sqrt(4)           # sqrt() je druhá odmocnina
sqrt(4L)
TRUE
"FALSE"
asin(2)           # asin() je arcus sinus
1 / Inf
-2 / INF
class(TRUE)
class(class(is.complex(1 + 1i)))
"357L"
as.integer("357L")
as.integer("357")
length(12)


## ----------------------------------------------------------------------------

###############################################################################

## vektory --------------------------------------------------------------------

c()          # prázdný vektor
length(c())  # 0
c(3, 1, 2)   # vektor o délce 3 a prvcích 3, 1, 2
c("a", "d")  # vektor o dél. 2 a prvcích "a", "d"

c(c(3, 1, 2), 4) # vektor o prvcích 3, 1, 2, 4
c(3, 1, 2, 4)    # zkrácenì totéž



x <- c(3, 1, 2)
length(x)       # 3
y <- 1
z <- c(2)
w <- c(5, 7)
x <- c(x, y)    # prodloužení vektoru x
                # o hodnotu y
w <- c(w, z)    # prodloužení vektoru w
                # o vektor z
                # jednoprvkový vektor je
               # skalárem, jednou hodnotou
c <- c(1, 2, 3)
c               # vektor o prvcích 1, 2, 3
                # by je c referovaný termín,
                # funkce c je zachována
                # a vznikl vektor c


## 

x <- c(3, 1, 2)
y <- c("a", "b", "c")
names(x) <- y    # pojmenuje prvky
                 # vektoru x
x
unname(x)        # zbaví prvky vektoru
                 # x jeho jejich jmen
setNames(x, y)   # opìt pojmenuje
                 # prvky vektoru x          
 
##


x <- 1:10    # vektor o prvcích 1, 2, ..., 10
y <- 5:1     # vektor o prvcích 5, 4, ..., 1
z <- seq(from = 2, to = 10, by = 2)
             # vektor o prvcích 2, 4, 6, 8, 10
w <- seq(2, 10, 2)
             # totéž             
             
             
## subkvektory

x <- c(4, 2, 6, -3)
x[1]            # 4
x[1:2]          # c(4, 2)
x[5]            # NA
x[length(x)]    # -3
x[c(1, 3, 4)]   # c(4, 6, -3)
x[length(x):1]  # c(-3, 6, 2, 4)
rev(x)          # totéž, c(-3, 6, 2, 4)

y <- c(TRUE, TRUE, FALSE, TRUE) # logický
                                # vektor
x <- c(3, 1, 2, 5)
x[y]                 # (sub)vektor c(3, 1)
x[c(F, T, F, T)]     # subvektor c(1, 5)


z <- c("R", "G", "E", "F", "I")
z[c(T, F)]    # vybere pouze hodnoty
              # na lichých pozicích,
              # tedy "R", "E", "I"
              # neboli vektor
              # c("R", "E", "I")


## vypišme z vektoru x každou tøetí a pátou hodnotu

x <- c(34, 65, 4, 0, 56, 23, 54, 17,
       4, 8, 5, 44, 84, -5, 4444, 49,
       37, 86, 45, 65, 36, 72, 54, 36,
       56, 74, 26, 88, 36, 76, 46,
       17, 84, 57, 25, -75, 634, 5578,
       -6, 46, 44, 743, 577, 466,
       645, 33, 64, 67)
       
       
## øešení
x[c(F, F, T, F, T)]
             # 4, 56, 17, 8, 84, 4444, 86, 65, 54,
             # 56, 88, 76, 84, 25, 5578, 46, 577,
             # 645, 67

##






## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################





