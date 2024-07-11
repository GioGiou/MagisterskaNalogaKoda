library(tidyverse)
library(scales)
dataSTST<- read.csv("rezST.csv")
dataST %>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaST.png")

dataST %>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Velikost priponskega drevesa [MB]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesaST.png")
dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5ST.png")
dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind10,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 10 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje10ST.png")
dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind20,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 20 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje20ST.png")
dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind40,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 40 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje40ST.png")
dataST %>% ggplot()+
  aes(x=SizeRun,y=tFind80,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 80 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje80ST.png")

dataCST<- read.csv("rezST.csv")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaCST.png")

dataCST %>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Velikost priponskega drevesa [MB]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesaCST.png")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5CST.png")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind10,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 10 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje10CST.png")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind20,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 20 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje20CST.png")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind40,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 40 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje40CST.png")
dataCST %>% ggplot()+
  aes(x=SizeRun,y=tFind80,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 80 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje80CST.png")