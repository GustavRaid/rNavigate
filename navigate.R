## this R function provides an easier way to move through the 
## folder structure in when using R
## by Adam Reiner (fee and open for any use)
nav <- function(n=NULL) {
  fetch <- function(k=NULL) {
    k <- readline(prompt="Enter Navigate Command or ? for help: ")
    if(k=="?"|k=="d"|k=="f"|k=="q"){k
    } else {k<-as.numeric(k)
    }
  }
  w<-1
  while (w == 1) {
    z <- getwd()
    if(is.null(n)){n<-fetch()}
    if(n=="?"){
      print("'0'=up a level, number= enter a folder,'f'=show files,'d'=show directory, 'q'=quit" )
    } else {
      if(n=="f"){y <- list.files(recursive = FALSE);print(c(y))}
      if(n=="d"){x <- list.dirs(recursive = FALSE);print(c(x))}
      if(is.numeric(n)){
        if(n==0){setwd("..");u<-getwd(); print(paste("Moving Up to ",u))
        } else {x<-list.dirs(recursive = FALSE);setwd(x[n]);u<-getwd(); 
        print(paste("Moving Down to ",u))}
        u<-z
      }
    }  
    if(n=="q"){w<-0} else {
    if(n!="?" & n!="d" & n!="f"){x<-list.dirs(recursive = FALSE); print(x)}
    n<-fetch()
    }
   }
}