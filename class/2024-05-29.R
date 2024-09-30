library(tidyverse)

isPalindrom <- function(beseda) {
  elementi<-strsplit(beseda,split="") |>
    list_c()
  rev_el<-paste(rev(elementi),collapse="")
  return(beseda==rev_el)
}

isPalindrom("civic")
isPalindrom("ponedeljek")


summary(mtcars)

library(psych)

describe(mtcars)

library(gt)
library(knitr) 

describe(mtcars) |>
  gt()

statistika<-describe(mtcars)
statistika |>
  mutate(spremenljivka=row.names(statistika)) |>
  relocate(spremenljivka,.before="n") |>
  kable()


library(gtExtras)
statistika |>
  mutate(spremenljivka=row.names(statistika)) |>
  relocate(spremenljivka,.before="n") |>
  gt() |>
  gt_theme_dot_matrix()


library(dataMaid)
makeDataReport(mtcars,
               output="html",
               file="report.html")

library(arrow)
library(skimr)

skim(mtcars)
