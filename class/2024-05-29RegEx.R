library(janeaustenr)

knjige<-austen_books()
knjige

unique(knjige$book)
knjige |>
  dplyr::select(book) |>
  distinct()
knjige |>
  dplyr::select(book) |>
  distinct() |>
  unlist()
knjige |>
  dplyr::select(book) |>
  distinct() |>
  as.vector()

str_extract_all(knjige$text,"\\d+") |>
  list_c() |>
  as.numeric() |>
  sum()
str_count(knjige$text,"Jane") |>
  sum()

knjige<-knjige |>
  mutate(text=tolower(text))
str_count(knjige$text,"darcy") |>
  sum()

library(tidytext)
besede<-str_split(knjige$text,pattern="\\W") |>
  list_c()
length(besede[nchar(besede)>0])
df<-besede[nchar(besede)>0] |>
  tolower() |>
  as.data.frame()
colnames(df)<-"beseda"
df |>
  dplyr::filter(nchar(beseda)>3) |>
  count(beseda,sort=T) |>
  head(20)
