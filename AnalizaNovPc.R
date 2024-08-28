library(tidyverse)
library(scales)
data<- read.csv("rezNovPc.csv")


#Izgradnja drevesa
data%>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  #scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x),
  #                  labels = trans_format("log2", math_format(10^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaNovPC.png")

data%>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x),
                     labels = trans_format("log2", math_format(10^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaNovPCzylog.png")

data %>% filter(TypeOfDS=="St")%>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  #scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x),
  #                  labels = trans_format("log2", math_format(10^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaNovPCST.png") 

data %>% filter(TypeOfDS=="St")%>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x),
                     labels = trans_format("log2", math_format(10^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaNovPCSTylog.png") 

data %>% filter(TypeOfDS=="CST")%>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  #scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x),
  #                   labels = trans_format("log2", math_format(10^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaNovPCCST.png")

data %>% filter(TypeOfDS=="CST")%>% ggplot()+
  aes(x=SizeRun,y=Time,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  scale_y_continuous(trans = log10_trans(), breaks = trans_breaks("log10", function(x) 10^x),
                     labels = trans_format("log2", math_format(10^.x)))+
  labs(y="Čas izgradnje priponskega drevesa [ms]",x="Dolžina besedila")
ggsave("./Img/izgradnjaDrecvesaNovPCCSTylog.png")


# Velikost drevesa

data %>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   
  #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Velikost priponskega drevesa [MB]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesaNovPC.png", bg="white")

data %>% filter(TypeOfDS=="St") %>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   
  scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Velikost priponskega drevesa [MB]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesaNovPCST.png", bg="white")


data%>% filter(TypeOfDS=="CST")%>% ggplot()+
  aes(x=SizeRun,y=SizeInBytes,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   
  #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Velikost priponskega drevesa [MB]",x="Dolžina besedila")
ggsave("./Img/velikostDrecvesaNovPCCST.png", bg="white")

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

data %>% filter(TypeOfDS=="St") %>% ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5NovPCST.png", bg="white")

data%>% filter(TypeOfDS=="CST") %>% ggplot()+
  aes(x=SizeRun,y=tFind5,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 5 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje5NovPCCST.png", bg="white")

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

data %>% filter(TypeOfDS=="St") %>% ggplot()+
  aes(x=SizeRun,y=tFind50,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 50 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje50NovPcST.png", bg="white")

data %>% filter(TypeOfDS=="CST") %>% ggplot()+
  aes(x=SizeRun,y=tFind50,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 50 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje50NovPcCST.png", bg="white")

#Iskanje vzorca dolžine 500

data %>% ggplot()+
  aes(x=SizeRun,y=tFind500,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 500 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje20ST.png", bg="white")

data %>% filter(TypeOfDS=="St") %>% ggplot()+
  aes(x=SizeRun,y=tFind500,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 500 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje20ST.png", bg="white")

data %>% filter(TypeOfDS=="CST") %>% ggplot()+
  aes(x=SizeRun,y=tFind500,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine 500 [ns]",x="Dolžina besedila")
ggsave("./Img/iskanje20ST.png", bg="white")

#Iskanje vzorca dolžine logartem besedila

data %>% ggplot()+
  aes(x=SizeRun,y=tFindLog,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine log(n) [ns]",x="Dolžina besedila")
ggsave("./Img/iskanjeLog.png", bg="white")

data %>% filter(TypeOfDS=="St") %>% ggplot()+
  aes(x=SizeRun,y=tFindLog,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+
  scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine log(n) [ns]",x="Dolžina besedila")
ggsave("./Img/iskanjeLogST.png", bg="white")

data %>% filter(TypeOfDS=="CST") %>% ggplot()+
  aes(x=SizeRun,y=tFindLog,color=TypeOfDS)+
  geom_point()+
  geom_smooth(se=F)+stat_summary(fun=mean,geom = 'line',linetype = 'dotted')+
  theme_minimal()+   #scale_color_manual(values=c("#00BFC4"))+
  scale_x_continuous(trans = log2_trans(), breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))+
  labs(y="Čas iskanja vzorca dolžine log(n) [ns]",x="Dolžina besedila")
ggsave("./Img/iskanjeLogCST.png", bg="white")
