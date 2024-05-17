library(tidyverse)
dir(recursive = T,pattern = "Sports") -> filename
filename |>
  readxl::excel_sheets() |>
  sapply(\(x){readxl:: read_excel(filename,sheet=x)}) -> L
L[[1]]
L$Coaches
L$Players$FirstName

# A
L$Players %>%
  inner_join(L$Teams,by=c("TeamID"="TeamID")) %>%
  select(Nickname) %>%
  group_by(Nickname) %>%
  summarise(n()) # ali count(n())
L$Players %>%
  inner_join(L$Teams,by=c("TeamID"="TeamID")) %>%
  select(contains("stName"),Colors) %>%
  filter(grepl("[Bb]lue",Colors))

#B1
L$Teams %>%
  inner_join(L$Games,by=c("TeamID"="HomeTeamID")) %>%
  inner_join(L$Teams,by=c("VisitTeamID"="TeamID")) %>%
  select(Domaci=Nickname.x,Gosti=Nickname.y,DatePlayed) %>%
  filter(as.character(DatePlayed)=="2005-09-12") -> B1
#B2
B1 %>%
  pivot_longer(1:2,names_to="Ekipa",values_to="Ime")
B1 %>%
  gather("Ekipa","Ime",1:2)

#C1
L$Teams %>%
  inner_join(L$Games,by=c("TeamID"="HomeTeamID")) %>%
  inner_join(L$Teams,by=c("VisitTeamID"="TeamID")) %>%
  select(Domaci=Nickname.x,Gosti=Nickname.y,DatePlayed) %>%
  pivot_wider(names_from=Gosti,values_from=DatePlayed) -> C1
  
  # urejanje tabel
C1 %>%
  arrange(Domaci) %>%
  rename('_Domaci'=Domaci) %>%
  .[,order(colnames(.))]
C1 %>%
  arrange(Domaci) %>%
  as.data.frame() %>%
  {rownames(.)<-.$Domaci;.[,-1]} %>%
  .[,order(colnames(.))] %>%
  rownames_to_column()
C1 %>%
  arrange(Domaci) %>%
  .[,c(1,order(colnames(.)[-1])+1)]

L$Teams %>%
  inner_join(L$Games,by=c("TeamID"="HomeTeamID")) %>%
  inner_join(L$Teams,by=c("VisitTeamID"="TeamID")) %>%
  select(Domaci=Nickname.x,Gosti=Nickname.y,DatePlayed) %>%
  spread(Gosti,DatePlayed)
L$Teams %>%
  inner_join(L$Games,by=c("TeamID"="HomeTeamID")) %>%
  inner_join(L$Teams,by=c("VisitTeamID"="TeamID")) %>%
  select(Domaci=Nickname.x,Gosti=Nickname.y,DatePlayed) -> C1.1
C1.1 %>%
  rename(Gosti=Domaci,Domaci=Gosti) %>%
  rbind(C1.1) %>%
  spread(Gosti,DatePlayed) %>%
  view()

#C2
customFun <- function(x,y) {
  case_when(
    x>y~3,
    x==y~1,
    T~0
  )
}
customFun(1:5,5:1)

#D2
L$Teams %>%
  inner_join(L$Games,by=c("TeamID"="HomeTeamID")) %>%
  inner_join(L$Teams,by=c("VisitTeamID"="TeamID")) %>%
  select(Domaci=Nickname.x,Gosti=Nickname.y,contains("score")) %>%
  rowwise() %>% # če customFun ne bi delala vektorsko
  mutate(DomTocke=customFun(HomeScore,VisitScore),GosTocke=customFun(VisitScore,HomeScore)) %>%
  .[,-3:-4] %>%
  {data.frame(Ekipa=c(.$Domaci,.$Gosti),Tocke=c(.$DomTocke,.$GosTocke))} %>%
  group_by(Ekipa) %>% 
  summarise(SkupajTocke=sum(Tocke)) %>%
  arrange(desc(SkupajTocke))

#D1
L$Coaches %>%
  inner_join(L$Games,by=c("TeamID"="HomeTeamID"),relationship = "many-to-many") %>%
  group_by(CoachID,FirstName,LastName) %>%
  summarise('StDomacihTekem'=n()) # count()
L$Coaches %>%
  left_join(L$Games,by=c("TeamID"="HomeTeamID"),relationship = "many-to-many") %>%
  select(2,3,10,11) %>%
  group_by(FirstName,LastName) %>%
  summarise(StTekemDoma=sum(!is.na(TeamID)))







