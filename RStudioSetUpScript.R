# Modified script that installs all packages we used in class and practice

#Remove all packages that do not come with R
# create a list of all installed packages
ip <- as.data.frame(installed.packages())
head(ip)
# if you use MRO, make sure that no packages in this library will be removed
ip <- subset(ip, !grepl("MRO", ip$LibPath))
# we don't want to remove base or recommended packages either\
ip <- ip[!(ip[,"Priority"] %in% c("base", "recommended")),]
# determine the library where the packages are installed
path.lib <- unique(ip$LibPath)
# create a vector with all the names of the packages you want to remove
pkgs.to.remove <- ip[,1]
head(pkgs.to.remove)
# remove the packages
sapply(pkgs.to.remove, remove.packages, lib = path.lib)


# Install new packages
# restart if needed
installandload<-function(
    normalpackages=c("rlang","tidyverse","readxl","writexl","lubridate","esquisse","miniUI","markdown","shiny","DT","gt","knitr","citation","janeaustenr","tidytext","psych","gtExtras","dataMaid","arrow","skimr","janitor","gtsummary","lattice","ggthemes","extrafont","ggrepel","patchwork","gganimate","gifski","gapminder","stringr","lavaan")){
  new.packages <- normalpackages[!(normalpackages %in% installed.packages()[,"Package"])]
  if(length(new.packages)>0) {install.packages(new.packages,dependencies =T,quiet = F)}
  invisible(lapply(normalpackages,function(x){
    require(x,character.only=T,quietly=T)}))
  nay<-normalpackages[!(normalpackages %in% loadedNamespaces())]
  if (length(nay)==0){
    message("All packages were succefully installed and loaded:")
    print(normalpackages[normalpackages %in% loadedNamespaces()])
  }
  else{
    message("the following packages succefully are installed and loaded:")
    print(normalpackages[normalpackages %in% loadedNamespaces()])
    message("The following packages failed:")
    print(nay) 
  }
}
installandload()
