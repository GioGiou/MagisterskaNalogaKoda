library(tidyverse)
library(scales)
data<- read.csv("rez.csv")
data %>% ggplot()+
  aes(x=sizeRun,y=Time,color=Type)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")

data %>% ggplot()+
  aes(x=sizeRun,y=SizeInBytes,color=Type)+
  geom_point()+
  geom_smooth(se=F)+
  theme_minimal()+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Velikost priponskega drevesa [B]",x="Dolžina besedila")
