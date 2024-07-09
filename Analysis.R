library(tidyverse)
library(scales)
data<- read.csv("rez.csv")
data %>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesa.png")

data %>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Velikost priponskega drevesa [B]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesa.png")
data %>% ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ms]",x="Dolžina besedila")
ggsave("./Img/iskanje5.png")
data %>% ggplot()+
  aes(x=SizeRun,y=tFind10,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 10 [ms]",x="Dolžina besedila")
ggsave("./Img/iskanje10.png")
data %>% ggplot()+
  aes(x=SizeRun,y=tFind20,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 20 [ms]",x="Dolžina besedila")
ggsave("./Img/iskanje20.png")
data %>% ggplot()+
  aes(x=SizeRun,y=tFind40,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 40 [ms]",x="Dolžina besedila")
ggsave("./Img/iskanje40.png")
data %>% ggplot()+
  aes(x=SizeRun,y=tFind80,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="50 [ms]",x="Dolžina besedila")
ggsave("./Img/iskanje80.png")
