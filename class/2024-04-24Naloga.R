library(tidyverse)

# način 1:

fieldingCSV1<-read.csv("podatki/FieldingOF.csv") |>
  dplyr::filter(between(yearID,1940,1950)) |>
  summarise(stevilo_tekem=sum(Gcf),
            .by=c("playerID","yearID")) |>
  group_by(yearID) |>
  mutate(vrstni_red=dense_rank(-stevilo_tekem)) |>
  dplyr::filter(vrstni_red==2)
fieldingCSV1 |>
  as_tibble() |>
  arrange(yearID) |>
  head()

peopleCsv1<-read.csv("podatki/People.csv") |>
  dplyr::select(playerID,nameFirst,nameLast) |>
  inner_join(fieldingCSV,
             join_by(playerID==playerID)) |>
  arrange(yearID)

# način 2:

fieldingCSV2<-read.csv("podatki/FieldingOF.csv") |>
  dplyr::filter(between(yearID,1940,1950)) |>
  summarise(stevilo_tekem=sum(Gcf),
            .by=c("playerID","yearID")) |>
  group_by(yearID) |>
  slice_max(n=2,order_by=stevilo_tekem) |>
  slice_min(order_by=stevilo_tekem)

peopleCsv2<-read.csv("podatki/People.csv") |>
  dplyr::select(playerID,nameFirst,nameLast) |>
  inner_join(fieldingCSV,
             join_by(playerID==playerID)) |>
  arrange(yearID)
