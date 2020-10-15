# load the data
charity <- read.csv(file.choose()) # load the "charity.csv" file

#1 - exploratory data analysis
library(psych)
describe(charity)
summary(charity)
charity = charity[,-1]
colnames(charity)
str(charity)

#correlation
library(corrplot)
library(corrgram)
par(mfrow=c(1,1))
corrplot(corrgram(charity), method="square")
library(ggplot2)
ctrain<- subset(charity,charity$part=="train")
ctest<- subset(charity,charity$part=="test")
cvalid<- subset(charity,charity$part=="valid")

#visually represent the numeric variables
library(purrr)
library(tidyr)
ctrain[,-1] %>%
  keep(is.numeric) %>%
  gather() %>%
  ggplot(aes(value)) + 
  facet_wrap(~ key, scales = "free") + 
  geom_density()

#visually represent the categorical variables
charity.cat <- c("reg1","reg2","reg3","reg4","home","chld", "hinc", "genf","wrat", "donr","part")

ctrain[,charity.cat] %>%
  gather() %>%
  ggplot(aes(value)) + 
  facet_wrap(~key, scales = "free") + 
  geom_bar()

par(mfrow=c(5,5))
boxplot(ctrain$agif)
boxplot(ctrain$avhv)
boxplot(ctrain$chld)
boxplot(ctrain$damt)
boxplot(ctrain$donr)
boxplot(ctrain$genf)
boxplot(ctrain$hinc)
boxplot(ctrain$home)
boxplot(ctrain$inca)
boxplot(ctrain$incm)
boxplot(ctrain$lgif)
boxplot(ctrain$npro)
boxplot(ctrain$plow)
boxplot(ctrain$reg2)
boxplot(ctrain$reg3)
boxplot(ctrain$reg4)
boxplot(ctrain$tdon) 
boxplot(ctrain$tgif)
boxplot(ctrain$tlag)
boxplot(ctrain$wrat)