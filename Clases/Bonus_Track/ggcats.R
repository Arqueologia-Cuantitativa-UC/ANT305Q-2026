#BONUS TRACK

#ggcats
data <- Estatura_humero
install.packages("remotes")
remotes::install_github("R-CoderDotCom/ggcats@main")
library(ggcats)
library(ggplot2)

ggplot(data=data, aes(x=Estatura, y=Largo))+ geom_cat (cat="nyancat", size=4)+xlab(expression("Estatura (cm)"))+ylab(expression("Largo Húmero (cm)"))

ggplot(data=data, aes(x=Estatura, y=Largo))+ geom_cat (cat="pusheen", size=4)+ theme_bw()+xlab(expression("Estatura (cm)"))+ylab(expression("Largo Húmero (cm)"))


ggplot(data=data, aes(x=Estatura, y=Largo))+ geom_cat (cat="pusheen_pc", size=4)+ theme_bw()+xlab(expression("Estatura (cm)"))+ylab(expression("Largo Húmero (cm)"))

#ggdogs

install.packages("remotes")
remotes::install_github("R-CoderDotCom/ggdogs@main")
library(ggdogs)
library(ggplot2)

grid <- expand.grid(1:5, 3:1)

df <- data.frame(x = grid[, 1],
                 y = grid[, 2],
                 image = c("doge", "doge_strong", "chihuahua",
                           "eyes", "gabe", "glasses",
                           "tail", "surprised", "thisisfine",
                           "hearing", "pug", "ears",
                           "husky", "husky_2", "chilaquil"))


ggplot(data, aes(x=Estatura, y=Largo))+geom_point()+geom_dog(dog="thisisfine", size=5)
ggplot(data, aes(x=Estatura, y=Largo))+geom_point()+geom_dog(dog="husky", size=5)
ggplot(data, aes(x=Estatura, y=Largo))+geom_point()+geom_dog(dog="glasses", size=5)
ggplot(data, aes(x=Estatura, y=Largo))+geom_point()+geom_dog(dog="doge", size=5)
ggplot(data, aes(x=Estatura, y=Largo))+geom_point()+geom_dog(dog="gabe", size=5)
ggplot(data, aes(x=Estatura, y=Largo))+geom_point()+geom_dog(dog="surprised", size=5)

ggplot(data, aes(x=Estatura, y=Largo))+geom_point()+geom_dog(dog="tail", size=5)