sqrt("a")
tryCatch(sqrt("a"), error=function(e) print("You can't take the square root of a character!"))
sqrt(c(4, 9, "Covid19"))
tryCatch(sqrt(c(4, 9, "Covid19")), error=function(e) NA)
sapply(c(4, 9, "Covid19"), function(x) tryCatch(sqrt(x), error=function(e) NA))
sapply(c(4, 9, "Covid19"), function(x) tryCatch(sqrt(as.numeric(x)), error=function(e) NA))
for (x in c(4, 9, "Covid19",16)){
  
  tryCatch(print(sqrt(as.numeric(x))), error=function(e) NA)
}
divide<-function(x,y) {
  if (y!=0){
    print(x/y)
  } else {print("Cannot divide by zero!")}
}

divide_e<-function(x,y){
  tryCatch(
    if (y!=0) {
      print(x/y)
    } else {error},
    error=function(e) print("Error"))
}

divide_e(4,2)
divide_e(4,0)

try("2"/3, silent = T)
try("2"/3, silent = F)


library(tidyverse)
# %>% ali |> pipe line



dplyr::select(mtcars,mpg,cyl,wt)
mtcars |> dplyr::select(mpg,cyl,wt) # ekvivalentno zgornjemu
mtcars |> dplyr::select(mpg,cyl,wt) |> head()
mtcars |> dplyr::select(starts_with("h"),mpg,cyl,wt) |> head()
mtcars |> dplyr::select(mpg:hp,gear) |> head()
mtcars |> dplyr::select(-drat) |> head()
mtcars |> dplyr::select(-c(drat,hp),mpg) |> head()
mtcars |> dplyr::select(ends_with("p"),contains("se")) |> head()


df1<-iris%>%select_if(is.factor)
head(df1,2)

df1<-iris%>%select(where(is.factor))
head(df1,2)

library(janitor)
iris |> clean_names() |> dplyr::select_if(is.numeric) |> head() # clean_names() iz janitor, vsa imena počisti da so vsa enakega formata
airquality |> clean_names() |> head()

df<-iris |> clean_names() |> dplyr::select(where(is.numeric))
df |> head()

rownames(mtcars)<-str_replace_all(tolower(rownames(mtcars))," ","_")

df1<-iris%>%select(where(is.factor))
head(df1,2)


interested_cols <- c("mpg", "test","hp", "wt")

# Select columns that are numeric and whose names are in interested_cols
result <- mtcars %>%
  select(
    where(is.numeric) & any_of(interested_cols)
  )

result

result <- mtcars %>%
  select(
    where(is.numeric) & all_of(interested_cols)
  )

result