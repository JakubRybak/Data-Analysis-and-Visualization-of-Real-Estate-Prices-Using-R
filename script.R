df <- read.csv("house_data.csv")

library(dplyr)
library(ggplot2)
library(scales)
library(viridis)


#Zadanie1
pom1 <- df %>% 
  group_by(zipcode) %>% 
  summarize(ile_posiadlosci = n()) %>% 
  filter(ile_posiadlosci > 280) 

df_1 <- df %>% 
  inner_join(pom1)%>% 
  rename(date_date = date) %>% 
  mutate(rok = substr(date_date,1,4))

wykres_1 <- df_1 %>% 
  ggplot(aes(x = as.factor(zipcode), y = price)) + 
  geom_boxplot(fill = "#6A5ACD") + 
  facet_wrap(~ rok) +  scale_x_discrete(guide = guide_axis(n.dodge = 5), name = "zipcode") + scale_y_log10()+ labs(title = "Rozkład ceny nieruchomości w poszczególnych kodach pocztowych na przestrzeni lat")
wykres_1
#nie ma wyraźnej zaleznosci, wyniki nie nasuwaja zadnego wniosku
#Zadanie 2
pom2_1 <- df %>% 
  filter(sqft_basement == 0) %>% 
  ggplot(aes(x = sqft_living, y = price)) +
  geom_point()

wykres_2 <- df %>% 
  mutate(czy_jest_piwnica = case_when(
    sqft_basement == 0 ~ "bez piwnicy",
    T ~ "z piwnica"
  )) %>% 
  ggplot(aes(x = sqft_living, y = price, color = czy_jest_piwnica)) +
  geom_point() + labs(title = "różnica w rozkładzie ceny nierchomości od powierzchni mieszkalnej uwzględniając podział na nieruchomości z piwnicą i bez")
wykres_2 
#rozklady cen nieruchomosci od powierzchni mieszkalnej są podobne dla nieruochomsci z piwnicą i bez; im wieksza powierzchnia tym wieksza cena; rozklad jest podobny
#Zadanie 3
wykres_3 <- df %>% 
  ggplot(aes(x= as.factor(floors), y = grade)) + 
  geom_violin(fill = "#20B2AA") + scale_x_discrete(name="floors") + labs(title = "Zależność pomiędzy jakością wykończenia nieruchomości a liczbą pięter")
wykres_3
#istnieje mało-wyrazna zaleznosc; im wiecej pieter tym lepsza jakosc.
#Zadanie 4

kwantyle <- quantile(df$sqft_lot, probs = c(0, 0.4, 0.99, 1))
wykres_4 <- df %>% 
  ggplot(aes(x = sqft_lot, y = sqft_living, color = sqft_lot)) + scale_color_gradientn(colors = viridis(100), values = rescale(kwantyle)) + scale_x_log10(guide = guide_axis(n.dodge = 2)) + facet_wrap(~bedrooms) + scale_y_log10() + geom_point() + labs(title="Zależność między powierzchnią mieszkalną nieruchomości a powierzchnią gruntu w podziale na liczbę sypialni") 
wykres_4
#nie ma wyraznj zaleznosci; liczba sypialni nie ma widocznego wplywu na wykres
#Zadanie 5
wykres_5_1 <- df %>% 
  filter(yr_renovated != 0) %>% 
  mutate(dekada_remontu = paste0(substr(yr_renovated, 1, 3),"0")) %>% 
  ggplot(aes(x = as.factor(dekada_remontu))) +
  geom_bar() + labs(title="liczba remontow w kazdej dekadzie") + scale_x_discrete(name="dekada")
wykres_5_2 <- df %>% 
  filter(yr_renovated != 0) %>% 
  mutate(dekada_remontu = paste0(substr(yr_renovated, 1, 3),"0")) %>% 
  group_by(dekada_remontu, grade) %>% 
  summarise(liczba = n(),.groups = 'drop') %>% 
  group_by(dekada_remontu) %>% 
  mutate(procent = liczba/sum(liczba)) %>% 
  ungroup() %>% 
  ggplot(aes(x = grade, y = procent, fill = grade)) + labs(title="procent nieruchmości dla każdej wartości miary jakości i wykończenia nieruchomości w poszczegolnych dekadach") + geom_bar(stat = "identity", position = "dodge") + facet_wrap(~ dekada_remontu)
wykres_5_2
#w dekadzie 2000-2010 bylo najwiecej remontow; srednio najwiecej nieruchomosci bylo dla jakosci od 6 do 8; dla wartosci skrajnych jest malo nieruchodmosci
#Zadanie 6
library(tidyr)
wykres_6 <- df %>% 
  group_by(yr_built) %>% 
  summarise(minimum = min(price), maksimum = max(price), mediana = median(price)) %>% 
  pivot_longer(cols = c(mediana, maksimum, minimum), names_to = "statystyka", values_to = "wartosc") %>% 
  ggplot(aes(x = yr_built, y = wartosc, color = statystyka)) + labs(title="Minimalna, średnia i maksymalna ceny nieruchmości w podziele na rok budowy nieruchomości") + geom_point() + scale_y_log10()
wykres_6
#mediana, minimum i maksimum jest podobne na przestrzeni lat; minimum i maksimum ceny od 1980 wyraznie wzrasta
