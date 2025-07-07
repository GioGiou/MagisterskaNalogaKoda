library(tidyverse)
library(scales)
library(svglite)
data<- read.csv("rezNovPc.csv")
dataSLO<- read.csv("rezNovPcNaKlancu.csv")
dataTidy <- data %>%  pivot_longer(col=starts_with("tFind"),names_to = "PatternLength", values_to = "TimeFind")
dataTidySLO <- dataSLO %>% pivot_longer(col=starts_with("tFind"),names_to = "PatternLength", values_to = "TimeFind") %>% mutate(Time=Time/1000000)

dataTidySLO  %>% filter(PatternLength=="tFindLog" & TimeFind<200000) %>% group_by(TypeOfDS) %>% summarise(M=(mean(TimeFind))) %>% print(n=100)
dataTidySLO %>% filter(TypeOfDS=="St",PatternLength=="tFindLog") %>% group_by(SizeRun,TypeOfDS) %>% summarise(M=mean(TimeFind)) -> a

lm(SizeInBytes~SizeRun, data = dataTidySLO)

a$M/lag(a$M,default = 1) #2x

dataTidySLO %>% filter(TypeOfDS=="CST",PatternLength=="tFindLog") %>% group_by(SizeRun,TypeOfDS) %>% summarise(M=mean(TimeFind)) -> a

a$M/lag(a$M,default = 1) #1x

 dataTidy %>% group_by(SizeRun,TypeOfDS) %>% summarise(M=(mean(Time))) %>% print(n=25)

#Poizvedbe
 
dataTidy %>%ggplot() +
  aes(x = SizeRun, y = TimeFind, colour = TypeOfDS) +
  geom_point() +
  stat_summary(fun=mean,geom = 'line')+
  scale_x_continuous(trans = "log2") +
  theme_minimal() +
  labs(y="Čas iskanja v priponskem drevesu [ns]",x="Dolžina besedila")+
  scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x))+
  scale_color_discrete(name = "Vrsta priponskega\ndrevesa", labels= c(CST="Kompaktno\npriponsko drevo", St="Priponsko drevo",SA="Priponsko polje","SA+LCP"="Priponsko polje z QLCP"))+
  facet_grid(scales = "free_y",vars(PatternLength),labeller = as_labeller(c(tFind5="Vzorec velikosti 5", tFind50="Vzorec velikosti 50", tFind500="Vzorec velikosti 500",tFindLog="Vzorec velikosti log(n)")))
ggsave("./Img/IskanjeNovPC.svg",bg = "white", height = 15, width = 25, units = "cm")

dataTidySLO %>%ggplot() +
  aes(x = SizeRun, y = TimeFind, colour = TypeOfDS) +
  geom_point() +
  stat_summary(fun=mean,geom = 'line')+
  scale_x_continuous(trans = "log2") +
  theme_minimal() +
  scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x))+
  labs(y="Čas iskanja v priponskem drevesu [ns]",x="Dolžina besedila")+
  scale_color_discrete(name = "Vrsta priponskega\ndrevesa", labels= c(CST="Kompaktno\npriponsko drevo", St="Priponsko drevo",SA="Priponsko polje","SA+LCP"="Priponsko polje z QLCP"))+
  facet_grid(scales = "free_y",vars(PatternLength),labeller = as_labeller(c(tFind5="Vzorec velikosti 5", tFind50="Vzorec velikosti 50", tFind500="Vzorec velikosti 500",tFindLog="Vzorec velikosti log(n)")))
ggsave("./Img/IskanjeNovPCSLO.svg",bg = "white", height = 15, width = 25, units = "cm")



#Izgradnja drevesa
dataTidy%>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  stat_summary(fun=mean,geom = 'line')+
  theme_minimal()+
  scale_color_discrete(name = "Vrsta priponskega\ndrevesa", labels= c(CST="Kompaktno\npriponsko drevo", St="Priponsko drevo",SA="Priponsko polje","SA+LCP"="Priponsko polje z QLCP"))+
  #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                    labels = trans_format("log2", math_format(2^.x)))+
  scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x))+
  labs(y="Čas izgradnje indeksa besedila [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaNovPC.svg",bg = "white", height = 10, width = 20, units = "cm")

dataTidySLO %>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  #geom_smooth(se=F)+
  stat_summary(fun=mean,geom = 'line')+
  theme_minimal()+
  scale_color_discrete(name = "Vrsta priponskega\ndrevesa", labels= c(CST="Kompaktno\npriponsko drevo", St="Priponsko drevo",SA="Priponsko polje","SA+LCP"="Priponsko polje z QLCP"))+
  #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaNovPCSLO.svg",bg = "white", height = 10, width = 20, units = "cm")


# Velikost drevesa

dataTidy %>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  stat_summary(fun=mean,geom = 'line')+
  theme_minimal()+
  scale_color_discrete(name = "Vrsta priponskega\ndrevesa", labels= c(CST="Kompaktno\npriponsko drevo", St="Priponsko drevo",SA="Priponsko polje","SA+LCP"="Priponsko polje z QLCP"))+
  #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x))+
  labs(y="Velikost priponskega drevesa [MB]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesaNovPC.svg",bg = "white", height = 10, width = 20, units = "cm")

dataTidySLO %>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  stat_summary(fun=mean,geom = 'line')+
  theme_minimal()+
  scale_color_discrete(name = "Vrsta priponskega\ndrevesa", labels= c(CST="Kompaktno\npriponsko drevo", St="Priponsko drevo",SA="Priponsko polje","SA+LCP"="Priponsko polje z QLCP"))+
  #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x))+
  labs(y="Velikost priponskega drevesa [MB]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesaNovPCSLO.svg",bg = "white", height = 10, width = 20, units = "cm")



#Iskanje vzorca dolžine 5
data %>% ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5NovPC.png", bg="white")


#Iskanje vzorca dolžine 50

data  %>% ggplot()+
  aes(x=SizeRun,y=tFind50,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 50 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje50NovPc.png", bg="white")


#Iskanje vzorca dolžine 500

data %>% ggplot()+
  aes(x=SizeRun,y=tFind500,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 500 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje500NovPc.png", bg="white")

#Iskanje vzorca dolžine logartem besedila

data %>% ggplot()+
  aes(x=SizeRun,y=tFindLog,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine log(n) [ns]",x="Dolžina besedila")
ggsave("./Img/iskanjeLogNovPc.png", bg="white")


