library(tidyverse)
library(scales)
dataST<- read.csv("rezST.csv")
dataST %>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
  
ggsave("./Img/izgradnjaDrecvesaST.png")

dataST %>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Velikost priponskega drevesa [MB]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesaST.png", bg="white")
dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5ST.png", bg="white")
dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind10,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 10 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje10ST.png", bg="white")
dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind20,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 20 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje20ST.png", bg="white")
dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind40,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 40 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje40ST.png", bg="white")
dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind80,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 80 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje80ST.png", bg="white")

dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind800,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 800 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje800ST.png", bg="white")

dataST %>% ggplot()+
  aes(x=Log,y=tFindLog,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  labs(y="Čas iskanja vzorca dolžine log(n) [ns]",x="Dolžina vzorca log(n)")
ggsave("./Img/iskanjeLogST.png", bg="white")


#Iskanje 500
dataST %>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaST.png")

dataST %>% filter(SizeRun>3000000) %>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaST3000000.png")
dataST %>% filter(SizeRun>4000000) %>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaST4000000.png")


dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5ST.png", bg="white")

dataST %>%filter(SizeRun>4000000) %>%  ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5ST4000000.png", bg="white")

dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind50,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 50 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje50ST.png", bg="white")

dataST %>% filter(SizeRun>4000000) %>% ggplot()+
  aes(x=SizeRun,y=tFind50,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  labs(y="Čas iskanja vzorca dolžine 50 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje50ST4000000.png", bg="white")

dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind500,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 500 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje500ST.png", bg="white")

dataST %>% filter(SizeRun>4000000) %>% ggplot()+
  aes(x=SizeRun,y=tFind500,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  labs(y="Čas iskanja vzorca dolžine 500 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje500ST4000000.png", bg="white")

dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind5000,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5000 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5000ST.png", bg="white")

dataST %>% filter(SizeRun>4000000) %>% ggplot()+
  aes(x=SizeRun,y=tFind5000,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  labs(y="Čas iskanja vzorca dolžine 5000 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5000ST4000000.png", bg="white")

dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind5000.1,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 50000 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje50000ST.png", bg="white")

dataST %>% filter(SizeRun>4000000) %>% ggplot()+
  aes(x=SizeRun,y=tFind5000.1,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  labs(y="Čas iskanja vzorca dolžine 5000 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje50000ST4000000.png", bg="white")


dataST %>% ggplot()+
  aes(x=Log,y=tFindLog,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   scale_color_manual(values=c("#00BFC4"))+
  labs(y="Čas iskanja vzorca dolžine log(n) [ns]",x="Dolžina vzorca log(n)")
ggsave("./Img/iskanjeLogST.png", bg="white")


dataCST<- read.csv("rezCST.csv")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaCST.png", bg="white")

dataCST %>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Velikost priponskega drevesa [MB]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesaCST.png", bg="white")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5CST.png", bg="white")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind10,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 10 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje10CST.png", bg="white")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind20,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 20 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje20CST.png", bg="white")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind40,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 40 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje40CST.png", bg="white")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind80,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 80 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje80CST.png", bg="white")

dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind800,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 800 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje800CST.png", bg="white")

dataCST %>% ggplot()+
  aes(x=Log,y=tFindLog,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  labs(y="Čas iskanja vzorca dolžine log(n) [ns]",x="Dolžina vzorca log(n)")
ggsave("./Img/iskanjeLogCST.png", bg="white")

data<- rbind(dataST,dataCST)
data %>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesa.png", bg="white")

data %>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Velikost priponskega drevesa [MB]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesa.png", bg="white")
data %>% ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5.png", bg="white")
data %>% ggplot()+
  aes(x=SizeRun,y=tFind10,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 10 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje10.png", bg="white")
data %>% ggplot()+
  aes(x=SizeRun,y=tFind20,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 20 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje20.png", bg="white")
data %>% ggplot()+
  aes(x=SizeRun,y=tFind40,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 40 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje40.png", bg="white")
data %>% ggplot()+
  aes(x=SizeRun,y=tFind80,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 80 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje80.png", bg="white")

data %>% ggplot()+
  aes(x=SizeRun,y=tFind800,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 800 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje800.png", bg="white")

data %>% ggplot()+
  aes(x=Log,y=tFindLog,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  labs(y="Čas iskanja vzorca dolžine log(n) [ns]",x="Dolžina vzorca log(n)")
ggsave("./Img/iskanjeLog.png", bg="white")

