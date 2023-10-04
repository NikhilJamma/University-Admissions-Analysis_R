library(faraway)
library(car)
#install.packages("GGally")

library(GGally)
library(ggplot2)
library(tidyverse)
library(mlbench)#install.packages("olsrr")
library(olsrr)
library(broom)
library(randomForest)
#install.packages("caret")
library(caret)

da<-read.csv("adm_data.csv", header=TRUE)

colnames(da)
da[da$Research == 0,]$Research <- "No"

da[da$Research == 1,]$Research <- "Yes" #Giving meaningful names to Research column

da <- da[,-1] #Removing Serial No column as it has no predictive power


da$Research <- as.factor(da$Research)

str(da)

ggpairs(da)+
theme(axis.text.x = element_text(size=4),axis.text.y = element_text(size=4))
#We can see that Admit chance and CGPA have the highest correlation


#LINEAR REGRESSION
lm.all <- lm(Chance.of.Admit ~.,data=da)
summary(lm.all)

plot(lm.all)

#cleandata<-da[-c(93,41,92),]


ols_plot_cooksd_bar(lm.all)


#Fitting backward model
bmodel<-step(lm.all,direction="backward")

par(mfrow=c(2,2))
plot(bmodel)


##Logistic Regression

table(da['Chance.of.Admit'])

da['Chance.of.Admit'][da['Chance.of.Admit']<=0.50] = 0
da['Chance.of.Admit'][da['Chance.of.Admit']>0.50] = 1

da[da$Chance.of.Admit == 0,]$Chance.of.Admit <- "No"

da[da$Chance.of.Admit == 1,]$Chance.of.Admit <- "Yes"

set.seed(2)
n <- nrow(da)
trainx <- sample(n, trunc(0.70*n))
training <- da[trainx, ]
testing <- da[-trainx, ]

training$Chance.of.Admit <- as.factor(training$Chance.of.Admit)


lmodel<- glm(Chance.of.Admit~.,family = binomial,data=training)
summary(lmodel)

probability <- lmodel %>% predict(testing, type = "response")

prediction <- ifelse(probability > 0.5, "Yes", "No")

merror<-mean(prediction != testing$Chance.of.Admit)
merror
accuracy <- 1-merror
accuracy

##Random Forest
set.seed(2)
rforestx<-randomForest(Chance.of.Admit~., training, ntree=5000,mtry=4,importance=TRUE,na.action=na.roughfix)

varImpPlot(rforestx,main = "Importance of predictors",type=1)
importance(rforestx)

